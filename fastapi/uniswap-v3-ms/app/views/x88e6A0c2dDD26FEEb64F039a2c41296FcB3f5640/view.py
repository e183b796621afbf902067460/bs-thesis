import logging

from app.views.abstract import broadcast, fastkafka_app
from app.services.x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640.service import EthereumWethUsdcWSSService


logging.basicConfig(level=logging.INFO)


@fastkafka_app.run_in_background()
async def ethereum_weth_usdc_wss_broadcast():
    try:
        await broadcast(blockchain='etherscan.io', service_spawn_class=EthereumWethUsdcWSSService)
    except Exception as exc:
        logging.error(exc)
