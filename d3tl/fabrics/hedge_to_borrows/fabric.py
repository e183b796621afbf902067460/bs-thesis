from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.hedge_to_borrows.typing import HedgeToBorrowsHandler

from d3tl.handlers.hedge_to_borrows.aave.handlers import AaveV3HedgeToBorrowsHandler


class HedgeToBorrowsFabric(iFabric):

    def add_handler(self, protocol: str, handler: Generic[HedgeToBorrowsHandler]) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = handler

    def get_handler(self, protocol: str) -> Generic[HedgeToBorrowsHandler]:
        handler = self._handlers.get(protocol)
        if not handler:
            raise ValueError(f'Set Hedge to Borrow overview handler for {protocol}')
        return handler


hedgeToBorrowsFabric = HedgeToBorrowsFabric()

hedgeToBorrowsFabric.add_handler(protocol='aaveV3', handler=AaveV3HedgeToBorrowsHandler)
