from d3tl.interfaces.handlers.wallet_balances.interface import iWalletBalancesHandler
from raffaelo.contracts.erc20.contract import ERC20TokenContract
from trad3r.typings.trader.typing import Trad3r

from web3 import Web3


class ERC20WalletBalancesHandler(ERC20TokenContract, iWalletBalancesHandler):

    def __init__(self, trader: Trad3r, *args, **kwargs):
        ERC20TokenContract.__init__(self, *args, **kwargs)
        iWalletBalancesHandler.__init__(self, trader=trader, *args, **kwargs)

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        symbol: str = self.symbol()
        decimals: int = self.decimals()

        balance: float = self.balanceOf(address=address) / 10 ** decimals
        overview.append({
            'symbol': symbol,
            'price': self.trader.get_price(first=symbol),
            'qty': balance
        })
        return overview


