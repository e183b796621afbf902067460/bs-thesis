from fastapi import FastAPI

from app.views.xA374094527e1673A86dE625aa59517c5dE346d32.view import router as xA374094527e1673A86dE625aa59517c5dE346d32
from app.views.x88f3C15523544835fF6c738DDb30995339AD57d6.view import router as x88f3C15523544835fF6c738DDb30995339AD57d6
from app.views.x0a6c4588b7D8Bd22cF120283B1FFf953420c45F3.view import router as x0a6c4588b7D8Bd22cF120283B1FFf953420c45F3


app = FastAPI()


app.include_router(router=xA374094527e1673A86dE625aa59517c5dE346d32)
app.include_router(router=x88f3C15523544835fF6c738DDb30995339AD57d6)
app.include_router(router=x0a6c4588b7D8Bd22cF120283B1FFf953420c45F3)


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
