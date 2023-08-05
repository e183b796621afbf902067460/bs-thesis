from typing import Iterable
import datetime

from web3 import Web3

from raffaelo_quickswap_v3.pool.contract import QuickSwapV3AlgebraPoolContract

from python.decorators.listen.decorator import listen
from python.decorators.by_default.decorator import by_default

from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class EventHandlerService(QuickSwapV3AlgebraPoolContract):

    def pull(
            self,
            w3: Web3,
            blockchain: str,
            protocol: str,
            is_reverse: bool
    ) -> Iterable:

        def parse(tx: list):
            return {
                'q_real_time_tx_processing_address': tx[0],
                'q_real_time_tx_processing_timestamp': tx[1],
                'q_real_time_tx_processing_t0_symbol': tx[2],
                'q_real_time_tx_processing_t1_symbol': tx[3],
                'q_real_time_tx_processing_t0_amount': tx[4],
                'q_real_time_tx_processing_t1_amount': tx[5],
                'q_real_time_tx_processing_tx_hash': tx[6],
                'q_real_time_tx_processing_protocol': tx[7],
                'q_real_time_tx_processing_blockchain': tx[8],
                'q_real_time_tx_processing_swap_side': tx[9],
                'q_real_time_tx_processing_swap_maker': tx[10],
                'q_real_time_tx_processing_swap_quote_price': tx[11]
            }

        @listen(parse_func=parse)
        def handle() -> Iterable:
            for swap in block_filter.get_new_entries():
                tx_hash = swap.transactionHash.hex()

                t0_amount = swap.args.amount0 / 10 ** t0_decimals if not is_reverse else swap.args.amount0 / 10 ** t1_decimals
                t1_amount = swap.args.amount1 / 10 ** t1_decimals if not is_reverse else swap.args.amount1 / 10 ** t0_decimals
                t0_amount, t1_amount = t0_amount if not is_reverse else t1_amount, t1_amount if not is_reverse else t0_amount

                swap_side = 'SELL' if t0_amount > 0 else 'BUY'
                swap_maker = swap.args.recipient
                swap_quote_price = abs(t1_amount / t0_amount)

                ts = w3.eth.get_block(swap.blockNumber).timestamp
                dt = str(datetime.datetime.fromtimestamp(int(ts)))

                yield self._address, dt, t0_symbol, t1_symbol, t0_amount, t1_amount, tx_hash, protocol, blockchain, swap_side, swap_maker, swap_quote_price

        t0, t1 = self.token0() if not is_reverse else self.token1(), self.token1() if not is_reverse else self.token0()
        t0_decimals, t1_decimals = t0.decimals(), t1.decimals()
        t0_symbol, t1_symbol = t0.symbol(), t1.symbol()

        block_filter = self.contract.events.Swap.create_filter(fromBlock='latest')

        for event in handle(): yield event


@by_default(provider=spawn_provider_resource)
def spawn_polygon_handler(address: str, provider: ProviderResource) -> EventHandlerService:
    return EventHandlerService(address=address, provider=provider.polygon)


@by_default(provider=spawn_provider_resource)
def spawn_ethereum_handler(address: str, provider: ProviderResource) -> EventHandlerService:
    return EventHandlerService(address=address, provider=provider.ethereum)


@by_default(provider=spawn_provider_resource)
def spawn_arbitrum_handler(address: str, provider: ProviderResource) -> EventHandlerService:
    return EventHandlerService(address=address, provider=provider.arbitrum)
