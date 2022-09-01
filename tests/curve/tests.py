import pytest

from defi.protocols.curve.contracts.Pool import CurvePoolContract
from defi.protocols.curve.contracts.Gauge import CurveGaugeContract

from head.bridge.configurator import BridgeConfigurator
from head.consts.chains.const import Chains
from providers.abstracts.fabric import providerAbstractFabric


class TestCurvePoolContract:

    _address = '0xbEbc44782C7dB0a1A60Cb6fe97d0b483032FF1C7'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey=Chains.ETH).produceProduct()

    _instance = CurvePoolContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, CurvePoolContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_A(self):
        assert isinstance(self._instance.A(), int)

    def test_get_virtual_price(self):
        assert isinstance(self._instance.get_virtual_price(), int)

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


class TestCurveGaugeContract:

    _address = '0xbFcF63294aD7105dEa65aA58F8AE5BE2D9d0952A'
    _provider = BridgeConfigurator(abstractFabric=providerAbstractFabric, fabricKey='http', productKey=Chains.ETH).produceProduct()

    _instance = CurveGaugeContract()\
        .setAddress(address=_address)\
        .setProvider(provider=_provider)\
        .create()

    def testInstance(self):
        assert isinstance(self._instance, CurveGaugeContract)

    def testAddress(self):
        assert self._instance.address == self._address

    def testProvider(self):
        assert self._instance.provider == self._provider

    def test_integrate_checkpoint(self):
        assert isinstance(self._instance.integrate_checkpoint(), int)

    def test_minter(self):
        assert isinstance(self._instance.minter(), str)

    def test_crv_token(self):
        assert isinstance(self._instance.crv_token(), str)

    def test_lp_token(self):
        assert isinstance(self._instance.lp_token(), str)

    def test_controller(self):
        assert isinstance(self._instance.controller(), str)

    def test_voting_escrow(self):
        assert isinstance(self._instance.voting_escrow(), str)

    def test_balanceOf(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.balanceOf(address=_address), int)

    def test_totalSupply(self):
        assert isinstance(self._instance.totalSupply(), int)

    def test_future_epoch_time(self):
        assert isinstance(self._instance.future_epoch_time(), int)

    def test_approved_to_deposit(self):
        _arg0 = '0x0000000000000000000000000000000000000000'
        _arg1 = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.approved_to_deposit(arg0=_arg0, arg1=_arg1), bool)

    def test_working_balances(self):
        _arg0 = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.working_balances(arg0=_arg0), int)

    def test_working_supply(self):
        assert isinstance(self._instance.working_supply(), int)

    def test_period(self):
        assert isinstance(self._instance.period(), int)

    def test_period_timestamp(self):
        _arg0 = 0
        assert isinstance(self._instance.period_timestamp(arg0=_arg0), int)

    def test_integrate_inv_supply(self):
        _arg0 = 0
        assert isinstance(self._instance.integrate_inv_supply(arg0=_arg0), int)

    def test_integrate_inv_supply_of(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.integrate_inv_supply_of(address=_address), int)

    def test_integrate_checkpoint_of(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.integrate_checkpoint_of(address=_address), int)

    def test_integrate_fraction(self):
        _address = '0x0000000000000000000000000000000000000000'
        assert isinstance(self._instance.integrate_fraction(address=_address), int)

    def test_inflation_rate(self):
        assert isinstance(self._instance.inflation_rate(), int)
