from fastapi import FastAPI

import logging
from decouple import config

from app.views.abstract import fastkafka_app

from app.views.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.view import polygon_weth_usdc_wss_broadcast


logging.basicConfig(level=logging.INFO)


fastapi_app = FastAPI(lifespan=fastkafka_app.fastapi_lifespan(kafka_broker_name=config('KAFKA_BROKER_URL', cast=str)))


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:fastapi_app', host='0.0.0.0')
