from interfaces.contracts import IContract


class CurveGaugeContract(IContract):

    def integrate_checkpoint(self) -> int:
        return self.contract.functions.integrate_checkpoint().call()

    def minter(self) -> str:
        return self.contract.functions.minter().call()

    def crv_token(self) -> str:
        return self.contract.functions.crv_token().call()

    def lp_token(self) -> str:
        return self.contract.functions.lp_token().call()

    def controller(self) -> str:
        return self.contract.functions.controller().call()

    def voting_escrow(self) -> str:
        return self.contract.functions.voting_escrow().call()

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()

    def future_epoch_time(self) -> int:
        return self.contract.functions.future_epoch_time().call()

    def approved_to_deposit(self, arg0: str, arg1: str) -> bool:
        return self.contract.functions.approved_to_deposit(arg0, arg1).call()

    def working_balances(self, arg0: str) -> int:
        return self.contract.functions.working_balances(arg0).call()

    def working_supply(self) -> int:
        return self.contract.functions.working_supply().call()

    def period(self) -> int:
        return self.contract.functions.period().call()

    def period_timestamp(self, arg0: int) -> int:
        return self.contract.functions.period_timestamp(arg0).call()

    def integrate_inv_supply(self, arg0: int) -> int:
        return self.contract.functions.integrate_inv_supply(arg0).call()

    def integrate_inv_supply_of(self, address: str) -> int:
        return self.contract.functions.integrate_inv_supply_of(address).call()

    def integrate_checkpoint_of(self, address: str) -> int:
        return self.contract.functions.integrate_checkpoint_of(address).call()

    def integrate_fraction(self, address: str) -> int:
        return self.contract.functions.integrate_fraction(address).call()

    def inflation_rate(self) -> int:
        return self.contract.functions.inflation_rate().call()
