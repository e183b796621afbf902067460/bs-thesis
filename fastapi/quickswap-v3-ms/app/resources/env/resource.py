from pydantic_settings import BaseSettings
from decouple import config


class EnvResource(BaseSettings):

    @property
    def protocol(self) -> str:
        return config("PROTOCOL", cast=str, default='quickswap-v3')

    @property
    def bootstrap_servers(self) -> list:
        return [config('BOOTSTRAP_SERVERS', cast=str)]

    @property
    def kafka_brokers(self) -> dict:
        return {
            config('KAFKA_BROKER_URL', cast=str): {
                "url": config('KAFKA_BROKER_URL', cast=str),
                "port": config('KAFKA_BROKER_PORT', cast=int)
            }
        }

    @property
    def ethereum_wss_provider(self) -> str:
        return config('ETHEREUM_WSS_PROVIDER', cast=str)

    @property
    def polygon_wss_provider(self) -> str:
        return config('POLYGON_WSS_PROVIDER', cast=str)

    @property
    def arbitrum_wss_provider(self) -> str:
        return config('ARBITRUM_WSS_PROVIDER', cast=str)

    class Config:
        case_sensitive = True


def spawn_env_resource() -> EnvResource:
    return EnvResource()
