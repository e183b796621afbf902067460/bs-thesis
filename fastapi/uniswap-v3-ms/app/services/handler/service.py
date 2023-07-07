from typing import Iterable
import datetime

from web3 import Web3

from raffaelo_uniswap_v3.pool.contract import UniSwapV3PoolContract

from python.decorators.listen.decorator import listen
from python.decorators.by_default.decorator import by_default

from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class EventHandlerService(UniSwapV3PoolContract):

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
                'q_real_time_tx_processing_blockchain': tx[8]
            }

        @listen(parse_func=parse)
        def handle() -> Iterable:
            for swap in block_filter.get_new_entries():
                tx_hash = swap.transactionHash.hex()

                t0_amount, t1_amount = swap.args.amount0 / 10 ** t0_decimals, swap.args.amount1 / 10 ** t1_decimals

                ts = w3.eth.get_block(swap.blockNumber).timestamp
                dt = str(datetime.datetime.fromtimestamp(int(ts)))

                yield self._address, dt, t0_symbol, t1_symbol, t0_amount, t1_amount, tx_hash, protocol, blockchain

        t0, t1 = self.token0() if not is_reverse else self.token1(), self.token1() if not is_reverse else self.token0()
        t0_decimals, t1_decimals = t0.decimals(), t1.decimals()
        t0_symbol, t1_symbol = t0.symbol(), t1.symbol()

        block_filter = self.contract.events.Swap.create_filter(fromBlock='latest')

        for event in handle(): yield event


@by_default(provider=spawn_provider_resource)
def spawn_handler_resource(address: str, provider: ProviderResource) -> EventHandlerService:
    return EventHandlerService(address=address, provider=provider.polygon)