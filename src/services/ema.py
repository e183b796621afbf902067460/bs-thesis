from pandas import DataFrame
from talib._ta_lib import EMA

from src.services.common.indicator_base import IndicatorPandasServiceBase


class EMAPandasService(IndicatorPandasServiceBase):

    _INDICATOR_NAME: str = "EMA"

    def get_ema(self, ohlc: DataFrame, column: str, window: int, shift: int) -> DataFrame:
        ohlc = ohlc.copy(deep=True)
        ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"] = EMA(ohlc[column].values, window)
        ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"] = ohlc[f"{self._INDICATOR_NAME}_{window}_{column}"].shift(shift)

        return ohlc
