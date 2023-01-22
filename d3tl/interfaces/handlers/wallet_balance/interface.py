from abc import abstractmethod, ABC


class iWalletBalanceHandler(ABC):

    @abstractmethod
    def get_overview(self, *args, **kwargs):
        raise NotImplementedError(f"{self.__class__.__name__} doesn't have an {self.get_overview.__name__}() implementation")
