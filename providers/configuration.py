from web3.providers.rpc import HTTPProvider


class ProviderConfigurator(object):

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


providerConfigurator = ProviderConfigurator()

providerConfigurator.add_provider(chain='ETH', uri='https://mainnet.infura.io/v3/3c9943304cf64593a4013a87cc5fd3f5')
