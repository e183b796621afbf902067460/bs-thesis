from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.wallet_balances.typing import WalletBalancesHandler

from d3tl.handlers.wallet_balances.erc20.handlers import ERC20WalletBalancesHandler
from d3tl.handlers.wallet_balances.gas.handlers import GasWalletBalancesHandler


class WalletBalancesFabric(iFabric):

    def add_handler(self, token_type: str, handler: Generic[WalletBalancesHandler]) -> None:
        if not self._handlers.get(token_type):
            self._handlers[token_type] = handler

    def get_handler(self, token_type: str) -> Generic[WalletBalancesHandler]:
        handler = self._handlers.get(token_type)
        if not handler:
            raise ValueError(f'Set Wallet balance overview handler for {token_type}')
        return handler


walletBalancesFabric = WalletBalancesFabric()

walletBalancesFabric.add_handler(token_type='erc20', handler=ERC20WalletBalancesHandler)
walletBalancesFabric.add_handler(token_type='gas', handler=GasWalletBalancesHandler)

