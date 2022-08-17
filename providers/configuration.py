from web3.providers.rpc import HTTPProvider
import os

from orm.consts.chainName import ChainName


class ProviderConfigurationFabric(object):

    def __init__(self) -> None:
        self._providers: dict = dict()

    def add_provider(self, chain: str, uri: str) -> None:
        if not self._providers.get(chain):
            self._providers[chain]: HTTPProvider = HTTPProvider(endpoint_uri=uri)

    def get_provider(self, chain: str) -> HTTPProvider:
        provider: HTTPProvider = self._providers.get(chain)
        if not provider:
            raise ValueError(f'Set provider for {chain} blockchain')
        return provider


providerConfigurator = ProviderConfigurationFabric()

providerConfigurator.add_provider(chain=ChainName.ETH, uri=os.getenv('ETH_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.BSC, uri=os.getenv('BSC_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.AVAX, uri=os.getenv('AVAX_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.ARB, uri=os.getenv('ARB_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.FTM, uri=os.getenv('FTM_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.MATIC, uri=os.getenv('MATIC_HTTP_PROVIDER', ''))
providerConfigurator.add_provider(chain=ChainName.OPT, uri=os.getenv('OPT_HTTP_PROVIDER', ''))
