from d3f1nance.velodrome.Pair import VelodromePairContract
from d3f1nance.velodrome.PairFactory import VelodromePairFactoryContract
from d3tl.consts.chains.consts import OPTIMISM
from d3tl.handlers.bids_and_asks.uniswap.handlers import UniSwapV2BidsAndAsksHandler

from raffaelo.contracts.erc20.contract import ERC20TokenContract

import datetime
import requests

from web3.middleware import geth_poa_middleware
from web3._utils.events import get_event_data
from web3.logs import DISCARD
from web3 import Web3
from web3.exceptions import MismatchedABI, TransactionNotFound


class VelodromeBidsAndAsksHandler(VelodromePairContract, UniSwapV2BidsAndAsksHandler):
    _FEE = None

    _factories_addresses = {
        OPTIMISM: '0x25CbdDb98b35ab1FF77413456B31EC81A6B6B746'
    }

    def get_overview(
            self,
            is_reverse: bool,
            start: datetime.datetime, end: datetime.datetime,
            *args, **kwargs
    ):
        r_start = requests.get(self.api_uri.format(timestamp=int(start.timestamp()))).json()['result']
        r_end = requests.get(self.api_uri.format(timestamp=int(end.timestamp()))).json()['result']
        start_block = int(r_start)
        end_block = int(r_end)

        w3 = Web3(self.node)
        w3.middleware_onion.inject(
            geth_poa_middleware,
            layer=0
        )

        is_stable = self.stable()
        factory = VelodromePairFactoryContract(address=self._factories_addresses[self.chain], provider=self.provider)
        self._FEE = factory.getFee(isStable=is_stable) / 10 ** 4

        t0_address, t1_address = self.token0(), self.token1()
        t0 = ERC20TokenContract(address=t0_address, provider=self.provider)
        t1 = ERC20TokenContract(address=t1_address, provider=self.provider)

        t0_decimals, t1_decimals = t0.decimals(), t1.decimals()
        t0_decimals, t1_decimals = t0_decimals if not is_reverse else t1_decimals, t1_decimals if not is_reverse else t0_decimals

        t0_symbol, t1_symbol = t0.symbol(), t1.symbol()
        pool_symbol = f'{t0_symbol}/{t1_symbol}' if not is_reverse else f'{t1_symbol}/{t0_symbol}'

        event_swap, event_codec, event_abi = self.contract.events.Sync, self.contract.events.Sync.web3.codec, self.contract.events.Sync._get_event_abi()
        overview = list()
        while start_block < end_block:
            events = w3.eth.get_logs(
                {
                    'fromBlock': start_block,
                    'toBlock': start_block + self.block_limit,
                    'address': self.contract.address
                }
            )
            start_block += self.block_limit
            for event in events:
                try:
                    event_data = get_event_data(
                        abi_codec=event_codec,
                        event_abi=event_abi,
                        log_entry=event
                    )
                except MismatchedABI:
                    continue
                ts = w3.eth.getBlock(event_data['blockNumber']).timestamp
                if ts > end.timestamp():
                    break
                r0, r1 = event_data['args']['reserve0'], event_data['args']['reserve1']

                try:
                    receipt = w3.eth.get_transaction_receipt(event_data['transactionHash'].hex())
                    tx = w3.eth.get_transaction(event_data['transactionHash'])
                except TransactionNotFound:
                    continue

                tx_index = int(tx['index'], 16)

                transfers = self.contract.events.Swap().processReceipt(receipt, errors=DISCARD)
                amount0, amount1 = None, None
                for transfer in transfers:
                    if transfer['address'] == self.contract.address:
                        amount0 = transfer['args']['amount0In'] if transfer['args'][
                            'amount0In'] else transfer['args']['amount0Out'] * -1
                        amount1 = transfer['args']['amount1In'] if transfer['args'][
                            'amount1In'] else transfer['args']['amount1Out'] * -1
                        break
                if not amount0 or not amount1:
                    continue
                amount0, amount1 = amount0 if not is_reverse else amount1, amount1 if not is_reverse else amount0
                try:
                    price = abs((amount1 / 10 ** t1_decimals) / (amount0 / 10 ** t0_decimals))
                    recipient = receipt['to']
                except (ZeroDivisionError, KeyError):
                    continue
                overview.append(
                    {
                        'symbol': pool_symbol,
                        'price': price,
                        'sender': receipt['from'],
                        'recipient': recipient,
                        'reserve0': r0 if not is_reverse else r1,
                        'reserve1': r1 if not is_reverse else r0,
                        'amount0': amount0,
                        'amount1': amount1,
                        'decimals0': t0_decimals,
                        'decimals1': t1_decimals,
                        'fee': self._FEE,
                        'gas_used': int(receipt['l1GasUsed'], 16),
                        'effective_gas_price': int(receipt['l1GasPrice'], 16) / 10 ** 18,
                        'gas_symbol': self.gas_symbol,
                        'index_position_in_the_block': tx_index,
                        'tx_hash': event_data['transactionHash'].hex(),
                        'time': datetime.datetime.utcfromtimestamp(ts)
                    }
                )
        return overview
