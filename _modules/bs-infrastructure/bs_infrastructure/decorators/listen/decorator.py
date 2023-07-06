from functools import wraps
from typing import Callable, Iterable


def listen(func: Callable):

    def parse(event: list):
        return {
            'address': event[0],
            'dt': event[1],
            'price': event[2],
            'side': event[3],
            't0_symbol': event[4],
            't1_symbol': event[5],
            't0_amount': event[6],
            't1_amount': event[7],
            'tx_hash': event[8]
        }

    @wraps(func)
    def wrapper(*args, **kwargs) -> Iterable:
        while True:
            for event in func(*args, **kwargs):
                yield parse(event=event)
    return wrapper
