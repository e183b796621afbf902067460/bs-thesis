from abc import ABC, abstractmethod
from typing import Iterable, List
import datetime


class iService(ABC):

    @abstractmethod
    def pull(self, *args, **kwargs):
        raise NotImplemented


class WSSProviderService(iService):
    repo = None

    def __init__(self):
        self._repo = self.repo()

    def pull(self, blockchain: str, protocol: str, is_reverse: bool, *args, **kwargs) -> List[Iterable]:
        yield [
            (
                self._repo.address,
                str(datetime.datetime.fromtimestamp(int(self._repo.w3.eth.get_block(swap.blockNumber).timestamp))),
                self._repo.token0_symbol,
                self._repo.token1_symbol,
                swap.args.amount0 / 10 ** self._repo.token0_decimals if not is_reverse else swap.args.amount0 / 10 ** self._repo.token1_decimals if not is_reverse else swap.args.amount1 / 10 ** self._repo.token1_decimals if not is_reverse else swap.args.amount1 / 10 ** self._repo.token0_decimals,
                swap.args.amount1 / 10 ** self._repo.token1_decimals if not is_reverse else swap.args.amount1 / 10 ** self._repo.token0_decimals if not is_reverse else swap.args.amount0 / 10 ** self._repo.token0_decimals if not is_reverse else swap.args.amount0 / 10 ** self._repo.token1_decimals,
                swap.transactionHash.hex(),
                protocol,
                blockchain,
                swap.args.recipient
            ) for swap in self._repo.blocks.get_new_entries()
        ]
