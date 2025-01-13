from pandas import DataFrame
from talib._ta_lib import RSI

from src.services.common.indicator_base import IndicatorPandasServiceBase


class RSIPandasService(IndicatorPandasServiceBase):

    _INDICATOR_NAME: str = "RSI"

    def get_rsi(self, ohlc: DataFrame, column: str, window: int, shift: int) -> DataFrame:
        ohlc = ohlc.copy(deep=True)
        ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"] = RSI(ohlc[column].values, window)
        ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"] = ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"].shift(shift)

        return ohlc
