import unittest

import builtins
from datetime import datetime, timezone, timedelta

from d3tl.handlers.bids_and_asks.quickswap.handlers import QuickSwapV2BidsAndAsksHandler, QuickSwapV3BidsAndAsksHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from d3tl.consts.chains.consts import POLYGON
from trad3r.root.composite.trader import rootTrad3r

from raffaelo.providers.http.provider import HTTPProvider


class TestQuickSwapV2BidsAndAsksHandler(unittest.TestCase):

    address = '0x6e7a5FAFcec6BB1e78bAE2A1F0B612012BF14827'

    scan_api_url = 'https://api.polygonscan.com/'
    scan_api_key = ''
    gas_symbol = 'MATIC'
    block_limit = 3000

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='bids_and_asks',
        handler_name='quickswapV2'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        uri=scan_api_url,
        api_key=scan_api_key,
        block_limit=block_limit,
        gas_symbol=gas_symbol,
        chain=POLYGON,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, QuickSwapV2BidsAndAsksHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):
        end_time = datetime.utcnow()
        start_time = end_time - timedelta(minutes=10)

        overview = self.handler.get_overview(
            start=start_time,
            end=end_time,
            is_reverse=False
        )
        builtins.print('\n', overview)


class TestQuickSwapV3BidsAndAsksHandler(unittest.TestCase):

    address = '0xAE81FAc689A1b4b1e06e7ef4a2ab4CD8aC0A087D'

    scan_api_url = 'https://api.polygonscan.com/'
    scan_api_key = ''
    gas_symbol = 'MATIC'
    block_limit = 3000

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='bids_and_asks',
        handler_name='quickswapV3'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        uri=scan_api_url,
        api_key=scan_api_key,
        block_limit=block_limit,
        gas_symbol=gas_symbol,
        chain=POLYGON,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, QuickSwapV3BidsAndAsksHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):
        end_time = datetime.utcnow()
        start_time = end_time - timedelta(minutes=10)

        overview = self.handler.get_overview(
            start=start_time,
            end=end_time,
            is_reverse=False
        )
        builtins.print('\n', overview)
