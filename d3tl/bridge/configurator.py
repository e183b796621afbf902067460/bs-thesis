from d3tl.typings.fabric.typing import FabricType
from d3tl.abstract.fabric import D3AbstractFabric


class D3BridgeConfigurator:

    def __init__(self, abstract: D3AbstractFabric, fabric_name: str, handler_name: str) -> None:
        self._abstract: D3AbstractFabric = abstract
        self._fabric_name: str = fabric_name
        self._handler_name: str = handler_name

    @property
    def abstract(self) -> D3AbstractFabric:
        return self._abstract

    def produce_fabric(self) -> FabricType:
        return self.abstract.get_fabric(self._fabric_name)

    def produce_handler(self) -> object:
        return self.produce_fabric().get_handler(self._handler_name)
