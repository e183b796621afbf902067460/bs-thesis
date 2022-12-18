import pytest

from defi.protocols.kyberswap.contracts.Pool import KyberSwapPoolContract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestKyberSwapPoolContract:

    _address = '0xCaCba79427a10008804aDD4f642275AE76419d6a'
    _provider = BridgeConfigurator(
        abstractFabric=providerAbstractFabric,
        fabricKey='http',
        productKey='matic'
    ).produceProduct()

    _instance = KyberSwapPoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, KyberSwapPoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

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

    def test_getFeeGrowthGlobal(self):
        assert isinstance(self._instance.getFeeGrowthGlobal(), int)

    def test_getLiquidityState(self):
        assert isinstance(self._instance.getLiquidityState(), list)

    def test_getPoolState(self):
        assert isinstance(self._instance.getPoolState(), list)

    def test_getPositions(self):
        _owner = '0x0000000000000000000000000000000000000000'
        _tickLower = -507
        _tickUpper = -505
        assert isinstance(self._instance.getPositions(owner=_owner, tickLower=_tickLower, tickUpper=_tickUpper), list)

    def test_getSecondsPerLiquidityData(self):
        assert isinstance(self._instance.getSecondsPerLiquidityData(), list)

    def test_getSecondsPerLiquidityInside(self):
        _tickLower = -507
        _tickUpper = -505
        assert isinstance(self._instance.getSecondsPerLiquidityInside(tickLower=_tickLower, tickUpper=_tickUpper), int)

    def test_initializedTicks(self):
        _i = 0
        assert isinstance(self._instance.initializedTicks(i=_i), list)

    def test_maxTickLiquidity(self):
        assert isinstance(self._instance.maxTickLiquidity(), int)

    def test_name(self):
        assert isinstance(self._instance.name(), str)

    def test_swapFeeUnits(self):
        assert isinstance(self._instance.swapFeeUnits(), int)

    def test_symbol(self):
        assert isinstance(self._instance.symbol(), str)

    def test_tickDistance(self):
        assert isinstance(self._instance.tickDistance(), int)

    def test_ticks(self):
        _i = 0
        assert isinstance(self._instance.ticks(i=_i), list)

    def test_token0(self):
        assert isinstance(self._instance.token0(), str)

    def test_token1(self):
        assert isinstance(self._instance.token1(), str)

    def test_totalSupply(self):
        assert isinstance(self._instance.totalSupply(), int)