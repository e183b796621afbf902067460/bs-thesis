from protocols.curve.contracts.pools import CurvePoolContract


class EllipsisPoolContract(CurvePoolContract):

    def fee_converter(self) -> str:
        return self.contract.functions.fee_converter().call()
