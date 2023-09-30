import logging

from app.views.abstract import broadcast, fastkafka_app
from app.services.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.service import PolygonWethUsdcWSSService


logging.basicConfig(level=logging.INFO)


@fastkafka_app.run_in_background()
async def polygon_weth_usdc_wss_broadcast():
    try:
        await broadcast(blockchain='polygonscan.com', service_spawn_class=PolygonWethUsdcWSSService)
    except Exception as exc:
        logging.error(exc)
