from d3tl.interfaces.fabric.interface import iFabric
from d3tl.interfaces.handlers.bids_and_asks.interface import iBidsAndAsksHandler


class BidsAndAsksFabric(iFabric):

    def add_handler(self, protocol: str, overview: iBidsAndAsksHandler) -> None:
        if not self._handlers.get(protocol):
            self._handlers[protocol] = overview

    def get_handler(self, protocol: str) -> iBidsAndAsksHandler:
        overview = self._handlers.get(protocol)
        if not overview:
            raise ValueError(f'Set Bids and Asks overview handler for {protocol}')
        return overview


bidsAndAsksFabric = BidsAndAsksFabric()
