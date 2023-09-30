from aiokafka import AIOKafkaProducer

from typing import Callable
import logging
import asyncio

from app.resources.fastkafka.resource import spawn_fastkafka_resource
from app.resources.kafka.resource import spawn_kafka_resource
from app.resources.env.resource import spawn_env_resource
from app.services.abstract import iService
from app.schemas.real_time_tx_processing.schemas import RealTimeTxProcessingBatch


logging.basicConfig(level=logging.INFO)
infinity = iter(int, 1)


fastkafka_app = spawn_fastkafka_resource()


async def to_clickhouse(producer: AIOKafkaProducer, events: RealTimeTxProcessingBatch) -> None:
    await asyncio.gather(*(producer.send(topic='real.time.tx.processing', value=dict(series)) for series in events.q_real_time_tx_processing_series)) if events.q_real_time_tx_processing_series else ...


async def broadcast(
        blockchain: str,
        service_spawn_class: iService,
        kafka_spawn_method: Callable = spawn_kafka_resource,
        env_spawn_method: Callable = spawn_env_resource
):

    service, kafka_producer, env = service_spawn_class(), kafka_spawn_method(), env_spawn_method()
    await kafka_producer.start()

    for _ in infinity:
        await asyncio.gather(*(to_clickhouse(producer=kafka_producer, events=RealTimeTxProcessingBatch.from_iterable(events)) for events in service.pull(blockchain=blockchain, protocol=env.protocol)))
