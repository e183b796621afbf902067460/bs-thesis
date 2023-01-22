from typing import TypeVar
from d3tl.interfaces.handlers.hedge_to_borrow.interface import iHedgeToBorrowHandler


HedgeToBorrowHandler = TypeVar('HedgeToBorrowHandler', bound=iHedgeToBorrowHandler)
