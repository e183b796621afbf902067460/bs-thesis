from abc import ABC, abstractmethod
from typing import Optional, final


class iTraderLeaf(ABC):

    _PEGS: dict = None

    @abstractmethod
    def get_price(self, base: str, quote: str, *args, **kwargs) -> Optional[float]:
        raise NotImplementedError

    @classmethod
    @final
    def _peg(cls, symbol: str) -> str:
        return cls._PEGS[symbol] if symbol in cls._PEGS else symbol
