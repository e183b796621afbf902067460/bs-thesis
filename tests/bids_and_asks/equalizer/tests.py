import unittest

import builtins
from datetime import datetime, timezone, timedelta

from d3tl.handlers.bids_and_asks.equalizer.handlers import EqualizerBidsAndAsksHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from d3tl.consts.chains.consts import FANTOM
from trad3r.root.composite.trader import rootTrad3r

from raffaelo.providers.http.provider import HTTPProvider


class TestEqualizerBidsAndAsksHandler(unittest.TestCase):

    address = '0x7547d05dFf1DA6B4A2eBB3f0833aFE3C62ABD9a1'

    scan_api_url = 'https://api.ftmscan.com/'
    scan_api_key = ''
    gas_symbol = 'FTM'
    block_limit = 3000

    provider = HTTPProvider(uri='https://rpc.ankr.com/fantom')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='bids_and_asks',
        handler_name='equalizer'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider,
        uri=scan_api_url,
        api_key=scan_api_key,
        block_limit=block_limit,
        gas_symbol=gas_symbol,
        chain=FANTOM,
        trader=rootTrad3r
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, EqualizerBidsAndAsksHandler)

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
            is_reverse=True
        )
        builtins.print('\n', overview)
