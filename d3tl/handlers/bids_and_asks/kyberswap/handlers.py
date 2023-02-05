from d3f1nance.kyberswap.Pool import KyberSwapPoolContract
from d3tl.handlers.bids_and_asks.uniswap.handlers import UniSwapV3BidsAndAsksHandler

from raffaelo.contracts.erc20.contract import ERC20TokenContract

import datetime
import requests

from web3.middleware import geth_poa_middleware
from web3._utils.events import get_event_data
from web3 import Web3
from web3.exceptions import MismatchedABI


class KyberSwapV2BidsAndAsksHandler(KyberSwapPoolContract, UniSwapV3BidsAndAsksHandler):
    _FEE = None

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
        self._FEE = self.swapFeeUnits() / 10 ** 4

        t0_address, t1_address = self.token0(), self.token1()
        t0 = ERC20TokenContract(address=t0_address, provider=self.provider)
        t1 = ERC20TokenContract(address=t1_address, provider=self.provider)

        t0_decimals, t1_decimals = t0.decimals(), t1.decimals()

        t0_symbol, t1_symbol = t0.symbol(), t1.symbol()
        pool_symbol = f'{t0_symbol}/{t1_symbol}' if not is_reverse else f'{t1_symbol}/{t0_symbol}'

        event_swap, event_codec, event_abi = self.contract.events.Swap, self.contract.events.Swap.web3.codec, self.contract.events.Swap._get_event_abi()

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
                sqrt_p, liquidity = event_data['args']['sqrtP'], event_data['args']['liquidity']

                bid = 1 / self._get_uni_v3_buy_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                ) if is_reverse else self._get_uni_v3_sell_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                )
                ask = 1 / self._get_uni_v3_sell_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                ) if is_reverse else self._get_uni_v3_buy_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                )
                price = 1 / self._get_uni_v3_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                ) if is_reverse else self._get_uni_v3_price(
                    d0=t0_decimals,
                    d1=t1_decimals,
                    liquidity=liquidity,
                    sqrt=sqrt_p
                )
                receipt = w3.eth.get_transaction_receipt(event_data['transactionHash'].hex())
                overview.append(
                    {
                        'symbol': pool_symbol,
                        'bid': bid,
                        'ask': ask,
                        'price': price,
                        'sender': receipt['from'],
                        'amount0': event_data['args']['deltaQty0'] / 10 ** t0_decimals,
                        'amount1': event_data['args']['deltaQty1'] / 10 ** t1_decimals,
                        'gas_used': receipt['gasUsed'] / 10 ** 18,
                        'effective_gas_price': receipt['effectiveGasPrice'] / 10 ** 18,
                        'gas_symbol': self.gas_symbol,
                        'gas_price': self.trader.get_price(first=self.gas_symbol),
                        'index_position_in_the_block': receipt['transactionIndex'],
                        'tx_hash': event_data['transactionHash'].hex(),
                        'time': datetime.datetime.utcfromtimestamp(ts)
                    }
                )
        return overview
