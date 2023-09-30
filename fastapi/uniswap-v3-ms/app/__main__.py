from fastapi import FastAPI

import logging
from decouple import config

from app.views.abstract import fastkafka_app

from app.views.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.view import arbitrum_weth_usdc_wss_broadcast
from app.views.x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640.view import ethereum_weth_usdc_wss_broadcast


logging.basicConfig(level=logging.INFO)


fastapi_app = FastAPI(lifespan=fastkafka_app.fastapi_lifespan(kafka_broker_name=config('KAFKA_BROKER_URL', cast=str)))


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:fastapi_app', host='0.0.0.0')
