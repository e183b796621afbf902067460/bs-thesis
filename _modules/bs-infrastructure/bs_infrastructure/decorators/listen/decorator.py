from functools import wraps
from typing import Callable, Iterable


def listen(func: Callable):

    def parse(event: list):
        return {
            'address': event[0],
            'dt': event[1],
            't0_symbol': event[2],
            't1_symbol': event[3],
            't0_amount': event[4],
            't1_amount': event[5],
            'tx_hash': event[6],
            'protocol': event[7],
            'blockchain': event[8]
        }

    @wraps(func)
    def wrapper(*args, **kwargs) -> Iterable:
        while True:
            for event in func(*args, **kwargs):
                yield parse(event=event)
    return wrapper
