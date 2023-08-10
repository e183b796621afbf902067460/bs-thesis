from typing import Callable, List

from fastapi import FastAPI

from python.decorators.background.decorator import background
from python.w3api.router import W3APIRouter

from app.views.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.view import router as x55CAaBB0d2b704FD0eF8192A7E35D8837e678207


routers = list()
routers.append(x55CAaBB0d2b704FD0eF8192A7E35D8837e678207)


app = FastAPI()


@background
def include(router: W3APIRouter) -> None: (app.include_router(router), router.broadcast())


@app.on_event('startup')
async def startup(routers: List[W3APIRouter] = routers) -> None: [include(router) for router in routers]


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
