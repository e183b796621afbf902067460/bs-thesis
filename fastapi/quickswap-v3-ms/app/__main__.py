from fastapi import FastAPI

from app.views.x55CAaBB0d2b704FD0eF8192A7E35D8837e678207.view import router as x55CAaBB0d2b704FD0eF8192A7E35D8837e678207


app = FastAPI()


app.include_router(router=x55CAaBB0d2b704FD0eF8192A7E35D8837e678207)


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
