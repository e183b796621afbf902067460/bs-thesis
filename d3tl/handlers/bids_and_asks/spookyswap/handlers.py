from d3f1nance.spookyswap.SpookySwapV2Pair import SpookySwapV2PairContract
from d3tl.handlers.bids_and_asks.uniswap.handlers import UniSwapV2BidsAndAsksHandler


class SpookySwapBidsAndAsksHandler(SpookySwapV2PairContract, UniSwapV2BidsAndAsksHandler):
    _FEE = 0.002

