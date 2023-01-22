from typing import TypeVar
from d3tl.interfaces.handlers.wallet_balance.interface import iWalletBalanceHandler


WalletBalanceHandler = TypeVar('WalletBalanceHandler', bound=iWalletBalanceHandler)
