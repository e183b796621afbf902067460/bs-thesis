from interfaces.contracts import IContract


class UniswapStakingRewardsContract(IContract):

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def earned(self, address: str) -> int:
        return self.contract.functions.earned(address).call()

    def getRewardForDuration(self) -> int:
        return self.contract.functions.getRewardForDuration().call()

    def lastTimeRewardApplicable(self) -> int:
        return self.contract.functions.lastTimeRewardApplicable().call()

    def lastUpdateTime(self) -> int:
        return self.contract.functions.lastUpdateTime().call()

    def periodFinish(self) -> int:
        return self.contract.functions.periodFinish().call()

    def rewardPerToken(self) -> int:
        return self.contract.functions.rewardPerToken().call()

    def rewardPerTokenStored(self) -> int:
        return self.contract.functions.rewardPerTokenStored().call()

    def rewardRate(self) -> int:
        return self.contract.functions.rewardRate().call()

    def rewards(self, address: str) -> int:
        return self.contract.functions.rewards(address).call()

    def rewardsDistribution(self) -> str:
        return self.contract.functions.rewardsDistribution().call()

    def rewardsDuration(self) -> int:
        return self.contract.functions.rewardsDuration().call()

    def rewardsToken(self) -> str:
        return self.contract.functions.rewardsToken().call()

    def stakingToken(self) -> str:
        return self.contract.functions.stakingToken().call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()

    def userRewardPerTokenPaid(self, address: str) -> int:
        return self.contract.functions.userRewardPerTokenPaid(address).call()
