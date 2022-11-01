import pytest

from defi.protocols.sushiswap.contracts.UniswapV2Pair import SushiSwapUniSwapV2PairContract
from defi.protocols.sushiswap.contracts.MasterChefV2 import SushiSwapMasterChefV2Contract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestSushiSwapUniSwapV2PairContract:

    _address = '0x611CDe65deA90918c0078ac0400A72B0D25B9bb1'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='eth').produceProduct()

    _instance = SushiSwapUniSwapV2PairContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, SushiSwapUniSwapV2PairContract)

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


class TestSushiSwapMasterChefV2Contract:

    _address = '0xEF0881eC094552b2e128Cf945EF17a6752B4Ec5d'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='eth').produceProduct()

    _instance = SushiSwapMasterChefV2Contract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, SushiSwapMasterChefV2Contract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_MASTER_CHEF(self):
        assert isinstance(self._instance.MASTER_CHEF(), str)

    def test_MASTER_PID(self):
        assert isinstance(self._instance.MASTER_PID(), int)

    def test_SUSHI(self):
        assert isinstance(self._instance.SUSHI(), str)

    def test_lpToken(self):
        _i = 0
        assert isinstance(self._instance.lpToken(i=_i), str)

    def test_migrator(self):
        assert isinstance(self._instance.migrator(), str)

    def test_owner(self):
        assert isinstance(self._instance.owner(), str)

    def test_pendingOwner(self):
        assert isinstance(self._instance.pendingOwner(), str)

    def test_pendingSushi(self):
        _pid = 0
        _user = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.pendingSushi(_pid=_pid, _user=_user), int)

    def test_poolInfo(self):
        _i = 0
        assert isinstance(self._instance.poolInfo(i=_i), list)

    def test_poolLength(self):
        assert isinstance(self._instance.poolLength(), int)

    def test_rewarder(self):
        _i = 0
        assert isinstance(self._instance.rewarder(i=_i), str)

    def test_sushiPerBlock(self):
        assert isinstance(self._instance.sushiPerBlock(), int)

    def test_totalAllocPoint(self):
        assert isinstance(self._instance.totalAllocPoint(), int)

    def test_userInfo(self):
        _pid = 0
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.userInfo(pid=_pid, address=_address), list)
