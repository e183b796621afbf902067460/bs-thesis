from abc import abstractmethod, ABC
from typing import final, overload, Dict, Any, Optional

from trad3r.typings.trader.typing import Trad3r
from trad3r.interfaces.trader.interface import iTrad3r


class iHedgeToBorrowHandler(ABC):

    def __init__(self, chain: str, trader: Trad3r, *args, **kwargs):
        self._chain = chain
        self._trader = trader

        self.builder.build(
            key='chain', value=self.chain
        ).build(
            key='trader', value=self.trader
        )

    @abstractmethod
    def get_overview(self, *args, **kwargs):
        raise NotImplementedError(f"{self.__class__.__name__} doesn't have an {self.get_overview.__name__}() implementation")

    @property
    def chain(self):
        return self._chain

    @property
    def trader(self):
        return self._trader

    class Builder:

        def __init__(self) -> None:
            self._options: dict = dict()

        @overload
        def build(self, params: Dict[str, Any]) -> "iHedgeToBorrowHandler.Builder":
            ...

        @overload
        def build(self, key: str, value: Any) -> "iHedgeToBorrowHandler.Builder":
            ...

        @final
        def build(
                self,
                key: Optional[str] = None,
                value: Optional[str] = None,
                params: Optional[Dict[str, Any]] = None
        ) -> "iHedgeToBorrowHandler.Builder":

            def validate(k: str, v: Any) -> None:
                if k == 'chain':
                    if not isinstance(v, str):
                        raise TypeError('Invalid chain type')
                elif k == 'trader':
                    if not isinstance(v, iTrad3r):
                        raise TypeError('Invalid Trader type')

            if isinstance(params, dict):
                for k, v in params.items():
                    validate(k=k, v=v)
                    self._options[k] = v
            elif isinstance(key, str):
                validate(k=key, v=value)
                self._options[key] = value
            return self

    @property
    def builder(self):
        return self.Builder()
