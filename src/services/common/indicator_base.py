from abc import ABC
from attr import attrs, ib


@attrs(slots=True, auto_attribs=True, kw_only=True)
class IndicatorPandasServiceBase(ABC):

    _INDICATOR_NAME: str = ib(init=False)

    @property
    def indicator_name(self) -> str:
        return self._INDICATOR_NAME
