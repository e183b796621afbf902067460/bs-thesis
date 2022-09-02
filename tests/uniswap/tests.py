import pytest

from defi.protocols.uniswap.contracts.UniswapV2Pair import UniswapV2PairContract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestUniswapV2PairContract:

    _address = '0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='eth').produceProduct()

    _instance = UniswapV2PairContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, UniswapV2PairContract)

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
