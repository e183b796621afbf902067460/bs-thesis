from core.curve.contracts.LPToken import CurveLPTokenContract


class EllipsisLPTokenContract(CurveLPTokenContract):

    def minter(self) -> str:
        return self.contract.functions.minter().call()
