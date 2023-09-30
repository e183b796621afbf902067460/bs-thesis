from app.services.abstract import WSSProviderService
from app.repositories.x45dDa9cb7c25131DF268515131f647d726f50608.repo import PolygonWethUsdcWSSRepo


class PolygonWethUsdcWSSService(WSSProviderService):
    repo = PolygonWethUsdcWSSRepo
