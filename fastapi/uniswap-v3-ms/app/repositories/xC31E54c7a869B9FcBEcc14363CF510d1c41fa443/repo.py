from app.repositories.abstract import WSSProviderRepo
from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class ArbitrumWethUsdcWSSRepo(WSSProviderRepo):
    address, provider = '0xC31E54c7a869B9FcBEcc14363CF510d1c41fa443', spawn_provider_resource().arbitrum
