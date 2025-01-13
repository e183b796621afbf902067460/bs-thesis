from dataclasses import dataclass

from pandas import DataFrame


@dataclass
class Indicators:

    _current_step: int
    _ohlc: DataFrame

    @property
    def ema(self) -> float:
        return self._ohlc["BBANDS_MIDDLE_210_3_o"].iloc[self._current_step]

    def get_lower_bbands(self, stddev: float) -> float:
        return self._ohlc[f"BBANDS_LOWER_7_{stddev}"].iloc[self._current_step]

    def get_upper_bbands(self, stddev: float) -> float:
        return self._ohlc[f"BBANDS_UPPER_7_{stddev}"].iloc[self._current_step]
