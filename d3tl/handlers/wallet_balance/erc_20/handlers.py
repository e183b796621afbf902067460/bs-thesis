from d3tl.interfaces.handlers.wallet_balance.interface import iWalletBalanceHandler

from raffaelo.contracts.erc20.contract import ERC20TokenContract

from web3 import Web3


class ERC20WalletBalanceHandler(ERC20TokenContract, iWalletBalanceHandler):

    def __init__(self, *args, **kwargs):
        ERC20TokenContract.__init__(self, *args, **kwargs)

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        symbol: str = self.symbol()
        decimals: int = self.decimals()

        balance: float = self.balanceOf(address=address) / 10 ** decimals
        overview.append({
            'pit_symbol': symbol,
            'pit_qty': balance
        })
        return overview


