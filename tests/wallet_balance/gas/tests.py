import unittest

import builtins

from d3tl.handlers.wallet_balance.gas.handlers import GasWalletBalanceHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from trad3r.root.composite.trader import rootTrad3r

from raffaelo.providers.http.provider import HTTPProvider


class TestGasWalletBalanceHandler(unittest.TestCase):

    gas_symbol = 'MATIC'

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='wallet_balance',
        handler_name='gas'
    ).produce_handler()
    handler = product(
        gas_symbol=gas_symbol,
        provider=provider,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, GasWalletBalanceHandler)

    def testAddress(self):
        self.assertEqual(self.handler.gas_symbol, self.gas_symbol)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):

        overview = self.handler.get_overview(address='0xe771d0daf2062aaaa09ddd93e0171d572fc09e66')
        builtins.print('\n', overview)
