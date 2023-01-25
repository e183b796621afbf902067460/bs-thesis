from typing import TypeVar
from d3tl.interfaces.handlers.hedge_to_borrows.interface import iHedgeToBorrowsHandler


HedgeToBorrowsHandler = TypeVar('HedgeToBorrowsHandler', bound=iHedgeToBorrowsHandler)
