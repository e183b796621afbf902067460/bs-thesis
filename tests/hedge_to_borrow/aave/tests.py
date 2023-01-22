import unittest

import builtins

from d3tl.handlers.hedge_to_borrow.aave.handlers import AaveV3HedgeToBorrowHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator

from raffaelo.providers.http.provider import HTTPProvider


class TestAaveV3HedgeToBorrowHandler(unittest.TestCase):

    address = '0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619'

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')
    chain_name = 'polygon'

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='hedge_to_borrow',
        handler_name='aaveV3'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        chain=chain_name
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, AaveV3HedgeToBorrowHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):

        overview = self.handler.get_overview(address='0xA317F0B42d17C86A14F1a7392D054282B9639EC4')
        builtins.print('\n', overview)
