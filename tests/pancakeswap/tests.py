import pytest

from defi.protocols.pancakeswap.contracts.PancakePair import PancakePairContract
from defi.protocols.pancakeswap.contracts.MasterChefV2 import PancakeSwapMasterChefV2Contract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestPancakePairContract:

    _address = '0x0eD7e52944161450477ee417DE9Cd3a859b14fD0'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='bsc').produceProduct()

    _instance = PancakePairContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, PancakePairContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_DOMAIN_SEPARATOR(self):
        assert isinstance(self._instance.DOMAIN_SEPARATOR(), bytes)

    def test_MINIMUM_LIQUIDITY(self):
        assert isinstance(self._instance.MINIMUM_LIQUIDITY(), int)

    def test_PERMIT_TYPEHASH(self):
        assert isinstance(self._instance.PERMIT_TYPEHASH(), bytes)

    def test_allowance(self):
        _arg0 = '0x0000000000000000000000000000000000000000'
        _arg1 = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.allowance(arg0=_arg0, arg1=_arg1), int)

    def test_balanceOf(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.balanceOf(address=_address), int)

    def test_decimals(self):
        assert isinstance(self._instance.decimals(), int)

    def test_factory(self):
        assert isinstance(self._instance.factory(), str)

    def test_getReserves(self):
        assert isinstance(self._instance.getReserves(), list)

    def test_kLast(self):
        assert isinstance(self._instance.kLast(), int)

    def test_name(self):
        assert isinstance(self._instance.name(), str)

    def test_nonces(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.nonces(address=_address), int)

    def test_price0CumulativeLast(self):
        assert isinstance(self._instance.price0CumulativeLast(), int)

    def test_price1CumulativeLast(self):
        assert isinstance(self._instance.price1CumulativeLast(), int)

    def test_symbol(self):
        assert isinstance(self._instance.symbol(), str)

    def test_token0(self):
        assert isinstance(self._instance.token0(), str)

    def test_token1(self):
        assert isinstance(self._instance.token1(), str)

    def test_totalSupply(self):
        assert isinstance(self._instance.totalSupply(), int)


class TestMasterChefV2Contract:

    _address = '0xa5f8C5Dbd5F286960b9d90548680aE5ebFf07652'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='bsc').produceProduct()

    _instance = PancakeSwapMasterChefV2Contract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, PancakeSwapMasterChefV2Contract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_ACC_CAKE_PRECISION(self):
        assert isinstance(self._instance.ACC_CAKE_PRECISION(), int)

    def test_BOOST_PRECISION(self):
        assert isinstance(self._instance.BOOST_PRECISION(), int)

    def test_CAKE(self):
        assert isinstance(self._instance.CAKE(), str)

    def test_CAKE_RATE_TOTAL_PRECISION(self):
        assert isinstance(self._instance.CAKE_RATE_TOTAL_PRECISION(), int)

    def test_MASTERCHEF_CAKE_PER_BLOCK(self):
        assert isinstance(self._instance.MASTERCHEF_CAKE_PER_BLOCK(), int)

    def test_MASTER_CHEF(self):
        assert isinstance(self._instance.MASTER_CHEF(), str)

    def test_MASTER_PID(self):
        assert isinstance(self._instance.MASTER_PID(), int)

    def test_MAX_BOOST_PRECISION(self):
        assert isinstance(self._instance.MAX_BOOST_PRECISION(), int)

    def test_boostContract(self):
        assert isinstance(self._instance.boostContract(), str)

    def test_burnAdmin(self):
        assert isinstance(self._instance.burnAdmin(), str)

    def test_cakePerBlock(self):
        _isRegular = True
        assert isinstance(self._instance.cakePerBlock(_isRegular=_isRegular), int)

    def test_cakePerBlockToBurn(self):
        assert isinstance(self._instance.cakePerBlockToBurn(), int)

    def test_cakeRateToBurn(self):
        assert isinstance(self._instance.cakeRateToBurn(), int)

    def test_cakeRateToRegularFarm(self):
        assert isinstance(self._instance.cakeRateToRegularFarm(), int)

    def test_cakeRateToSpecialFarm(self):
        assert isinstance(self._instance.cakeRateToSpecialFarm(), int)

    def test_getBoostMultiplier(self):
        _user = '0x0000000000000000000000000000000000000000'
        _pid = 0
        assert isinstance(self._instance.getBoostMultiplier(_user=_user, _pid=_pid), int)

    def test_lastBurnedBlock(self):
        assert isinstance(self._instance.lastBurnedBlock(), int)

    def test_lpToken(self):
        _i = 0
        assert isinstance(self._instance.lpToken(i=_i), str)

    def test_owner(self):
        assert isinstance(self._instance.owner(), str)

    def test_pendingCake(self):
        _pid = 0
        _user = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.pendingCake(_pid=_pid, _user=_user), int)

    def test_poolInfo(self):
        _i = 0
        assert isinstance(self._instance.poolInfo(i=_i), list)

    def test_poolLength(self):
        assert isinstance(self._instance.poolLength(), int)

    def test_totalRegularAllocPoint(self):
        assert isinstance(self._instance.totalRegularAllocPoint(), int)

    def test_totalSpecialAllocPoint(self):
        assert isinstance(self._instance.totalSpecialAllocPoint(), int)

    def test_userInfo(self):
        _pid = 0
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.userInfo(pid=_pid, address=_address), list)

    def test_whiteList(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.whiteList(address=_address), bool)
