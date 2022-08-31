import pytest

from defi.protocols.convex.contracts.BaseRewardPool import ConvexBaseRewardPoolContract
from defi.protocols.convex.contracts.VirtualBalanceRewardPool import ConvexVirtualBalanceRewardPoolContract

from head.bridge.configurator import BridgeConfigurator
from head.consts.chains.const import Chains
from providers.abstracts.fabric import providerAbstractFabric


class TestConvexBaseRewardPoolContract:

    _address = '0x22eE18aca7F3Ee920D01F25dA85840D12d98E8Ca'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey=Chains.ETH).produceProduct()

    _instance = ConvexBaseRewardPoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, ConvexBaseRewardPoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_balanceOf(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.balanceOf(address=_address), int)

    def test_currentRewards(self):
        assert isinstance(self._instance.currentRewards(), int)

    def test_duration(self):
        assert isinstance(self._instance.duration(), int)

    def test_earned(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.earned(address=_address), int)

    def test_extraRewards(self):
        _i = 0
        assert isinstance(self._instance.extraRewards(i=_i), str)

    def test_extraRewardsLength(self):
        assert isinstance(self._instance.extraRewardsLength(), int)

    def test_historicalRewards(self):
        assert isinstance(self._instance.historicalRewards(), int)

    def test_lastTimeRewardApplicable(self):
        assert isinstance(self._instance.lastTimeRewardApplicable(), int)

    def test_lastUpdateTime(self):
        assert isinstance(self._instance.lastUpdateTime(), int)

    def test_newRewardRatio(self):
        assert isinstance(self._instance.newRewardRatio(), int)

    def test_operator(self):
        assert isinstance(self._instance.operator(), str)

    def test_periodFinish(self):
        assert isinstance(self._instance.periodFinish(), int)

    def test_pid(self):
        assert isinstance(self._instance.pid(), int)

    def test_queuedRewards(self):
        assert isinstance(self._instance.queuedRewards(), int)

    def test_rewardManager(self):
        assert isinstance(self._instance.rewardManager(), str)

    def test_rewardPerToken(self):
        assert isinstance(self._instance.rewardPerToken(), int)

    def test_rewardPerTokenStored(self):
        assert isinstance(self._instance.rewardPerTokenStored(), int)

    def test_rewardRate(self):
        assert isinstance(self._instance.rewardRate(), int)

    def test_rewardToken(self):
        assert isinstance(self._instance.rewardToken(), str)

    def test_rewards(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.rewards(address=_address), int)

    def test_stakingToken(self):
        assert isinstance(self._instance.stakingToken(), str)

    def test_totalSupply(self):
        assert isinstance(self._instance.totalSupply(), int)

    def test_userRewardPerTokenPaid(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.userRewardPerTokenPaid(address=_address), int)

