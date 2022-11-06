import pytest

from defi.protocols.nereus.contracts.LendingPool import NereusLendingPoolContract
from defi.protocols.nereus.contracts.ChefIncentivesController import NereusChiefIncentivesControllerContract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestNereusLendingPoolContract:

    _address = '0xB9257597EDdfA0eCaff04FF216939FBc31AAC026'
    _provider = BridgeConfigurator(
        abstractFabric=providerAbstractFabric,
        fabricKey='http',
        productKey='avax')\
        .produceProduct()

    _instance = NereusLendingPoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, NereusLendingPoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_FLASHLOAN_PREMIUM_TOTAL(self):
        assert isinstance(self._instance.FLASHLOAN_PREMIUM_TOTAL(), int)

    def test_LENDINGPOOL_REVISION(self):
        assert isinstance(self._instance.LENDINGPOOL_REVISION(), int)

    def test_MAX_NUMBER_RESERVES(self):
        assert isinstance(self._instance.MAX_NUMBER_RESERVES(), int)

    def test_MAX_STABLE_RATE_BORROW_SIZE_PERCENT(self):
        assert isinstance(self._instance.MAX_STABLE_RATE_BORROW_SIZE_PERCENT(), int)

    def test_getAddressesProvider(self):
        assert isinstance(self._instance.getAddressesProvider(), str)

    def test_getConfiguration(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getConfiguration(asset=_asset), tuple)

    def test_getReserveData(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getReserveData(asset=_asset), tuple)

    def test_getReserveNormalizedIncome(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getReserveNormalizedIncome(asset=_asset), int)

    def test_getReserveNormalizedVariableDebt(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getReserveNormalizedVariableDebt(asset=_asset), int)

    def test_getReservesList(self):
        assert isinstance(self._instance.getReservesList(), list)

    def test_getUserAccountData(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserAccountData(address=_address), list)

    def test_getUserConfiguration(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserConfiguration(address=_address), tuple)

    def test_liquidators(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.liquidators(address=_address), bool)

    def test_paused(self):
        assert isinstance(self._instance.paused(), bool)


class TestNereusChiefIncentivesControllerContract:

    _address = '0xa57a8C5dd29bd9CC605027E62935db2cB5485378'
    _provider = BridgeConfigurator(
        abstractFabric=providerAbstractFabric,
        fabricKey='http',
        productKey='avax')\
        .produceProduct()

    _instance = NereusChiefIncentivesControllerContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, NereusChiefIncentivesControllerContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_claimReceiver(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.claimReceiver(address=_address), str)

    def test_claimableReward(self):
        _address = '0x0000000000000000000000000000000000000000'
        _tokens = ['0x0000000000000000000000000000000000000000']
        assert isinstance(self._instance.claimableReward(address=_address, tokens=_tokens), list)

    def test_emissionSchedule(self):
        _i = 0
        assert isinstance(self._instance.emissionSchedule(i=_i), list)

    def test_maxMintableTokens(self):
        assert isinstance(self._instance.maxMintableTokens(), int)

    def test_mintedTokens(self):
        assert isinstance(self._instance.mintedTokens(), int)

    def test_owner(self):
        assert isinstance(self._instance.owner(), str)

    def test_poolConfigurator(self):
        assert isinstance(self._instance.poolConfigurator(), str)

    def test_poolInfo(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.poolInfo(address=_address), list)

    def test_poolLength(self):
        assert isinstance(self._instance.poolLength(), int)

    def test_registeredTokens(self):
        _i = 0
        assert isinstance(self._instance.registeredTokens(i=_i), str)

    def test_rewardMinter(self):
        assert isinstance(self._instance.rewardMinter(), str)

    def test_rewardsPerSecond(self):
        assert isinstance(self._instance.rewardsPerSecond(), int)

    def test_startTime(self):
        assert isinstance(self._instance.startTime(), int)

    def test_totalAllocPoint(self):
        assert isinstance(self._instance.totalAllocPoint(), int)

    def test_userBaseClaimable(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.userBaseClaimable(address=_address), int)

    def test_userInfo(self):
        _address = '0x0000000000000000000000000000000000000000'
        _token = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.userInfo(address=_address, token=_token), list)
