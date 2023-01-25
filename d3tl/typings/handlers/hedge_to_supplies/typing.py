from typing import TypeVar
from d3tl.interfaces.handlers.hedge_to_supplies.interface import iHedgeToSuppliesHandler


HedgeToSuppliesHandler = TypeVar('HedgeToSuppliesHandler', bound=iHedgeToSuppliesHandler)
