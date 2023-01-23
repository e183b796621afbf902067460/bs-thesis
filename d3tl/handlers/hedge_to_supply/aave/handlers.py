from d3tl.interfaces.handlers.hedge_to_supply.interface import iHedgeToSupplyHandler

from d3f1nance.aave.PoolV3 import AaveLendingPoolV3Contract
from raffaelo.contracts.erc20.contract import ERC20TokenContract
from trad3er.typings.trader.typing import Trad3r

from web3 import Web3
from web3.exceptions import BadFunctionCallOutput


class AaveV3HedgeToSupplyHandler(ERC20TokenContract, iHedgeToSupplyHandler):

    def __init__(
            self,
            chain: str, trader: Trad3r,
            *args, **kwargs
    ):
        ERC20TokenContract.__init__(self, *args, **kwargs)
        iHedgeToSupplyHandler.__init__(self, chain=chain, trader=trader)

    _lending_pool_addresses = {
        'polygon': '0x794a61358D6845594F94dc1DB02A252b5b4814aD'
    }

    def get_overview(self, address: str, *args, **kwargs):
        overview: list = list()
        address: str = Web3.toChecksumAddress(value=address)

        pool = AaveLendingPoolV3Contract(address=self._lending_pool_addresses[self.chain], provider=self.provider)

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
            if mask == '1' and i % 2:
                try:
                    reserve_token_symbol: str = self.symbol()
                except OverflowError:
                    continue

                a_token_address: str = reserve_data[8]
                a_token: ERC20TokenContract = ERC20TokenContract(address=a_token_address, provider=self.provider)
                a_token_decimals: int = a_token.decimals()
                collateral: int = a_token.balanceOf(address=address) / 10 ** a_token_decimals

                a_overview: dict = {
                    'pit_symbol': reserve_token_symbol,
                    'pit_price': self.trader.get_price(first=reserve_token_symbol),
                    'pit_qty': collateral
                }
                overview.append(a_overview)
        return overview
