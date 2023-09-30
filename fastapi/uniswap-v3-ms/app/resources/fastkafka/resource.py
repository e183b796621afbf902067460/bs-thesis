from fastkafka import FastKafka

from app.resources.env.resource import spawn_env_resource, EnvResource
from python.decorators.by_default.decorator import by_default


class FastKafkaResource(object):

    def __init__(self, env: EnvResource) -> None:
        self._env = env

    def fastkafka(self) -> FastKafka:

        return FastKafka(
            kafka_brokers=self._env.kafka_brokers,
            bootstrap_servers_id=self._env.bootstrap_servers
        )


@by_default(env=spawn_env_resource)
def spawn_fastkafka_resource(env: EnvResource) -> FastKafka:
    return FastKafkaResource(env=env).fastkafka()
