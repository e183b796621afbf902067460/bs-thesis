from d3tl.interfaces.handlers.wallet_balances.interface import iWalletBalancesHandler
from raffaelo.typings.providers.typing import ProviderType
from trad3r.typings.trader.typing import Trad3r

from web3 import Web3


class GasWalletBalancesHandler(iWalletBalancesHandler):

    def __init__(
            self,
            provider: ProviderType, gas_symbol: str, trader: Trad3r,
            *args, **kwargs
    ) -> None:
        self._provider: ProviderType = provider
        self._gas_symbol = gas_symbol
        iWalletBalancesHandler.__init__(self, trader=trader, *args, **kwargs)

    @property
    def provider(self) -> ProviderType:
        return self._provider

    @property
    def node(self):
        return self.provider.provider

    @property
    def gas_symbol(self):
        return self._gas_symbol

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        balance: float = Web3(self.node).eth.get_balance(address) / 10 ** 18
        overview.append({
            'symbol': self.gas_symbol,
            'price': self.trader.get_price(first=self.gas_symbol),
            'qty': balance
        })
        return overview


