from contracts import IContract


class ERC20TokenContract(IContract):

    def allowance(self, account: str, spender: str) -> int:
        return self.contract.functions.allowance(account, spender).call()

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def decimals(self) -> int:
        return self.contract.functions.decimals().call()

    def name(self) -> str:
        return self.contract.functions.name().call()

    def symbol(self) -> str:
        return self.contract.functions.symbol().call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()
