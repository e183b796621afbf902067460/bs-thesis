from dataclasses import dataclass
from datetime import datetime

from src.schemas.position_type import PositionType


@dataclass
class Trade:

    _entry_price: float
    _exit_price: float
    _side: str

    _timestamp: datetime
    _ticks_in_trade: int

    def _pl_on_long_position(self) -> float:
        return self._exit_price / self._entry_price - 1

    def _pl_on_short_position(self) -> float:
        return (self._exit_price / self._entry_price - 1) * -1

    @property
    def pl(self) -> float:
        if self._side == PositionType.long_position:
            return self._pl_on_long_position()
        return self._pl_on_short_position()
