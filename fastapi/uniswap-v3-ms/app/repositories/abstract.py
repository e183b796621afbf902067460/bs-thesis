from abc import ABC, abstractmethod

from web3 import Web3
from web3.middleware import geth_poa_middleware

from raffaelo_uniswap_v3.pool.contract import UniSwapV3PoolContract


class iRepo(ABC):

    @property
    @abstractmethod
    def address(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token0(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token1(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token0_symbol(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token1_symbol(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token0_decimals(self):
        raise NotImplemented

    @property
    @abstractmethod
    def token1_decimals(self):
        raise NotImplemented

    @property
    @abstractmethod
    def blocks(self):
        raise NotImplemented

    @property
    @abstractmethod
    def w3(self):
        raise NotImplemented


class WSSProviderRepo(iRepo):
    address, provider, is_reverse = None, None, None

    def __init__(self) -> None:
        self._contract: UniSwapV3PoolContract = UniSwapV3PoolContract(address=self.address, provider=self.provider)

        self._token0, self._token1 = self._contract.token0() if not self.is_reverse else self._contract.token1(), self._contract.token1() if not self.is_reverse else self._contract.token0()
        self._token0_symbol, self._token1_symbol = self._token0.symbol(), self._token1.symbol()
        self._token0_decimals, self._token1_decimals = self._token0.decimals(), self._token1.decimals()

        self._blocks = self._contract.contract.events.Swap.create_filter(fromBlock='latest')

        self._w3 = Web3(self._contract.node)
        self._w3.middleware_onion.inject(
            geth_poa_middleware,
            layer=0
        )

    @property
    def token0(self):
        return self._token0

    @property
    def token1(self):
        return self._token1

    @property
    def token0_symbol(self):
        return self._token0_symbol

    @property
    def token1_symbol(self):
        return self._token1_symbol

    @property
    def token0_decimals(self):
        return self._token0_decimals

    @property
    def token1_decimals(self):
        return self._token1_decimals

    @property
    def blocks(self):
        return self._blocks

    @property
    def w3(self):
        return self._w3
