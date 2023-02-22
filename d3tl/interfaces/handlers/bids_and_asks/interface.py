from abc import abstractmethod, ABC
from typing import final, overload, Dict, Any, Optional

import requests as r

from trad3r.typings.trader.typing import Trad3r
from trad3r.interfaces.trader.interface import iTrad3r


class iBidsAndAsksHandler(ABC):
    _FEE = None

    def __init__(
            self,
            uri: str, api_key: str, block_limit: int,
            gas_symbol: str, chain: str,
            trader: Trad3r,
            *args, **kwargs):
        self._uri = uri
        self._api_key = api_key
        self._block_limit = block_limit
        self._trader = trader
        self._gas_symbol = gas_symbol
        self._chain = chain

        self.builder.build(
            key='uri', value=self._uri
        ).build(
            key='api_key', value=self._api_key
        ).build(
            key='block_limit', value=self.block_limit
        ).build(
            key='trader', value=self.trader
        ).build(
            key='gas_symbol', value=self.gas_symbol
        ).build(
            key='chain', value=self._chain
        ).connect()

    @abstractmethod
    def get_overview(self, *args, **kwargs):
        raise NotImplementedError(f"{self.__class__.__name__} doesn't have an {self.get_overview.__name__}() implementation")

    @property
    def api_uri(self) -> str:
        return self._uri + 'api?module=block&action=getblocknobytime&timestamp={timestamp}&closest=before&apikey=' + self._api_key

    @property
    def trader(self):
        return self._trader

    @property
    def gas_symbol(self):
        return self._gas_symbol

    @property
    def block_limit(self):
        return self._block_limit

    @property
    def chain(self):
        return self._chain

    class Builder:

        def __init__(self) -> None:
            self._options: dict = dict()

        @overload
        def build(self, params: Dict[str, Any]) -> "iBidsAndAsksHandler.Builder":
            ...

        @overload
        def build(self, key: str, value: Any) -> "iBidsAndAsksHandler.Builder":
            ...

        @final
        def build(
                self,
                key: Optional[str] = None,
                value: Optional[str] = None,
                params: Optional[Dict[str, Any]] = None
        ) -> "iBidsAndAsksHandler.Builder":

            def validate(k: str, v: Any) -> None:
                if k == 'uri':
                    if not isinstance(v, str):
                        raise TypeError('Invalid URI type')
                    if not v.startswith('https:') and not v.startswith('http:'):
                        raise r.HTTPError("Set valid endpoint")
                elif k == 'api_key':
                    if not isinstance(v, str):
                        raise TypeError('Set valid API key type')
                elif k == 'block_limit':
                    if not isinstance(v, int):
                        raise TypeError('Set valid block limit type')
                elif k == 'gas_symbol':
                    if not isinstance(v, str):
                        raise TypeError('Invalid gas symbol type')
                elif k == 'trader':
                    if not isinstance(v, iTrad3r):
                        raise TypeError('Invalid trader type')
                elif k == 'chain':
                    if not isinstance(v, str):
                        raise TypeError('Invalid chain type')

            if isinstance(params, dict):
                for k, v in params.items():
                    validate(k=k, v=v)
                    self._options[k] = v
            elif isinstance(key, str):
                validate(k=key, v=value)
                self._options[key] = value
            return self

        def connect(self):
            try:
                status = r.get(self._options['uri']).status_code
            except KeyError:
                raise TypeError('Set valid URI parameter')
            if status != 200:
                raise r.HTTPError('Provider is down')
            return self

    @property
    def builder(self):
        return self.Builder()
