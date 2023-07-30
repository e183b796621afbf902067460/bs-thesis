from typing import Optional
import time
import requests
import random

from python.trader.leaf.interface import iTraderLeaf


class _CoinGeckoTraderLeaf(iTraderLeaf):

    _PEGS = {
        'USDT': 'tether',
        'USDC': 'usd-coin',
        'WETH': 'weth',
        'WMATIC': 'wmatic'
    }

    @staticmethod
    def _backoff() -> float:
        return random.random() ** 2

    @classmethod
    def get_price(cls, base: str, quote: str, *args, **kwargs) -> Optional[float]:
        base, quote = cls._peg(symbol=base), 'usd' if quote == 'USD' else quote
        params = dict(ids=base, vs_currencies=quote)
        response = requests.get(url='https://api.coingecko.com/api/v3/simple/price', params=params)
        while response.status_code == 429:
            time.sleep(cls._backoff())
            response = requests.get(url='https://api.coingecko.com/api/v3/simple/price', params=params)
        try:
            return response.json()[base][quote]
        except KeyError:
            return None
