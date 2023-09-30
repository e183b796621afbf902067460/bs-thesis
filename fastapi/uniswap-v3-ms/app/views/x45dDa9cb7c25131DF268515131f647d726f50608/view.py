import logging

from app.views.abstract import broadcast, fastkafka_app
from app.services.x45dDa9cb7c25131DF268515131f647d726f50608.service import PolygonWethUsdcWSSService


logging.basicConfig(level=logging.INFO)


@fastkafka_app.run_in_background()
async def polygon_weth_usdc_wss_broadcast():
    try:
        await broadcast(blockchain='polygonscan.com', service_spawn_class=PolygonWethUsdcWSSService)
    except Exception as exc:
        logging.error(exc)
