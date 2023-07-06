from raffaelo.providers.wss.provider import WSSProvider

from app.resources.env.resource import spawn_env_resource, EnvResource
from bs_infrastructure.decorators.by_default.decorator import by_default


class ProviderResource(object):

    def __init__(self, env: EnvResource) -> None:
        self._env = env

    @property
    def ethereum(self) -> WSSProvider:
        return WSSProvider(uri=self._env.ethereum_wss_provider)

    @property
    def polygon(self) -> WSSProvider:
        return WSSProvider(uri=self._env.polygon_wss_provider)

    class Config:
        case_sensitive = True


@by_default(env=spawn_env_resource)
def spawn_provider_resource(env: EnvResource) -> ProviderResource:
    return ProviderResource(env=env)
