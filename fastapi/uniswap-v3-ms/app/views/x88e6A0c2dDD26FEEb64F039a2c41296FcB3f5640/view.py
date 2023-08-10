from fastapi import APIRouter
from kafka.errors import NoBrokersAvailable

from web3 import Web3
from web3.middleware import geth_poa_middleware

from app.services.handler.service import spawn_ethereum_handler
from app.resources.kafka.resource import spawn_kafka_resource
from app.resources.env.resource import spawn_env_resource

from time import sleep

from python.w3api.router import W3APIRouter


class W3API(W3APIRouter):

    @staticmethod
    def broadcast(address: str = Web3.to_checksum_address('0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640')):
        infinity = iter(int, 1)
        for _ in infinity:
            try:
                service, kafka, env = spawn_ethereum_handler(address=address), spawn_kafka_resource(), spawn_env_resource()
            except NoBrokersAvailable:
                sleep(5)
                continue
            else:
                break

        w3 = Web3(service.node)
        w3.middleware_onion.inject(
            geth_poa_middleware,
            layer=0
        )

        for event in service.pull(w3=w3, protocol=env.protocol, blockchain='etherscan.io', is_reverse=True):
            kafka.send(topic='real.time.tx.processing', value=event)


router = W3API()
