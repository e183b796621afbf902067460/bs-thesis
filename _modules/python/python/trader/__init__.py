from typing import Dict, Optional

from python.trader.leaf.interface import iTraderLeaf
from python.decorators.yieldmethod.decorator import yieldmethod

from python.trader.leaves.binance.spot.leaf import _BinanceSpotTraderLeaf
from python.trader.leaves.coingecko.leaf import _CoinGeckoTraderLeaf


class Trader(iTraderLeaf):

    _TRADERS: Dict[str, iTraderLeaf] = dict()

    @classmethod
    def add_trader(cls, name: str, trader: iTraderLeaf) -> None:
        if not cls._TRADERS.get(name):
            cls._TRADERS[name] = trader

    @classmethod
    @yieldmethod
    def get_price(cls, base: str, quote: str = 'USD', source=None, *args, **kwargs) -> Optional[float]:
        if source:
            trader = cls._TRADERS.get(source)
            if not trader:
                raise KeyError(f"No such trader {source}.")
            yield trader.get_price(base=base, quote=quote)
        else:
            for _, trader in cls._TRADERS.items():
                yield trader.get_price(base=base, quote=quote, *args, **kwargs)


Trader.add_trader(name=_BinanceSpotTraderLeaf.__name__, trader=_BinanceSpotTraderLeaf)
Trader.add_trader(name=_CoinGeckoTraderLeaf.__name__, trader=_CoinGeckoTraderLeaf)
