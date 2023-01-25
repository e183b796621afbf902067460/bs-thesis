import unittest

import builtins

from d3tl.handlers.hedge_to_borrows.aave.handlers import AaveV3HedgeToBorrowsHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from trad3r.root.composite.trader import rootTrad3r

from raffaelo.providers.http.provider import HTTPProvider


class TestAaveV3HedgeToBorrowsHandler(unittest.TestCase):

    address = '0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174'

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')
    chain = 'polygon'

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='hedge_to_borrows',
        handler_name='aaveV3'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        chain=chain,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, AaveV3HedgeToBorrowsHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):

        overview = self.handler.get_overview(address='0xe771d0daf2062aaaa09ddd93e0171d572fc09e66')
        builtins.print('\n', overview)
