from app.services.abstract import WSSProviderService
from app.repositories.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.repo import ArbitrumWethUsdcWSSRepo


class ArbitrumWethUsdcWSSService(WSSProviderService):
    repo = ArbitrumWethUsdcWSSRepo
