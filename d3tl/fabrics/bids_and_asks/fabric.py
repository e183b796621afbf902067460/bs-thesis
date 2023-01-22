from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.bids_and_asks.typing import BidsAndAsksHandler

from d3tl.handlers.bids_and_asks.uniswap.handlers import UniSwapV2BidsAndAsksHandler, UniSwapV3BidsAndAsksHandler
from d3tl.handlers.bids_and_asks.quickswap.handlers import QuickSwapV2BidsAndAsksHandler, QuickSwapV3BidsAndAsksHandler


class BidsAndAsksFabric(iFabric):

    def add_handler(self, protocol: str, handler: Generic[BidsAndAsksHandler]) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = handler

    def get_handler(self, protocol: str) -> Generic[BidsAndAsksHandler]:
        handler = self._handlers.get(protocol)
        if not handler:
            raise ValueError(f'Set Bids and Asks overview handler for {protocol}')
        return handler


bidsAndAsksFabric = BidsAndAsksFabric()

bidsAndAsksFabric.add_handler(protocol='uniswapV2', handler=UniSwapV2BidsAndAsksHandler)
bidsAndAsksFabric.add_handler(protocol='uniswapV3', handler=UniSwapV3BidsAndAsksHandler)
bidsAndAsksFabric.add_handler(protocol='quickswapV2', handler=QuickSwapV2BidsAndAsksHandler)
bidsAndAsksFabric.add_handler(protocol='quickswapV3', handler=QuickSwapV3BidsAndAsksHandler)
