from app.repositories.abstract import WSSProviderRepo
from app.resources.provider.resource import spawn_provider_resource, ProviderResource


class PolygonWethUsdcWSSRepo(WSSProviderRepo):
    address, provider, is_reverse = '0x45dDa9cb7c25131DF268515131f647d726f50608', spawn_provider_resource().polygon, True
