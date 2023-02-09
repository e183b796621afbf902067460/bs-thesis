from d3tl.interfaces.handlers.hedge_to_borrows.interface import iHedgeToBorrowsHandler

from d3f1nance.aave.PoolV3 import AaveLendingPoolV3Contract
from raffaelo.contracts.erc20.contract import ERC20TokenContract
from trad3r.typings.trader.typing import Trad3r

from web3 import Web3
from web3.exceptions import BadFunctionCallOutput


class AaveV3HedgeToBorrowsHandler(ERC20TokenContract, iHedgeToBorrowsHandler):

    def __init__(
            self,
            chain: str, trader: Trad3r,
            *args, **kwargs
    ):
        ERC20TokenContract.__init__(self, *args, **kwargs)
        iHedgeToBorrowsHandler.__init__(self, chain=chain, trader=trader)

    _lending_pool_addresses = {
        'polygon': '0x794a61358D6845594F94dc1DB02A252b5b4814aD'
    }

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        pool = AaveLendingPoolV3Contract(address=self._lending_pool_addresses[self.chain], provider=self.provider)

        user_account_data = pool.getUserAccountData(address=address)
        health_factor = user_account_data[5] / 10 ** 18
        reserve_token_symbol: str = self.symbol()
        reserve_token_price: float = self.trader.get_price(first=reserve_token_symbol)

        user_configuration: str = bin(pool.getUserConfiguration(address=address)[0])[2:]
        reserves_list: list = pool.getReservesList()
        for i, mask in enumerate(user_configuration[::-1]):
            reserve_token_address: str = reserves_list[i // 2]
            if reserve_token_address != self.contract.address:
                continue
            try:
                reserve_data: tuple = pool.getReserveData(asset=reserve_token_address)
            except BadFunctionCallOutput:
                continue
            if mask == '1' and not i % 2:
                stable_token_address: str = reserve_data[9]
                debt_token_address: str = reserve_data[10]

                stable_token = ERC20TokenContract(address=stable_token_address, provider=self.provider)
                debt_token = ERC20TokenContract(address=debt_token_address, provider=self.provider)

                stable_token_decimals = stable_token.decimals()
                debt_token_decimals = debt_token.decimals()

                debt = stable_token.balanceOf(address=address) / 10 ** stable_token_decimals + debt_token.balanceOf(address=address) / 10 ** debt_token_decimals

                a_overview: dict = {
                    'symbol': reserve_token_symbol,
                    'price': reserve_token_price,
                    'qty': debt,
                    'health_factor': health_factor
                }
                overview.append(a_overview)
        if not overview:
            overview.append(
                {
                    'symbol': reserve_token_symbol,
                    'price': reserve_token_price,
                    'qty': 0,
                    'health_factor': health_factor
                }
            )
        return overview
