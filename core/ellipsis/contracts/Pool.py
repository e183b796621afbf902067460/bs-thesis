from core.curve.contracts.Pool import CurvePoolContract


class EllipsisPoolContract(CurvePoolContract):

    def fee_converter(self) -> str:
        return self.contract.functions.fee_converter().call()
