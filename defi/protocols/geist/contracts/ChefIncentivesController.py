from head.interfaces.contracts.builder import IContract


class GeistChiefIncentivesControllerContract(IContract):

    _abi: str = '[{"inputs":[{"internalType":"uint128[]","name":"_startTimeOffset","type":"uint128[]"},{"internalType":"uint128[]","name":"_rewardsPerSecond","type":"uint128[]"},{"internalType":"address","name":"_poolConfigurator","type":"address"},{"internalType":"contract IMultiFeeDistribution","name":"_rewardMinter","type":"address"},{"internalType":"uint256","name":"_maxMintable","type":"uint256"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"token","type":"address"},{"indexed":true,"internalType":"address","name":"user","type":"address"},{"indexed":false,"internalType":"uint256","name":"balance","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"totalSupply","type":"uint256"}],"name":"BalanceUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"inputs":[{"internalType":"address","name":"_token","type":"address"},{"internalType":"uint256","name":"_allocPoint","type":"uint256"}],"name":"addPool","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address[]","name":"_tokens","type":"address[]"},{"internalType":"uint256[]","name":"_allocPoints","type":"uint256[]"}],"name":"batchUpdateAllocPoint","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_user","type":"address"},{"internalType":"address[]","name":"_tokens","type":"address[]"}],"name":"claim","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"claimReceiver","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_user","type":"address"},{"internalType":"address[]","name":"_tokens","type":"address[]"}],"name":"claimableReward","outputs":[{"internalType":"uint256[]","name":"","type":"uint256[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"emissionSchedule","outputs":[{"internalType":"uint128","name":"startTimeOffset","type":"uint128"},{"internalType":"uint128","name":"rewardsPerSecond","type":"uint128"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_user","type":"address"},{"internalType":"uint256","name":"_balance","type":"uint256"},{"internalType":"uint256","name":"_totalSupply","type":"uint256"}],"name":"handleAction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"maxMintableTokens","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"mintedTokens","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"poolConfigurator","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"poolInfo","outputs":[{"internalType":"uint256","name":"totalSupply","type":"uint256"},{"internalType":"uint256","name":"allocPoint","type":"uint256"},{"internalType":"uint256","name":"lastRewardTime","type":"uint256"},{"internalType":"uint256","name":"accRewardPerShare","type":"uint256"},{"internalType":"contract IOnwardIncentivesController","name":"onwardIncentives","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"poolLength","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"registeredTokens","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"rewardMinter","outputs":[{"internalType":"contract IMultiFeeDistribution","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"rewardsPerSecond","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_user","type":"address"},{"internalType":"address","name":"_receiver","type":"address"}],"name":"setClaimReceiver","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_token","type":"address"},{"internalType":"contract IOnwardIncentivesController","name":"_incentives","type":"address"}],"name":"setOnwardIncentives","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"start","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"startTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalAllocPoint","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"}],"name":"userInfo","outputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"rewardDebt","type":"uint256"}],"stateMutability":"view","type":"function"}]'

    def claimReceiver(self, address: str) -> str:
        return self.contract.functions.claimReceiver(address).call()

    def claimableReward(self, address: str, tokens: list) -> list:
        return self.contract.functions.claimableReward(address, tokens).call()

    def emissionSchedule(self, i: int) -> list:
        return self.contract.functions.emissionSchedule(i).call()

    def maxMintableTokens(self) -> int:
        return self.contract.functions.maxMintableTokens().call()

    def mintedTokens(self) -> int:
        return self.contract.functions.mintedTokens().call()

    def owner(self) -> str:
        return self.contract.functions.owner().call()

    def poolConfigurator(self) -> str:
        return self.contract.functions.poolConfigurator().call()

    def poolInfo(self, address: str) -> list:
        return self.contract.functions.poolInfo(address).call()

    def poolLength(self) -> int:
        return self.contract.functions.poolLength().call()

    def registeredTokens(self, i: int) -> str:
        return self.contract.functions.registeredTokens(i).call()

    def rewardMinter(self) -> str:
        return self.contract.functions.rewardMinter().call()

    def rewardsPerSecond(self) -> int:
        return self.contract.functions.rewardsPerSecond().call()

    def startTime(self) -> int:
        return not self.contract.functions.startTime().call()

    def totalAllocPoint(self) -> int:
        return self.contract.functions.totalAllocPoint().call()

    def userInfo(self, token: str, address: str) -> list:
        return self.contract.functions.userInfo(token, address).call()
