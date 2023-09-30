import logging

from app.views.abstract import broadcast, fastkafka_app
from app.services.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.service import ArbitrumWethUsdcWSSService


logging.basicConfig(level=logging.INFO)


@fastkafka_app.run_in_background()
async def arbitrum_weth_usdc_wss_broadcast():
    try:
        await broadcast(blockchain='arbiscan.io', is_reverse=False, service_spawn_class=ArbitrumWethUsdcWSSService)
    except Exception as exc:
        logging.error(exc)
