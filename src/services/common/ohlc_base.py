from attr import attrs
from pandas import DataFrame, to_datetime

from src.adapters.repositories.ohlc import OHLCPandasRepository


@attrs(slots=True, auto_attribs=True, kw_only=True)
class OHLCPandasService:

    _ohlc_repository: OHLCPandasRepository

    @staticmethod
    def merge(
        left: DataFrame,
        right: DataFrame,
        on: list[str],
        drop_left: list[str] | None = None,
        drop_right: list[str] | None = None,
        how: str = "left"
    ) -> DataFrame:
        left, right = left.copy(deep=True), right.copy(deep=True)
        left, right = left.drop(drop_left, axis=1) if drop_left else left, right.drop(drop_right, axis=1) if drop_right else right

        return left.merge(right, on=on, how=how)

    @staticmethod
    def resample(ohlc: DataFrame, timeframe: str) -> DataFrame:
        ohlc = ohlc.copy(deep=True)

        ohlc.index = ohlc["date"]
        ohlc = ohlc.resample(timeframe).agg(
            {
                "o": "first",
                "h": "max",
                "l": "min",
                "c": "last",
                "v": "sum",
                "year": "first",
                "month": "first",
                "week": "first",
                "day": "first"
            }
        ).dropna().reset_index()
        return ohlc

    def get_ohlc(self) -> DataFrame:
        ohlc: DataFrame = self._ohlc_repository.get_ohlc().head(128)

        ohlc["date"] = to_datetime(ohlc["date"])
        ohlc["year"] = ohlc["date"].dt.year
        ohlc["month"] = ohlc["date"].dt.month
        ohlc["week"] = ohlc["date"].dt.isocalendar().week
        ohlc["day"] = ohlc["date"].dt.day

        return ohlc
