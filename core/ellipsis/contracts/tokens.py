from core.curve.contracts.tokens import CurveLPTokenContract


class EllipsisLPTokenContract(CurveLPTokenContract):

    def minter(self) -> str:
        return self.contract.functions.minter().call()
