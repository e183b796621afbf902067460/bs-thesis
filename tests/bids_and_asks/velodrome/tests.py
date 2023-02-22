import unittest

import builtins
from datetime import datetime, timezone, timedelta

from d3tl.handlers.bids_and_asks.velodrome.handlers import VelodromeBidsAndAsksHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from d3tl.consts.chains.consts import OPTIMISM
from trad3r.root.composite.trader import rootTrad3r

from raffaelo.providers.http.provider import HTTPProvider


class TestVelodromeBidsAndAsksHandler(unittest.TestCase):

    address = '0x79c912FEF520be002c2B6e57EC4324e260f38E50'

    scan_api_url = 'https://api-optimistic.etherscan.io/'
    scan_api_key = ''
    gas_symbol = 'ETH'
    block_limit = 3000

    provider = HTTPProvider(uri='https://rpc.ankr.com/optimism')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='bids_and_asks',
        handler_name='velodrome'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        uri=scan_api_url,
        api_key=scan_api_key,
        block_limit=block_limit,
        gas_symbol=gas_symbol,
        chain=OPTIMISM,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, VelodromeBidsAndAsksHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):
        end_time = datetime.utcnow()
        start_time = end_time - timedelta(minutes=5)

        overview = self.handler.get_overview(
            start=start_time,
            end=end_time,
            is_reverse=False
        )
        builtins.print('\n', overview)
