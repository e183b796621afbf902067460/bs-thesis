from typing import TypeVar
from d3tl.interfaces.handlers.bids_and_asks.interface import iBidsAndAsksHandler


BidsAndAsksHandler = TypeVar('BidsAndAsksHandler', bound=iBidsAndAsksHandler)
