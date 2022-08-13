from protocols.curve.contracts.tokens import CurveTokenContract


class EllipsisTokenContract(CurveTokenContract):

    def minter(self) -> str:
        return self.contract.functions.minter().call()
