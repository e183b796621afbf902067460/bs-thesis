from app.repositories.abstract import WSSProviderRepo
from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class EthereumWethUsdcWSSRepo(WSSProviderRepo):
    address, provider, is_reverse = '0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640', spawn_provider_resource().ethereum, True
