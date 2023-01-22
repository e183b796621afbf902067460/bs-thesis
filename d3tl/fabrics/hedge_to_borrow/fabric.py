from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.hedge_to_borrow.typing import HedgeToBorrowHandler

from d3tl.handlers.hedge_to_borrow.aave.handlers import AaveV3HedgeToBorrowHandler


class HedgeToBorrowFabric(iFabric):

    def add_handler(self, protocol: str, handler: Generic[HedgeToBorrowHandler]) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = handler

    def get_handler(self, protocol: str) -> Generic[HedgeToBorrowHandler]:
        handler = self._handlers.get(protocol)
        if not handler:
            raise ValueError(f'Set Hedge to Borrow overview handler for {protocol}')
        return handler


hedgeToBorrowFabric = HedgeToBorrowFabric()

hedgeToBorrowFabric.add_handler(protocol='aaveV3', handler=AaveV3HedgeToBorrowHandler)
