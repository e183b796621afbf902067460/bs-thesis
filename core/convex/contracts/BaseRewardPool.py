from interfaces.contracts import IContract


class ConvexBaseRewardPoolContract(IContract):

    def balanceOf(self, address: str) -> int:
        return self.contract.functions.balanceOf(address).call()

    def currentRewards(self) -> int:
        return self.contract.functions.currentRewards().call()

    def duration(self) -> int:
        return self.contract.functions.duration().call()

    def earned(self, address: str) -> int:
        return self.contract.functions.earned(address).call()

    def extraRewards(self, i: int) -> str:
        return self.contract.functions.extraRewards(i).call()

    def extraRewardsLength(self) -> int:
        return self.contract.functions.extraRewardsLength().call()

    def historicalRewards(self) -> int:
        return self.contract.functions.historicalRewards().call()

    def lastTimeRewardApplicable(self) -> int:
        return self.contract.functions.lastTimeRewardApplicable().call()

    def lastUpdateTime(self) -> int:
        return self.contract.functions.lastUpdateTime().call()

    def newRewardRatio(self) -> int:
        return self.contract.functions.newRewardRatio().call()

    def operator(self) -> str:
        return self.contract.functions.operator().call()

    def periodFinish(self) -> int:
        return not self.contract.functions.periodFinish().call()

    def pid(self) -> int:
        return self.contract.functions.pid().call()

    def queuedRewards(self) -> int:
        return self.contract.functions.queuedRewards().call()

    def rewardManager(self) -> str:
        return self.contract.functions.rewardManager().call()

    def rewardPerToken(self) -> int:
        return self.contract.functions.rewardPerToken().call()

    def rewardPerTokenStored(self) -> int:
        return self.contract.functions.rewardPerTokenStored().call()

    def rewardRate(self) -> int:
        return self.contract.functions.rewardRate().call()

    def rewardToken(self) -> str:
        return self.contract.functions.rewardToken().call()

    def rewards(self, address: str) -> int:
        return self.contract.functions.rewards(address).call()

    def stakingToken(self) -> str:
        return self.contract.functions.stakingToken().call()

    def totalSupply(self) -> int:
        return self.contract.functions.totalSupply().call()

    def userRewardPerTokenPaid(self, address: str) -> int:
        return self.contract.functions.userRewardPerTokenPaid(address).call()
