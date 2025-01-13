from dataclasses import dataclass

from pandas import DataFrame


@dataclass
class OHLC:

    _current_step: int
    _ohlc: DataFrame

    @property
    def o(self) -> float:
        return self._ohlc["o"].iloc[self._current_step]

    @property
    def h(self) -> float:
        return self._ohlc["h"].iloc[self._current_step]

    @property
    def l(self) -> float:
        return self._ohlc["l"].iloc[self._current_step]

    @property
    def c(self) -> float:
        return self._ohlc["c"].iloc[self._current_step]


@dataclass
class OHLCLead:
    _current_step: int
    _ohlc: DataFrame

    @property
    def o(self) -> float:
        return self._ohlc["o"].iloc[self._current_step + 1]

    @property
    def h(self) -> float:
        return self._ohlc["h"].iloc[self._current_step + 1]

    @property
    def l(self) -> float:
        return self._ohlc["l"].iloc[self._current_step + 1]

    @property
    def c(self) -> float:
        return self._ohlc["c"].iloc[self._current_step + 1]
