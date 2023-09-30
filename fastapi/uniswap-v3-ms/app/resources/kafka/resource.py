from json import dumps

from aiokafka import AIOKafkaProducer

from app.resources.env.resource import spawn_env_resource, EnvResource
from python.decorators.by_default.decorator import by_default


class KafkaResource(object):

    def __init__(self, env: EnvResource) -> None:
        self._env = env

    def producer(self) -> AIOKafkaProducer:
        return AIOKafkaProducer(
            bootstrap_servers=self._env.bootstrap_servers,
            value_serializer=lambda x: dumps(x).encode('utf-8')
        )


@by_default(env=spawn_env_resource)
def spawn_kafka_resource(env: EnvResource) -> AIOKafkaProducer:
    return KafkaResource(env=env).producer()
