from typing import Callable, Any, Optional
from functools import wraps


def by_default(*args, **kwargs):
    """
    A decorator that allows default arguments to be specified for a function.

    :parameter: func (Callable) — The function to decorate.

    :return: Optional[Any] — The result of decorated function.
    """

    def wrapper(func: Callable) -> Optional[Any]:
        @wraps(func)
        def call(default_args=args, default_kwargs=kwargs, *args, **kwargs) -> Optional[Any]:
            """
            Calls the decorated function with the specified default arguments.

            :parameter: default_args (tuple) — A tuple containing the default positional arguments.
            :parameter: default_kwargs (dict) — A dictionary containing the default keyword arguments.
            :parameter: args (tuple) — The positional arguments to pass to the function.
            :parameter: kwargs (dict) — The keyword arguments to pass to the function.

            :return: Optional[Any] — The result of calling the decorated function.

            :raise: TypeError — If the decorated function has any required arguments that are not
                specified by either the default arguments or the arguments passed to the
                call.
            """
            for k, v in default_kwargs.items():
                if isinstance(v, Callable):
                    default_kwargs[k] = v()
            for k, v in kwargs.items():
                if isinstance(v, Callable):
                    kwargs[k] = v()
            return func(*default_args, *args, **default_kwargs, **kwargs)

        return call

    return wrapper
