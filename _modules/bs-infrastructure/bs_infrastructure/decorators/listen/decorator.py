from functools import wraps
from typing import Callable, Iterable


def listen(func: Callable):

    def parse(event: list):
        return {
            'dt': event[0],
            'price': event[1],
            'side': event[2],
            't0_symbol': event[3],
            't1_symbol': event[4],
            't0_amount': event[5],
            't1_amount': event[6],
            'tx_hash': event[7]
        }

    @wraps(func)
    def wrapper(*args, **kwargs) -> Iterable:
        while True:
            for event in func(*args, **kwargs):
                yield parse(event=event)
    return wrapper
