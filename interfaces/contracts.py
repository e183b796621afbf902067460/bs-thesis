from abc import ABC
from web3 import Web3
from web3.providers.base import BaseProvider


class IContract(ABC):

    _abi: str = None

    def __init__(
            self,
            address: str,
            provider: BaseProvider
    ) -> None:
        self.w3 = Web3(provider)
        self.contract = self.w3.eth.contract(address=Web3.toChecksumAddress(value=address), abi=self._abi)

    @property
    def address(self) -> str:
        return self.contract.address

    @property
    def abi(self) -> str:
        return self._abi
