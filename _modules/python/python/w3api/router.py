from abc import abstractmethod

from fastapi import APIRouter


class W3APIRouter(APIRouter):

    @abstractmethod
    def broadcast(self, address: str) -> None:
        raise NotImplementedError
