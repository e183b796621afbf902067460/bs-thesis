from d3tl.interfaces.handlers.wallet_balance.interface import iWalletBalanceHandler
from raffaelo.typings.providers.typing import ProviderType

from web3 import Web3


class GasWalletBalanceHandler(iWalletBalanceHandler):

    _symbols: dict = {
        'polygon': 'MATIC'
    }

    def __init__(self, chain: str, provider: ProviderType, *args, **kwargs) -> None:
        self._chain: str = chain
        self._provider: ProviderType = provider

    @property
    def chain(self):
        return self._chain

    @property
    def provider(self) -> ProviderType:
        return self._provider

    @property
    def node(self):
        return self.provider.provider

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        symbol: str = self._symbols[self.chain]
        balance: float = Web3(self.node).eth.get_balance(address) / 10 ** 18
        overview.append({
            'pit_symbol': symbol,
            'pit_qty': balance
        })
        return overview


