from typing import Optional

from python.trader.leaf.interface import iTraderLeaf
import requests


class _BinanceSpotTraderLeaf(iTraderLeaf):

    _PEGS = {
        'WETH': 'ETH',
        'WMATIC': 'MATIC'
    }

    @classmethod
    def get_price(cls, base: str, quote: str, *args, **kwargs) -> Optional[float]:
        base, quote = cls._peg(symbol=base), 'USDT' if quote == 'USD' else quote
        params = dict(symbol=base + quote)
        try:
            return float(requests.get(url='https://api.binance.com/api/v3/ticker/price', params=params).json()['price'])
        except KeyError:
            return None
