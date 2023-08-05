from json import dumps

from kafka import KafkaProducer

from app.resources.env.resource import spawn_env_resource, EnvResource
from python.decorators.by_default.decorator import by_default


class KafkaResource(object):

    def __init__(self, env: EnvResource) -> None:
        self._env = env

    def producer(self) -> KafkaProducer:
        return KafkaProducer(
            bootstrap_servers=self._env.bootstrap_servers,
            value_serializer=lambda x: dumps(x).encode('utf-8'),
            max_in_flight_requests_per_connection=5 * 3,
            retries=3 * 3,
            retry_backoff_ms=5000
        )


@by_default(env=spawn_env_resource)
def spawn_kafka_resource(env: EnvResource) -> KafkaProducer:
    return KafkaResource(env=env).producer()
