from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.hedge_to_supply.typing import HedgeToSupplyHandler

from d3tl.handlers.hedge_to_supply.aave.handlers import AaveV3HedgeToSupplyHandler


class HedgeToSupplyFabric(iFabric):

    def add_handler(self, protocol: str, handler: Generic[HedgeToSupplyHandler]) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = handler

    def get_handler(self, protocol: str) -> Generic[HedgeToSupplyHandler]:
        handler = self._handlers.get(protocol)
        if not handler:
            raise ValueError(f'Set Hedge to Supply overview handler for {protocol}')
        return handler


hedgeToSupplyFabric = HedgeToSupplyFabric()

hedgeToSupplyFabric.add_handler(protocol='aaveV3', handler=AaveV3HedgeToSupplyHandler)
