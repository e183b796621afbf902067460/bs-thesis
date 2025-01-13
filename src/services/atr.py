from pandas import DataFrame
from talib._ta_lib import ATR

from src.services.common.indicator_base import IndicatorPandasServiceBase


class ATRPandasService(IndicatorPandasServiceBase):

    _INDICATOR_NAME: str = "ATR"

    def get_atr(self, ohlc: DataFrame, window: int, shift: int) -> DataFrame:
        ohlc = ohlc.copy(deep=True)
        ohlc[f"{self._INDICATOR_NAME}_{window}"] = ATR(
            ohlc["h"].values,
            ohlc["l"].values,
            ohlc["c"].values,
            window
        )
        ohlc[f"{self._INDICATOR_NAME}_{window}"] = ohlc[f"{self._INDICATOR_NAME}_{window}"].shift(shift)

        return ohlc
