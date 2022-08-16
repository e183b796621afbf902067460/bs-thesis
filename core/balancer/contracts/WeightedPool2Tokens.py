from interfaces.contracts import IContract


class BalancerWeightedPool2TokensContract(IContract):

    def DOMAIN_SEPARATOR(self) -> str:
        return self.contract.functions.DOMAIN_SEPARATOR().call()

    def allowance(self, owner: str, spender: str) -> int:
        return self.contract.functions.allowance(owner, spender).call()

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def decimals(self) -> int:
        return self.contract.functions.decimals().call()

    def getActionId(self, selector: bytes) -> bytes:
        return self.contract.functions.getActionId(selector).call()

    def getAuthorizer(self) -> str:
        return self.contract.functions.getAuthorizer().call()

    def getInvariant(self) -> int:
        return self.contract.functions.getInvariant().call()

    def getLargestSafeQueryWindow(self) -> int:
        return self.contract.functions.getLargestSafeQueryWindow().call()

    def getLastInvariant(self) -> int:
        return self.contract.functions.getLastInvariant().call()

    def getLatest(self, variable: int) -> int:
        return self.contract.functions.getLatest(variable).call()

    def getMiscData(self) -> tuple:
        return self.contract.functions.getMiscData().call()

    def getNormalizedWeights(self) -> tuple:
        return self.contract.functions.getNormalizedWeights().call()

    def getOwner(self) -> str:
        return self.contract.functions.getOwner().call()

    def getPastAccumulators(self, queries: tuple) -> tuple:
        return self.contract.functions.getPastAccumulators(queries).call()

    def getPausedState(self) -> tuple:
        return self.contract.functions.getPausedState().call()

    def getPoolId(self) -> bytes:
        return self.contract.functions.getPoolId().call()

    def getRate(self) -> int:
        return self.contract.functions.getRate().call()

    def getSample(self, index: int) -> tuple:
        return self.contract.functions.getSample(index).call()

    def getSwapFeePercentage(self) -> int:
        return self.contract.functions.getSwapFeePercentage().call()

    def getTimeWeightedAverage(self, queries: tuple) -> tuple:
        return self.contract.functions.getTimeWeightedAverage(queries).call()

    def getTotalSamples(self) -> int:
        return self.contract.functions.getTotalSamples().call()

    def getVault(self) -> str:
        return self.contract.functions.getVault().call()

    def name(self) -> str:
        return self.contract.functions.name().call()

    def nonces(self, address: str) -> int:
        return self.contract.functions.nonces(address).call()

    def symbol(self) -> str:
        return self.contract.functions.symbol().call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()
