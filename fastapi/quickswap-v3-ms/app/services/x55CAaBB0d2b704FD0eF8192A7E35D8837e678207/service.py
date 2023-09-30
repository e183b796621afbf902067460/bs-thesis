from app.services.abstract import WSSProviderService
from app.repositories.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.repo import PolygonWethUsdcWSSRepo


class PolygonWethUsdcWSSService(WSSProviderService):
    repo = PolygonWethUsdcWSSRepo
