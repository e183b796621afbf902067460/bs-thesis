from abc import ABC
from typing import final

from d3tl.typings.fabric.typing import FabricType


class D3AbstractFabric(ABC):

    def __init__(self) -> None:
        self._fabrics: dict = dict()

    @final
    def add_fabric(self, fabric_name: str, fabric: FabricType) -> None:
        if not self._fabrics.get(fabric_name):
            self._fabrics[fabric_name] = fabric

    @final
    def get_fabric(self, fabric_name: str) -> FabricType:
        fabric: FabricType = self._fabrics.get(fabric_name)
        if not fabric:
            raise ValueError(f'Set Fabric for {fabric_name} fabric type')
        return fabric


d3Abstract: D3AbstractFabric = D3AbstractFabric()
