from pydantic import BaseSettings
from decouple import config


class EnvResource(BaseSettings):

    @property
    def api_v1(self) -> str:
        return config('API_V1', cast=str, default='/api/v1')

    @property
    def root(self) -> str:
        return config('ROOT', cast=str, default='/uniswap-v3')

    @property
    def bootstrap_servers(self) -> list:
        return [config('BOOTSTRAP_SERVERS', cast=str)]

    @property
    def ethereum_wss_provider(self) -> str:
        return config('ETHEREUM_WSS_PROVIDER', cast=str)

    @property
    def polygon_wss_provider(self) -> str:
        return config('POLYGON_WSS_PROVIDER', cast=str)

    class Config:
        case_sensitive = True


def spawn_env_resource() -> EnvResource:
    return EnvResource()
