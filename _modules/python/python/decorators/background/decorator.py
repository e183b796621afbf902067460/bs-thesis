from functools import wraps
import asyncio


def background(f):

    @wraps(f)
    def wrapper(*args, **kwargs):
        return asyncio.get_event_loop().run_in_executor(None, f, *args, **kwargs)

    return wrapper
