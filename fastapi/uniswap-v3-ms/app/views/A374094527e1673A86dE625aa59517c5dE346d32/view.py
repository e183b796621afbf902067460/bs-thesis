from fastapi import APIRouter

from web3.types import ChecksumAddress
from web3 import Web3
from web3.middleware import geth_poa_middleware

from app.services.handler.service import spawn_handler_resource
from app.resources.kafka.resource import spawn_kafka_resource


router = APIRouter()


address = ChecksumAddress('0xA374094527e1673A86dE625aa59517c5dE346d32')


@router.on_event(event_type='startup')
async def broadcast():
    service, kafka = spawn_handler_resource(address=address), spawn_kafka_resource()

    w3 = Web3(service.node)
    w3.middleware_onion.inject(
        geth_poa_middleware,
        layer=0
    )

    producer = kafka.producer
    for event in service.pull(w3=w3, is_reverse=False):
        producer.send(topic='bs.thesis', value=event)
