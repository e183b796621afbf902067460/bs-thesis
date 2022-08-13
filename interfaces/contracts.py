from abc import ABC
from web3 import Web3


class ContractInterface(ABC):

    def __init__(
            self,
            address: str, abi: str,
            provider: Web3.HTTPProvider
    ) -> None:
        self.w3 = Web3(provider)
        self.contract = self.w3.eth.contract(address=Web3.toChecksumAddress(value=address), abi=abi)

    @property
    def address(self) -> str:
        return self.contract.address
