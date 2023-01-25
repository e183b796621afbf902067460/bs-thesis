from abc import ABC
from typing import final

from d3tl.interfaces.fabric.interface import iFabric

from d3tl.fabrics.bids_and_asks.fabric import bidsAndAsksFabric
from d3tl.fabrics.hedge_to_borrows.fabric import hedgeToBorrowsFabric
from d3tl.fabrics.hedge_to_supply.fabric import hedgeToSupplyFabric
from d3tl.fabrics.wallet_balance.fabric import walletBalanceFabric


class D3AbstractFabric(ABC):

    def __init__(self) -> None:
        self._fabrics: dict = dict()

    @final
    def add_fabric(self, fabric_name: str, fabric: iFabric) -> None:
        if not self._fabrics.get(fabric_name):
            self._fabrics[fabric_name] = fabric

    @final
    def get_fabric(self, fabric_name: str) -> iFabric:
        fabric: iFabric = self._fabrics.get(fabric_name)
        if not fabric:
            raise ValueError(f'Set Fabric for {fabric_name} fabric type')
        return fabric


d3Abstract: D3AbstractFabric = D3AbstractFabric()

d3Abstract.add_fabric(fabric_name='bids_and_asks', fabric=bidsAndAsksFabric)
d3Abstract.add_fabric(fabric_name='hedge_to_borrows', fabric=hedgeToBorrowsFabric)
d3Abstract.add_fabric(fabric_name='hedge_to_supply', fabric=hedgeToSupplyFabric)
d3Abstract.add_fabric(fabric_name='wallet_balance', fabric=walletBalanceFabric)
