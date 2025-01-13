from pandas import DataFrame
from talib._ta_lib import BBANDS

from src.services.common.indicator_base import IndicatorPandasServiceBase

class BBANDSPandasService(IndicatorPandasServiceBase):
    """
        https://github.com/fja05680/TA-Lib-tutorial
    """

    _INDICATOR_NAME: str = "BBANDS"

    def get_bbands(self, ohlc: DataFrame, column: str, window: int, stddev: float, matype: int, shift: int) -> DataFrame:
        ohlc = ohlc.copy(deep=True)

        upper, middle, lower = BBANDS(ohlc[column].values, window, stddev, stddev, matype)
        ohlc[f"{self._INDICATOR_NAME}_UPPER_{window}_{stddev}_{column}"] = upper
        ohlc[f"{self._INDICATOR_NAME}_MIDDLE_{window}_{stddev}_{column}"] = middle
        ohlc[f"{self._INDICATOR_NAME}_LOWER_{window}_{stddev}_{column}"] = lower

        ohlc[
            [
                f"{self._INDICATOR_NAME}_UPPER_{window}_{stddev}_{column}",
                f"{self._INDICATOR_NAME}_MIDDLE_{window}_{stddev}_{column}",
                f"{self._INDICATOR_NAME}_LOWER_{window}_{stddev}_{column}",
            ]
        ] = ohlc[
            [
                f"{self._INDICATOR_NAME}_UPPER_{window}_{stddev}_{column}",
                f"{self._INDICATOR_NAME}_MIDDLE_{window}_{stddev}_{column}",
                f"{self._INDICATOR_NAME}_LOWER_{window}_{stddev}_{column}",
            ]
        ].shift(shift)

        return ohlc
