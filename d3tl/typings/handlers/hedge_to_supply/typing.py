from typing import TypeVar
from d3tl.interfaces.handlers.hedge_to_supply.interface import iHedgeToSupplyHandler


HedgeToSupplyHandler = TypeVar('HedgeToSupplyHandler', bound=iHedgeToSupplyHandler)
