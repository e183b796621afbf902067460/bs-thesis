from interfaces.contracts import ContractInterface


class UniswapV2PairContract(ContractInterface):

    def DOMAIN_SEPARATOR(self) -> str:
        return self.contract.functions.DOMAIN_SEPARATOR().call()

    def MINIMUM_LIQUIDITY(self) -> int:
        return self.contract.functions.MINIMUM_LIQUIDITY().call()

    def PERMIT_TYPEHASH(self) -> str:
        return self.contract.functions.PERMIT_TYPEHASH().call()

    def allowance(self, arg0: str, arg1: str) -> int:
        return self.contract.functions.allowance(arg0, arg1).call()

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def decimals(self) -> int:
        return self.contract.functions.decimals().call()

    def factory(self) -> str:
        return self.contract.functions.factory().call()

    def getReserves(self) -> tuple:
        return self.contract.functions.getReserves().call()

    def kLast(self) -> int:
        return self.contract.functions.kLast().call()

    def name(self) -> str:
        return self.contract.functions.name().call()

    def nonces(self, address: str) -> int:
        return self.contract.functions.nonces(address).call()

    def price0CumulativeLast(self) -> int:
        return self.contract.functions.price0CumulativeLast().call()

    def price1CumulativeLast(self) -> int:
        return self.contract.functions.price1CumulativeLast().call()

    def symbol(self) -> str:
        return self.contract.functions.symbol().call()

    def token0(self) -> str:
        return self.contract.functions.token0().call()

    def token1(self) -> str:
        return self.contract.functions.token1().call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()
