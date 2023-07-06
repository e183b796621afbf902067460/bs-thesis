from json import dumps

from kafka import KafkaProducer

from app.resources.env.resource import spawn_env_resource, EnvResource
from bs_infrastructure.decorators.by_default.decorator import by_default


class KafkaResource(object):

    def __init__(self, env: EnvResource) -> None:
        self._env = env

    @property
    def producer(self) -> KafkaProducer:
        return KafkaProducer(
            bootstrap_servers=self._env.bootstrap_servers,
            value_serializer=lambda x: dumps(x).encode('utf-8'),
            retries=5,
            retry_backoff_ms=3000
        )

    class Config:
        case_sensitive = True


@by_default(env=spawn_env_resource)
def spawn_kafka_resource(env: EnvResource) -> KafkaResource:
    return KafkaResource(env=env)
