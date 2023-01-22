from typing import Generic

from d3tl.interfaces.fabric.interface import iFabric
from d3tl.typings.handlers.wallet_balance.typing import WalletBalanceHandler

from d3tl.handlers.wallet_balance.erc20.handlers import ERC20WalletBalanceHandler
from d3tl.handlers.wallet_balance.gas.handlers import GasWalletBalanceHandler


class WalletBalanceFabric(iFabric):

    def add_handler(self, token_type: str, handler: Generic[WalletBalanceHandler]) -> None:
        if not self._handlers.get(token_type):
            self._handlers[token_type] = handler

    def get_handler(self, token_type: str) -> Generic[WalletBalanceHandler]:
        handler = self._handlers.get(token_type)
        if not handler:
            raise ValueError(f'Set Wallet balance overview handler for {token_type}')
        return handler


walletBalanceFabric = WalletBalanceFabric()

walletBalanceFabric.add_handler(token_type='erc20', handler=ERC20WalletBalanceHandler)
walletBalanceFabric.add_handler(token_type='gas', handler=GasWalletBalanceHandler)

