import pytest

from defi.protocols.ellipsis.contracts.Pool import EllipsisPoolContract

from head.bridge.configurator import BridgeConfigurator
from providers.abstracts.fabric import providerAbstractFabric


class TestEllipsisPoolContract:

    _address = '0x160CAed03795365F3A589f10C379FfA7d75d4E76'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey='bsc').produceProduct()

    _instance = EllipsisPoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, EllipsisPoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_A(self):
        assert isinstance(self._instance.A(), int)

    def test_calc_token_amount(self):
        _amounts = [1, 2, 3]
        _deposit = True
        assert isinstance(self._instance.calc_token_amount(amounts=_amounts, deposit=_deposit), int)

    def test_get_dy(self):
        _i = 0
        _j = 1
        _dx = 2
        assert isinstance(self._instance.get_dy(i=_i, j=_j, dx=_dx), int)

    def test_get_dy_underlying(self):
        _i = 0
        _j = 1
        _dx = 2
        assert isinstance(self._instance.get_dy_underlying(i=_i, j=_j, dx=_dx), int)

    def test_calc_withdraw_one_coin(self):
        _token_amount = 1
        _i = 0
        assert isinstance(self._instance.calc_withdraw_one_coin(_token_amount=_token_amount, i=_i), int)

    def test_admin_balances(self):
        _i = 0
        assert isinstance(self._instance.admin_balances(i=_i), int)

    def test_coins(self):
        _arg0 = 0
        assert isinstance(self._instance.coins(arg0=_arg0), str)

    def test_balances(self):
        _arg0 = 0
        assert isinstance(self._instance.balances(arg0=_arg0), int)

    def test_fee(self):
        assert isinstance(self._instance.fee(), int)

    def test_admin_fee(self):
        assert isinstance(self._instance.admin_fee(), int)

    def test_owner(self):
        assert isinstance(self._instance.owner(), str)

    def test_fee_converter(self):
        assert isinstance(self._instance.fee_converter(), str)

    def test_initial_A(self):
        assert isinstance(self._instance.initial_A(), int)

    def test_future_A(self):
        assert isinstance(self._instance.future_A(), int)

    def test_initial_A_time(self):
        assert isinstance(self._instance.initial_A_time(), int)

    def test_future_A_time(self):
        assert isinstance(self._instance.future_A_time(), int)

    def test_admin_actions_deadline(self):
        assert isinstance(self._instance.admin_actions_deadline(), int)

    def test_transfer_ownership_deadline(self):
        assert isinstance(self._instance.transfer_ownership_deadline(), int)

    def test_future_fee(self):
        assert isinstance(self._instance.future_fee(), int)

    def test_future_admin_fee(self):
        assert isinstance(self._instance.future_admin_fee(), int)

    def test_future_owner(self):
        assert isinstance(self._instance.future_owner(), str)
