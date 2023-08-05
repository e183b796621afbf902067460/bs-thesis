from fastapi import FastAPI

from app.views.xAE81FAc689A1b4b1e06e7ef4a2ab4CD8aC0A087D.view import router as xAE81FAc689A1b4b1e06e7ef4a2ab4CD8aC0A087D


app = FastAPI()


app.include_router(router=xAE81FAc689A1b4b1e06e7ef4a2ab4CD8aC0A087D)


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
