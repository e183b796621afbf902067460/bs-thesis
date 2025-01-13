from dataclasses import dataclass
from typing import ClassVar


@dataclass
class PositionType:

    _LONG: ClassVar[str] = "_long"
    _SHORT: ClassVar[str] = "_short"
    _NEUTRAL: ClassVar[str] = "_neutral"

    @classmethod
    @property
    def long_position(cls) -> str:
        return cls._LONG

    @classmethod
    @property
    def short_position(cls) -> str:
        return cls._SHORT

    @classmethod
    @property
    def neutral_position(cls) -> str:
        return cls._NEUTRAL
