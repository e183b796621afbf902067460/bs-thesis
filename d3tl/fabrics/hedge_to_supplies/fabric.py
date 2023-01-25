from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.hedge_to_supplies.typing import HedgeToSuppliesHandler

from d3tl.handlers.hedge_to_supplies.aave.handlers import AaveV3HedgeToSuppliesHandler


class HedgeToSuppliesFabric(iFabric):

    def add_handler(self, protocol: str, handler: Generic[HedgeToSuppliesHandler]) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = handler

    def get_handler(self, protocol: str) -> Generic[HedgeToSuppliesHandler]:
        handler = self._handlers.get(protocol)
        if not handler:
            raise ValueError(f'Set Hedge to Supply overview handler for {protocol}')
        return handler


hedgeToSuppliesFabric = HedgeToSuppliesFabric()

hedgeToSuppliesFabric.add_handler(protocol='aaveV3', handler=AaveV3HedgeToSuppliesHandler)
