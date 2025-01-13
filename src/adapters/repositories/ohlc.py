from attr import attrs
from pandas import read_csv, DataFrame


@attrs(slots=True, auto_attribs=True, kw_only=True)
class OHLCPandasRepository:

    _path: str

    def get_ohlc(self) -> DataFrame:
        return read_csv(filepath_or_buffer=self._path)
