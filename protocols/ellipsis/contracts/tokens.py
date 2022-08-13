from protocols.curve.contracts.tokens import CurveLPTokenContract


class EllipsisTokenContract(CurveLPTokenContract):

    def minter(self) -> str:
        return self.contract.functions.minter().call()
