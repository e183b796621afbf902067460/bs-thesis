from interfaces.contracts import ContractInterface


class CurvePoolContract(ContractInterface):

    def A(self) -> int:
        return self.contract.functions.A().call()

    def get_virtual_price(self) -> int:
        return self.contract.functions.get_virtual_price().call()

    def calc_token_amount(self, amounts: int, deposit: bool) -> int:
        return self.contract.functions.calc_token_amount(amounts, deposit).call()

    def get_dy(self, i: int, j: int, dx: int) -> int:
        return self.contract.functions.get_dy(i, j, dx).call()

    def get_dy_underlying(self, i: int, j: int, dx: int) -> int:
        return self.contract.functions.get_dy_underlying(i, j, dx).call()

    def calc_withdraw_one_coin(self, _token_amount: int, i: int) -> int:
        return self.contract.functions.calc_withdraw_one_coin(_token_amount, i).call()

    def admin_balances(self, i: int) -> int:
        return self.contract.functions.admin_balances(i).call()

    def coins(self, arg0: int) -> str:
        return self.contract.functions.coins(arg0).call()

    def balances(self, arg0: int) -> int:
        return self.contract.functions.balances(arg0).call()

    def fee(self) -> int:
        return self.contract.functions.fee().call()

    def admin_fee(self) -> int:
        return self.contract.functions.admin_fee().call()

    def owner(self) -> str:
        return self.contract.functions.owner().call()

    def initial_A(self) -> int:
        return self.contract.functions.initial_A().call()

    def future_A(self) -> int:
        return self.contract.functions.future_A().call()

    def initial_A_time(self) -> int:
        return self.contract.functions.initial_A_time().call()

    def future_A_time(self) -> int:
        return self.contract.functions.future_A_time().call()

    def admin_actions_deadline(self) -> int:
        return self.contract.functions.admin_actions_deadline().call()

    def transfer_ownership_deadline(self) -> int:
        return self.contract.functions.transfer_ownership_deadline().call()

    def future_fee(self) -> int:
        return self.contract.functions.future_fee().call()

    def future_admin_fee(self) -> int:
        return self.contract.functions.future_admin_fee().call()

    def future_owner(self) -> str:
        return self.contract.functions.future_owner().call()
