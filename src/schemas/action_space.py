from dataclasses import dataclass
from typing import ClassVar


@dataclass
class LimitOrderActionSpace:

    _BUY_LIMIT: ClassVar[int] = 0
    _SELL_LIMIT: ClassVar[int] = 1
    _HOLD: ClassVar[int] = 2

    @classmethod
    @property
    def buy_limit(cls) -> str:
        return cls._BUY_LIMIT

    @classmethod
    @property
    def sell_limit(cls) -> str:
        return cls._SELL_LIMIT

    @classmethod
    @property
    def hold(cls) -> str:
        return cls._HOLD

    @classmethod
    @property
    def n(cls) -> int:
        action_space: list[str] = [cls.buy_limit, cls.sell_limit, cls.hold]
        return len(action_space)
