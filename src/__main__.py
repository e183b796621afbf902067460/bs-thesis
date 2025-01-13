import logging

from pandas import DataFrame
from torch.nn import MSELoss
from torch.optim import Adam
from talib._ta_lib import MA_Type

from src.adapters.repositories.ohlc import OHLCPandasRepository
from src.services.common.ohlc_base import OHLCPandasService
from src.services.rsi import RSIPandasService
from src.services.bb import BBANDSPandasService
from src.services.ema import EMAPandasService
from src.services.log import LogPandasService
from src.adapters.clients.agent import QOogwayTheGrandmasterAgent
from src.adapters.clients.environment import TradingEnvironment
from src.models.qnn import QNN

INFINITY = iter(int, 1)
BASE_COLUMNS: list[str] = [
    "date", "year", "month", "week", "day",
    "o", "h", "l", "c", "v",
    "EMA_210_c", "EMA_14_o", "EMA_7_o"
]


def _get_feature_columns(ohlc: DataFrame) -> list:
    columns: list = ohlc.columns.to_list()
    return [column for column in columns if column not in BASE_COLUMNS]


if __name__ == "__main__":
    # repositories
    ohlc_repository: OHLCPandasRepository = OHLCPandasRepository(
        path="/home/spuchin/GitHub/baccalaureate-diploma/src/SBER4H.csv"
    )

    # services
    ohlc_service: OHLCPandasService = OHLCPandasService(ohlc_repository=ohlc_repository)
    bbands_service: BBANDSPandasService = BBANDSPandasService()
    rsi_service: RSIPandasService = RSIPandasService()
    log_service: LogPandasService = LogPandasService()
    ema_service: EMAPandasService = EMAPandasService()

    # ohlcv
    ohlc: DataFrame = ohlc_service.get_ohlc()
    ohlc_daily: DataFrame = OHLCPandasService.resample(ohlc=ohlc, timeframe="1D")
    ohlc_weekly: DataFrame = OHLCPandasService.resample(ohlc=ohlc, timeframe="1W")

    # 4H
    ohlc = ema_service.get_ema(ohlc=ohlc, column="o", window=7, shift=0)
    ohlc = ema_service.get_ema(ohlc=ohlc, column="o", window=14, shift=0)
    ohlc = rsi_service.get_rsi(ohlc=ohlc, column="o", window=7, shift=0)
    ohlc = rsi_service.get_rsi(ohlc=ohlc, column="o", window=14, shift=0)

    ohlc = ema_service.get_ema(ohlc=ohlc, column="RSI_7_o", window=7, shift=0)
    ohlc = ema_service.get_ema(ohlc=ohlc, column="RSI_14_o", window=14, shift=0)
    ohlc = rsi_service.get_rsi(ohlc=ohlc, column="EMA_7_o", window=7, shift=0)
    ohlc = rsi_service.get_rsi(ohlc=ohlc, column="EMA_14_o", window=14, shift=0)

    # 1D
    ohlc_daily = ...  # TODO bbands on L if bullish trend else H 1D 7EMA 4STD

    # 1W
    ohlc_weekly = ema_service.get_ema(ohlc=ohlc_weekly, column="c", window=210, shift=1)

    # merge
    ohlc = ohlc_service.merge(
        left=ohlc,
        right=ohlc_weekly,
        on=["year", "month", "week"],
        drop_right=["o", "h", "l", "c", "v", "date", "day"]
    )

    ohlc = log_service.get_log(ohlc=ohlc, numerator="EMA_210_c", denominator="o", shift=0)
    ohlc = ohlc.dropna(subset=_get_feature_columns(ohlc=ohlc))

    # machine learning
    environment: TradingEnvironment = TradingEnvironment(
        ohlc=ohlc,
        feature_columns=_get_feature_columns(ohlc=ohlc),
        commission=.0001980,
        funding=.000114155
    )
    qnn: QNN = QNN(
        observation_space_dimension=environment.observation_space_dimension,
        action_space_dimension=environment.action_space_dimension
    )
    agent: QOogwayTheGrandmasterAgent = QOogwayTheGrandmasterAgent(
        alpha=.001,
        gamma=.99,
        epsilon=.99,
        qnn=qnn
    )
    optimization_algorithm: Adam = Adam(params=qnn.parameters(), lr=agent.learning_rate)
    loss_function: MSELoss = MSELoss()

    episodes: int = 16
    batch_size: int = 2

    for episode in range(episodes):
        state, reward, done, _, _ = environment.reset().as_observation()
        for _ in INFINITY:
            if done: break
            action = agent.act(observation=state)
            next_state, reward, done, _, _ = environment.step(action).as_observation()

            agent.memory.append((state, action, reward, next_state, done))
            if agent.memory_length >= batch_size:
                q, q_target = agent.learn(batch_size=batch_size)

                loss = loss_function(q, q_target)

                optimization_algorithm.zero_grad()
                loss.backward()
                optimization_algorithm.step()

            state = next_state

        logging.info(f"Episode: {episode + 1}, Total Reward: {environment.rewards:.2f}.")
