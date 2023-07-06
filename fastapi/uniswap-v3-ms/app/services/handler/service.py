from typing import Iterable
import datetime

from web3 import Web3

from raffaelo_uniswap_v3.pool.contract import UniSwapV3PoolContract

from bs_infrastructure.decorators.listen.decorator import listen
from bs_infrastructure.decorators.by_default.decorator import by_default

from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class EventHandlerService(UniSwapV3PoolContract):

    def pull(
            self,
            w3: Web3,
            blockchain: str,
            protocol: str,
            is_reverse: bool
    ) -> Iterable:

        @listen
        def handle() -> Iterable:
            for swap in block_filter.get_new_entries():
                tx_hash = swap.transactionHash.hex()

                t0_amount, t1_amount = swap.args.amount0 / 10 ** t0_decimals, swap.args.amount1 / 10 ** t1_decimals
                price = abs(t1_amount / t0_amount)
                side = 'SELL' if t0_amount > 0 else 'BUY'

                ts = w3.eth.get_block(swap.blockNumber).timestamp
                dt = str(datetime.datetime.fromtimestamp(int(ts)))

                yield self._address, dt, price, side, t0_symbol, t1_symbol, t0_amount, t1_amount, tx_hash, protocol, blockchain

        t0, t1 = self.token0() if not is_reverse else self.token1(), self.token1() if not is_reverse else self.token0()
        t0_decimals, t1_decimals = t0.decimals(), t1.decimals()
        t0_symbol, t1_symbol = t0.symbol(), t1.symbol()

        block_filter = self.contract.events.Swap.create_filter(fromBlock='latest')

        for event in handle(): yield event


@by_default(provider=spawn_provider_resource)
def spawn_handler_resource(address: str, provider: ProviderResource) -> EventHandlerService:
    return EventHandlerService(address=address, provider=provider.polygon)
