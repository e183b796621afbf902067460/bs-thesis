from app.repositories.abstract import WSSProviderRepo
from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class PolygonWethUsdcWSSRepo(WSSProviderRepo):
    address, provider, is_reverse = '0x55CAaBB0d2b704FD0eF8192A7E35D8837e678207', spawn_provider_resource().polygon, True
