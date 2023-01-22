import unittest

import builtins

from d3tl.handlers.wallet_balance.erc_20.handlers import ERC20WalletBalanceHandler
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator

from raffaelo.providers.http.provider import HTTPProvider


class TestERC20WalletBalanceHandler(unittest.TestCase):

    address = '0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270'

    provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')

    product = D3BridgeConfigurator(
        abstract=d3Abstract,
        fabric_name='wallet_balance',
        handler_name='erc20'
    ).produce_handler()
    handler = product(
        address=address,
        provider=provider
    )

    def testInstance(self):
        self.assertIsInstance(self.handler, ERC20WalletBalanceHandler)

    def testAddress(self):
        self.assertEqual(self.handler.contract.address, self.address)

    def testProvider(self):
        self.assertEqual(self.handler.provider, self.provider)

    def test_get_overview(self):

        overview = self.handler.get_overview(address='0xe771d0daf2062aaaa09ddd93e0171d572fc09e66')
        builtins.print('\n', overview)
