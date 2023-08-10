from typing import Callable, List

from fastapi import FastAPI

from python.decorators.background.decorator import background
from python.w3api.router import W3APIRouter

from app.views.x45dDa9cb7c25131DF268515131f647d726f50608.view import router as x45dDa9cb7c25131DF268515131f647d726f50608
from app.views.x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640.view import router as x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640
from app.views.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.view import router as xC31E54c7a869B9FcBEcc14363CF510d1c41fa443


routers = list()
routers.append(x45dDa9cb7c25131DF268515131f647d726f50608)
routers.append(x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640)
routers.append(xC31E54c7a869B9FcBEcc14363CF510d1c41fa443)


app = FastAPI()


@background
def include(router: W3APIRouter) -> None: (app.include_router(router), router.broadcast())


@app.on_event('startup')
async def startup(routers: List[W3APIRouter] = routers) -> None: [include(router) for router in routers]


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
