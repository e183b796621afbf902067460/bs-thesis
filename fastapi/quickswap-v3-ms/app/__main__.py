from typing import Callable, List

from fastapi import FastAPI

from python.decorators.background.decorator import background

from app.views.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.view import broadcast as x55CAaBB0d2b704FD0eF8192A7E35D8837e678207


pools = list()
pools.append(x55CAaBB0d2b704FD0eF8192A7E35D8837e678207)


@background
def include(pool: Callable) -> None: pool()


app = FastAPI()


@app.on_event('startup')
async def startup(pools: List[Callable] = pools) -> None: [include(pool) for pool in pools]


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
