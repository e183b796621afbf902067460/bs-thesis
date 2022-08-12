from interfaces.contracts import ContractInterface


class CurveTokenContract(ContractInterface):

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()

    def allowance(self, _owner: str, _spender: str) -> int:
        return self.contract.functions.allowance(_owner, _spender).call()

    def name(self) -> str:
        return self.contract.functions.name().call()

    def symbol(self) -> str:
        return self.contract.functions.symbol().call()

    def decimals(self) -> int:
        return self.contract.functions.decimals().call()

    def balanceOf(self, arg0: str) -> int:
        return self.contract.functions.balanceOf(arg0).call()
