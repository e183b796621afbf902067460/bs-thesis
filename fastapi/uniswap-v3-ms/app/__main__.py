from fastapi import FastAPI

from app.resources.env.resource import spawn_env_resource
from app.views.A374094527e1673A86dE625aa59517c5dE346d32.view import router as A374094527e1673A86dE625aa59517c5dE346d32


app, env = FastAPI(), spawn_env_resource()


app.include_router(router=A374094527e1673A86dE625aa59517c5dE346d32, prefix=f'{env.api_v1}' + f'{env.root}')


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app='__main__:app', host='0.0.0.0')
