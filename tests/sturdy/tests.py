import pytest

from defi.protocols.sturdy.contracts.LendingPool import SturdyLendingPoolContract
from defi.protocols.sturdy.contracts.StakedTokenIncentivesController import SturdyStakedTokenIncentivesControllerContract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestSturdyLendingPoolContract:

    _address = '0xA422CA380bd70EeF876292839222159E41AAEe17'
    _provider = BridgeConfigurator(
        abstractFabric=providerAbstractFabric,
        fabricKey='http',
        productKey='eth')\
        .produceProduct()

    _instance = SturdyLendingPoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, SturdyLendingPoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_FLASHLOAN_PREMIUM_TOTAL(self):
        assert isinstance(self._instance.FLASHLOAN_PREMIUM_TOTAL(), int)

    def test_MAX_NUMBER_RESERVES(self):
        assert isinstance(self._instance.MAX_NUMBER_RESERVES(), int)

    def test_MAX_STABLE_RATE_BORROW_SIZE_PERCENT(self):
        assert isinstance(self._instance.MAX_STABLE_RATE_BORROW_SIZE_PERCENT(), int)

    def test_getAddressesProvider(self):
        assert isinstance(self._instance.getAddressesProvider(), str)

    def test_getBorrowingAssetAndVolumes(self):
        assert isinstance(self._instance.getBorrowingAssetAndVolumes(), list)

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

    def test_getTotalBalanceOfAssetPair(self):
        _asset = self._instance.getReservesList()[0]
        assert isinstance(self._instance.getTotalBalanceOfAssetPair(asset=_asset), list)

    def test_getUserAccountData(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserAccountData(address=_address), list)

    def test_getUserConfiguration(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserConfiguration(address=_address), tuple)

    def test_paused(self):
        assert isinstance(self._instance.paused(), bool)


class TestSturdyStakedTokenIncentivesControllerContract:

    _address = '0xA3e9B5e1dc6B24F296FfCF9c085E2546A466b883'
    _provider = BridgeConfigurator(
        abstractFabric=providerAbstractFabric,
        fabricKey='http',
        productKey='eth')\
        .produceProduct()

    _instance = SturdyStakedTokenIncentivesControllerContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, SturdyStakedTokenIncentivesControllerContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_DISTRIBUTION_END(self):
        assert isinstance(self._instance.DISTRIBUTION_END(), int)

    def test_EMISSION_MANAGER(self):
        assert isinstance(self._instance.EMISSION_MANAGER(), str)

    def test_PRECISION(self):
        assert isinstance(self._instance.PRECISION(), int)

    def test_REWARD_TOKEN(self):
        assert isinstance(self._instance.REWARD_TOKEN(), str)

    def test_assets(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.assets(address=_asset), list)

    def test_getAssetData(self):
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getAssetData(asset=_asset), list)

    def test_getClaimer(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getClaimer(address=_address), str)

    def test_getDistributionEnd(self):
        assert isinstance(self._instance.getDistributionEnd(), int)

    def test_getRewardsBalance(self):
        _address = '0x0000000000000000000000000000000000000000'
        _assets = ['0x62FBF417978259a67a362aB603e09bC8795159E6']
        assert isinstance(self._instance.getRewardsBalance(address=_address, assets=_assets), int)

    def test_getUserAssetData(self):
        _address = '0x0000000000000000000000000000000000000000'
        _asset = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserAssetData(user=_address, asset=_asset), int)

    def test_getUserUnclaimedRewards(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.getUserUnclaimedRewards(user=_address), int)
