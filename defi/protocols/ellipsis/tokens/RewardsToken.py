from defi.tokens.contracts.ERC20Token import ERC20TokenContract


class EllipsisRewardsTokenContract(ERC20TokenContract):

    def depositContracts(self, address: str) -> bool:
        return self.contract.functions.depositContracts(address).call()

    def depositedBalanceOf(self, address: str) -> int:
        return self.contract.functions.depositedBalanceOf(address).call()

    def earned(self, address: str, rewardsToken: str) -> int:
        return self.contract.functions.earned(address, rewardsToken).call()

    def factory(self) -> str:
        return self.contract.functions.factory().call()

    def getRewardForDuration(self, rewardsToken: str) -> int:
        return self.contract.functions.getRewardForDuration(rewardsToken).call()

    def lastTimeRewardApplicable(self, rewardsToken: str) -> int:
        return self.contract.functions.lastTimeRewardApplicable(rewardsToken).call()

    def minter(self) -> str:
        return self.contract.functions.minter().call()

    def owner(self) -> str:
        return self.contract.functions.owner().call()

    def rewardCount(self) -> int:
        return self.contract.functions.rewardCount().call()

    def rewardData(self, address: str) -> list:
        return self.contract.functions.rewardData(address).call()

    def rewardPerToken(self, rewardsToken: str) -> int:
        return self.contract.functions.rewardPerToken(rewardsToken).call()

    def rewardTokens(self, i: int) -> str:
        return self.contract.functions.rewardTokens(i).call()

    def rewards(self, address: str, token: str) -> int:
        return self.contract.functions.rewards(address, token).call()

    def userRewardPerTokenPaid(self, address: str, token: str) -> int:
        return self.contract.functions.userRewardPerTokenPaid(address, token).call()
