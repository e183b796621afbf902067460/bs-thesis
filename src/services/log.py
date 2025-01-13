from pandas import DataFrame
from numpy import log

from src.services.common.indicator_base import IndicatorPandasServiceBase


class LogPandasService(IndicatorPandasServiceBase):

    _INDICATOR_NAME: str = "LOG"

    def get_log(self, ohlc: DataFrame, numerator: str, denominator: str, shift: int) -> DataFrame:
        ohlc = ohlc.copy(deep=True)

        ohlc[f"{self._INDICATOR_NAME}_{numerator}_{denominator}"] = log(ohlc[numerator] / ohlc[denominator])
        ohlc[f"{self._INDICATOR_NAME}_{numerator}_{denominator}"] = ohlc[f"{self._INDICATOR_NAME}_{numerator}_{denominator}"].shift(shift)

        return ohlc
