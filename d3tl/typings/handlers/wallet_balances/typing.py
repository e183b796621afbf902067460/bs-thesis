from typing import TypeVar
from d3tl.interfaces.handlers.wallet_balances.interface import iWalletBalancesHandler


WalletBalancesHandler = TypeVar('WalletBalancesHandler', bound=iWalletBalancesHandler)
