from typing import Callable, List

from fastapi import FastAPI

from python.decorators.background.decorator import background

from app.views.x45dDa9cb7c25131DF268515131f647d726f50608.view import broadcast as x45dDa9cb7c25131DF268515131f647d726f50608
from app.views.x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640.view import broadcast as x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640
from app.views.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.view import broadcast as xC31E54c7a869B9FcBEcc14363CF510d1c41fa443


pools = list()
pools.append(x45dDa9cb7c25131DF268515131f647d726f50608)
pools.append(x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640)
pools.append(xC31E54c7a869B9FcBEcc14363CF510d1c41fa443)


@background
def include(pool: Callable) -> None: pool()


app = FastAPI()


@app.on_event('startup')
async def startup(pools: List[Callable] = pools) -> None: [include(pool) for pool in pools]


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
