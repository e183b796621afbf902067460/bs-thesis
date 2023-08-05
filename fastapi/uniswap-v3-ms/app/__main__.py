from fastapi import FastAPI

from app.views.x45dDa9cb7c25131DF268515131f647d726f50608.view import router as x45dDa9cb7c25131DF268515131f647d726f50608
from app.views.x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640.view import router as x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640
from app.views.xC31E54c7a869B9FcBEcc14363CF510d1c41fa443.view import router as xC31E54c7a869B9FcBEcc14363CF510d1c41fa443


app = FastAPI()


app.include_router(router=x45dDa9cb7c25131DF268515131f647d726f50608)
app.include_router(router=x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640)
app.include_router(router=xC31E54c7a869B9FcBEcc14363CF510d1c41fa443)


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
