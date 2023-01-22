from d3tl.interfaces.handlers.bids_and_asks.interface import iBidsAndAsksHandler

from d3f1nance.uniswap.UniswapV3Pool import UniSwapV3PoolContract
from d3f1nance.uniswap.UniswapV2Pair import UniSwapV2PairContract
from raffaelo.contracts.erc20.contract import ERC20TokenContract

import datetime
import requests

from web3.middleware import geth_poa_middleware
from web3.logs import DISCARD
from web3._utils.events import get_event_data
from web3 import Web3
from web3.exceptions import MismatchedABI


class UniSwapV2BidsAndAsksHandler(UniSwapV2PairContract, iBidsAndAsksHandler):
    _FEE = 0.003

    def __init__(
            self,
            uri: str, api_key: str, block_limit: int,
            *args, **kwargs
    ) -> None:
        UniSwapV2PairContract.__init__(self, *args, **kwargs)
        iBidsAndAsksHandler.__init__(self, uri=uri, api_key=api_key, block_limit=block_limit)

    def get_overview(
            self,
            is_reverse: bool,
            start: datetime.datetime, end: datetime.datetime,
            *args, **kwargs
    ):
        rStart = requests.get(self.api_uri.format(timestamp=int(start.timestamp()))).json()['result']
        rEnd = requests.get(self.api_uri.format(timestamp=int(end.timestamp()))).json()['result']
        startBlock = int(rStart)
        endBlock = int(rEnd)

        w3 = Web3(self.node)
        w3.middleware_onion.inject(
            geth_poa_middleware,
            layer=0
        )

        t0Address, t1Address = self.token0(), self.token1()
        t0 = ERC20TokenContract(address=t0Address, provider=self.provider)
        t1 = ERC20TokenContract(address=t1Address, provider=self.provider)

        t0Decimals, t1Decimals = t0.decimals(), t1.decimals()

        t0Symbol, t1Symbol = t0.symbol(), t1.symbol()
        poolSymbol = f'{t0Symbol}/{t1Symbol}' if not is_reverse else f'{t1Symbol}/{t0Symbol}'

        eventSwap, eventCodec, eventABI = self.contract.events.Sync, self.contract.events.Sync.web3.codec, self.contract.events.Sync._get_event_abi()
        overview = list()
        while startBlock < endBlock:
            events = w3.eth.get_logs(
                {
                    'fromBlock': startBlock,
                    'toBlock': startBlock + self.block_limit,
                    'address': self.contract.address
                }
            )
            startBlock += self.block_limit
            for event in events:
                try:
                    event_data = get_event_data(
                        abi_codec=eventCodec,
                        event_abi=eventABI,
                        log_entry=event
                    )
                except MismatchedABI:
                    continue
                ts = w3.eth.getBlock(event_data['blockNumber']).timestamp
                if ts > end.timestamp():
                    break
                r0, r1 = event_data['args']['reserve0'] / 10 ** t0Decimals, event_data['args']['reserve1'] / 10 ** t1Decimals

                receipt = w3.eth.get_transaction_receipt(event_data['transactionHash'].hex())

                transfers = self.contract.events.Swap().processReceipt(receipt, errors=DISCARD)
                amount0, amount1 = None, None
                for transfer in transfers:
                    if transfer['address'] == self.contract.address:
                        amount0 = transfer['args']['amount0In'] / 10 ** t0Decimals if transfer['args']['amount0In'] else transfer['args']['amount0Out'] / 10 ** t0Decimals * -1
                        amount1 = transfer['args']['amount1In'] / 10 ** t1Decimals if transfer['args']['amount1In'] else transfer['args']['amount1Out'] / 10 ** t1Decimals * -1
                        break
                if not amount0 or not amount1:
                    continue
                price = r0 / r1 if is_reverse else r1 / r0
                bid = r0 / r1 * (1 - self._FEE) if is_reverse else r1 / r0 * (1 - self._FEE)
                ask = r0 / r1 * (1 + self._FEE) if is_reverse else r1 / r0 * (1 - self._FEE)
                overview.append(
                    {
                        'symbol': poolSymbol,
                        'bid': bid,
                        'ask': ask,
                        'price': price,
                        'sender': receipt['from'],
                        'amount0': amount0,
                        'amount1': amount1,
                        'gas_used': receipt['gasUsed'],
                        'effective_gas_price': receipt['effectiveGasPrice'] / 10 ** 18,
                        'tx_hash': event_data['transactionHash'].hex(),
                        'time': datetime.datetime.utcfromtimestamp(ts)
                    }
                )
        return overview


class UniSwapV3BidsAndAsksHandler(UniSwapV3PoolContract, iBidsAndAsksHandler):
    _FEE = 0.0005

    def __init__(
            self,
            uri: str, api_key: str, block_limit: int,
            *args, **kwargs
    ) -> None:
        UniSwapV3PoolContract.__init__(self, *args, **kwargs)
        iBidsAndAsksHandler.__init__(self, uri=uri, api_key=api_key, block_limit=block_limit)

    @staticmethod
    def _get_uni_v3_price(
            d0: int, d1: int,
            liquidity: float, sqrt: float
    ):
        a0 = 10 ** d0
        return abs(((liquidity * ((1 / ((a0 / liquidity) + 1 / (sqrt / 2 ** 96))) - sqrt / 2 ** 96)) / 10 ** d1) / (a0 / 10 ** d0))

    def _get_uni_v3_sell_price(
            self,
            d0: int, d1: int,
            liquidity: float, sqrt: float
    ):
        a0 = 10 ** d0
        return abs(((liquidity * ((1 / ((a0 * (1 - self._FEE) / liquidity) + 1 / (sqrt / 2 ** 96))) - sqrt / 2 ** 96)) / 10 ** d1) / (a0 / 10 ** d0))

    def _get_uni_v3_buy_price(
            self,
            d0: int, d1: int,
            liquidity: float, sqrt: float
    ):
        a1 = 10 ** d1
        return abs(a1 / 10 ** d1 / ((2 ** 96 / sqrt - 1 / (sqrt / 2 ** 96 - a1 * (1 - self._FEE) / liquidity)) * liquidity) * 10 ** d0)

    def get_overview(
            self,
            is_reverse: bool,
            start: datetime.datetime, end: datetime.datetime,
            *args, **kwargs
    ):
        rStart = requests.get(self.api_uri.format(timestamp=int(start.timestamp()))).json()['result']
        rEnd = requests.get(self.api_uri.format(timestamp=int(end.timestamp()))).json()['result']

        startBlock = int(rStart)
        endBlock = int(rEnd)

        w3 = Web3(self.node)
        w3.middleware_onion.inject(
            geth_poa_middleware,
            layer=0
        )

        t0Address, t1Address = self.token0(), self.token1()
        t0 = ERC20TokenContract(address=t0Address, provider=self.provider)
        t1 = ERC20TokenContract(address=t1Address, provider=self.provider)

        t0Decimals, t1Decimals = t0.decimals(), t1.decimals()

        t0Symbol, t1Symbol = t0.symbol(), t1.symbol()
        poolSymbol = f'{t0Symbol}/{t1Symbol}' if not is_reverse else f'{t1Symbol}/{t0Symbol}'

        eventSwap, eventCodec, eventABI = self.contract.events.Swap, self.contract.events.Swap.web3.codec, self.contract.events.Swap._get_event_abi()

        overview = list()
        while startBlock < endBlock:
            events = w3.eth.get_logs(
                {
                    'fromBlock': startBlock,
                    'toBlock': startBlock + self.block_limit,
                    'address': self.contract.address
                }
            )
            startBlock += self.block_limit
            for event in events:
                try:
                    event_data = get_event_data(
                        abi_codec=eventCodec,
                        event_abi=eventABI,
                        log_entry=event
                    )
                except MismatchedABI:
                    continue
                ts = w3.eth.getBlock(event_data['blockNumber']).timestamp
                if ts > end.timestamp():
                    break
                sqrtP, liquidity = event_data['args']['sqrtPriceX96'], event_data['args']['liquidity']

                bid = 1 / self._get_uni_v3_buy_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                ) if is_reverse else self._get_uni_v3_sell_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                )
                ask = 1 / self._get_uni_v3_sell_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                ) if is_reverse else self._get_uni_v3_buy_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                )
                price = 1 / self._get_uni_v3_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                ) if is_reverse else self._get_uni_v3_price(
                    d0=t0Decimals,
                    d1=t1Decimals,
                    liquidity=liquidity,
                    sqrt=sqrtP
                )
                receipt = w3.eth.get_transaction_receipt(event_data['transactionHash'].hex())
                overview.append(
                    {
                        'symbol': poolSymbol,
                        'bid': bid,
                        'ask': ask,
                        'price': price,
                        'sender': receipt['from'],
                        'amount0': event_data['args']['amount0'] / 10 ** t0Decimals,
                        'amount1': event_data['args']['amount1'] / 10 ** t1Decimals,
                        'gas_used': receipt['gasUsed'] / 10 ** 18,
                        'effective_gas_price': receipt['effectiveGasPrice'] / 10 ** 18,
                        'tx_hash': event_data['transactionHash'].hex(),
                        'time': datetime.datetime.utcfromtimestamp(ts)
                    }
                )
        return overview
