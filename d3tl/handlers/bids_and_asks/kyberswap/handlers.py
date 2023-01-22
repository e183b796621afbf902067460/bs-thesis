from d3f1nance.kyberswap.Pool import KyberSwapPoolContract
from d3tl.handlers.bids_and_asks.uniswap.handlers import UniSwapV3BidsAndAsksHandler


class KyberSwapV2BidsAndAsksHandler(UniSwapV3BidsAndAsksHandler, KyberSwapPoolContract):
    _FEE = 0.01
