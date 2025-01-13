from typing import Any, Callable

from gymnasium import Env
from gymnasium.core import ActType
from gymnasium.spaces import Box, Discrete
from pandas import DataFrame
from numpy import inf, float32, array, zeros, log, log2

from src.schemas.position_type import PositionType
from src.schemas.action_space import LimitOrderActionSpace
from src.schemas.step_observation import StepObservation
from src.schemas.trade import Trade
from src.schemas.ohlc import OHLC
from src.schemas.indicators import Indicators


class TradingEnvironment(Env):

    def __init__(
        self,
        ohlc: DataFrame,
        feature_columns: list,
        commission: float,
        funding: float
    ) -> None:
        super(TradingEnvironment, self).__init__()

        self._ohlc: DataFrame = ohlc
        self._feature_columns: list = feature_columns
        self._commission: float = commission
        self._funding: float = funding
        self.reset()

        self._shape: int = len(self._feature_columns) + self._dynamic_features

        self.observation_space: Box = Box(low=-inf, high=inf, shape=(self._shape,), dtype=float32)
        self.action_space: Discrete = Discrete(n=LimitOrderActionSpace.n)

    @property
    def observation_space_dimension(self) -> int:
        return self.observation_space.shape[0]

    @property
    def action_space_dimension(self) -> int:
        return self.action_space.n

    @property
    def rewards(self) -> float:
        return self._total_rewards

    @property
    def _dataset_length(self) -> int:
        return len(self._ohlc) - 1

    @property
    def _dynamic_features(self) -> int:
        return len([self._cumulative_reward, self._position,])  # TODO self._time_in_trade

    @property
    def _environment_state(self) -> tuple:
        environment_state: array = tuple(self._ohlc[self._feature_columns].iloc[self._current_step].values)  # TODO add self._dynamic_features
        return environment_state

    @property
    def _true_price(self) -> float:
        weighted_price: float = .0
        weight: float = .0
        for price, size in self._dca:
            value: float = price * size

            weighted_price += price * value
            weight += value
        return weighted_price / weight

    def _on_long_reward(self, true_price: float, result_price: float) -> float:
        ratio: float = result_price / true_price
        reward: float = log(ratio) if ratio > 1 else log2(ratio)
        return reward - self._funding

    def _on_short_reward(self, true_price: float, result_price: float) -> float:
        ratio: float = 2 - (result_price / true_price)
        reward: float = log(ratio) if ratio > 1 else log2(ratio)
        return reward - self._funding

    def _adjust_reward_on_entry(
        self,
        ohlc: OHLC,
        ema: float,
        limit: float,
        size: int = 1,
        is_long: bool = True
    ) -> float:
        reward: float = .0
        on_reward_method: Callable = self._on_long_reward if is_long else self._on_short_reward

        position_type: str = PositionType.long_position if is_long else PositionType.short_position
        is_correct_limit: bool = limit > ema if is_long else limit < ema
        if ohlc.l <= limit <= ohlc.h and is_correct_limit:  # limit order
            self._position = position_type
            self._dca.append((limit, size))
            reward = on_reward_method(true_price=self._true_price, result_price=ohlc.c) - self._commission

        is_entry_success: bool = self._position == position_type
        is_stop_loss_after_entry: bool = ema >= ohlc.l if is_long else ema <= ohlc.h
        if is_entry_success and is_stop_loss_after_entry:  # stop-loss
            reward = on_reward_method(true_price=self._true_price, result_price=ema) - self._commission - self._commission
            self._position = PositionType.neutral_position
            self._dca = list()
        return reward

    def _adjust_reward_on_dca(
        self,
        ohlc: OHLC,
        ema: float,
        limit: float,
        size: int = 1,
        is_long: bool = True
    ) -> float:
        reward: float = .0
        on_reward_method: Callable = self._on_long_reward if is_long else self._on_short_reward

        is_correct_limit: bool = limit > ema if is_long else limit < ema
        if ohlc.l <= limit <= ohlc.h and is_correct_limit:  # limit order
            self._dca.append((limit, size))
            reward = on_reward_method(true_price=self._true_price, result_price=ohlc.c) - self._commission

        is_stop_loss: bool = ema >= ohlc.l if is_long else ema <= ohlc.h
        if is_stop_loss:  # stop-loss
            reward = on_reward_method(
                true_price=self._true_price,
                result_price=ema
            ) - self._commission - self._commission if reward else on_reward_method(
                true_price=self._true_price,
                result_price=ema
            ) - self._commission
            self._position = PositionType.neutral_position
            self._dca = list()
        return reward

    def _adjust_reward_on_exit(
        self,
        ohlc: OHLC,
        ema: float,
        limit: float,
        is_long: bool = True
    ) -> float:
        reward: float = .0
        on_reward_method: Callable = self._on_long_reward if is_long else self._on_short_reward

        is_stop_loss: bool = ema >= ohlc.l if is_long else ema <= ohlc.h
        is_correct_limit: bool = limit > ema if is_long else limit < ema
        if is_stop_loss:  # stop-loss
            reward = on_reward_method(true_price=self._true_price, result_price=ema) - self._commission
            self._position = PositionType.neutral_position

        elif ohlc.l <= limit <= ohlc.h and is_correct_limit:  # limit order
            reward = on_reward_method(true_price=self._true_price, result_price=limit) - self._commission
            self._position = PositionType.neutral_position
        return reward

    def reset(
        self,
        *,
        seed: int | None = None,
        options: dict[str, Any] | None = None,
    ) -> StepObservation:
        super().reset(seed=seed, options=options)
        self._position: str = PositionType.neutral_position
        self._dca: list = list()
        self._trades: list[Trade] = list()  # TODO

        self._current_step: int = 0
        self._highest_in_the_room: float = ...  # TODO penalize if the price goes downward from the highest price
        self._time_in_trade: float = ...  # TODO divide reward on `time_in_trade` to penalize long trades
        self._cumulative_reward: float = .0
        self._total_rewards: float = .0

        return StepObservation(
            array(self._environment_state, dtype=float32),
            self._total_rewards,
            False,
            False,
            dict()
        )

    def step(self, action: ActType) -> StepObservation:
        reward: float = .0
        if self._current_step >= self._dataset_length:
            return StepObservation(
                zeros(self._shape, dtype=float32),
                reward,
                True,
                False,
                dict()
            )

        ohlc: OHLC = OHLC(self._current_step, self._ohlc)
        indicators: Indicators = Indicators(self._current_step, self._ohlc)

        if action == LimitOrderActionSpace.buy_limit:
            limit: float = indicators.get_lower_bbands(stddev=1)
            if self._position == PositionType.neutral_position:
                reward += self._adjust_reward_on_entry(ohlc=ohlc, ema=indicators.ema, limit=limit)
                self._cumulative_reward += reward if self._position == PositionType.long_position else .0
            elif self._position == PositionType.long_position:
                reward += self._adjust_reward_on_dca(ohlc=ohlc, ema=indicators.ema, limit=limit)
                self._cumulative_reward += reward if self._position == PositionType.long_position else .0
                if self._position == PositionType.neutral_position:
                    reward = abs(self._cumulative_reward) * -1
            elif self._position == PositionType.short_position:
                reward += self._adjust_reward_on_exit(ohlc=ohlc, ema=indicators.ema, limit=limit)
                if reward < 0:
                    reward = abs(self._cumulative_reward) * -1
                self._dca = list() if reward else self._dca

        if action == LimitOrderActionSpace.sell_limit:
            limit: float = indicators.get_upper_bbands(stddev=1)
            if self._position == PositionType.neutral_position:
                reward += self._adjust_reward_on_entry(ohlc=ohlc, ema=indicators.ema, limit=limit, is_long=False)
                self._cumulative_reward += reward if self._position == PositionType.short_position else .0
            elif self._position == PositionType.short_position:
                reward += self._adjust_reward_on_dca(ohlc=ohlc, ema=indicators.ema, limit=limit, is_long=False)
                self._cumulative_reward += reward if self._position == PositionType.short_position else .0
                if self._position == PositionType.neutral_position:
                    reward = abs(self._cumulative_reward) * -1
            elif self._position == PositionType.long_position:
                reward += self._adjust_reward_on_exit(ohlc=ohlc, ema=indicators.ema, limit=limit, is_long=False)
                if reward < 0:
                    reward = abs(self._cumulative_reward) * -1
                self._dca = list() if reward else self._dca

        if action == LimitOrderActionSpace.hold:
            if self._position == PositionType.neutral_position:
                ...
            elif self._position == PositionType.long_position:
                is_stop_loss: bool = indicators.ema >= ohlc.l
                reward += self._on_long_reward(
                    true_price=self._true_price,
                    result_price=indicators.ema
                ) - self._commission if is_stop_loss else self._on_long_reward(
                    true_price=self._true_price,
                    result_price=ohlc.c
                )
                if is_stop_loss:
                    reward = abs(self._cumulative_reward) * -1
                    self._position = PositionType.neutral_position
                    self._dca = list()
                self._cumulative_reward += reward if self._position == PositionType.long_position else .0
            elif self._position == PositionType.short_position:
                is_stop_loss: bool = indicators.ema <= ohlc.h
                reward += self._on_short_reward(
                    true_price=self._true_price,
                    result_price=indicators.ema
                ) - self._commission if is_stop_loss else self._on_short_reward(
                    true_price=self._true_price,
                    result_price=ohlc.c
                )
                if is_stop_loss:
                    reward = abs(self._cumulative_reward) * -1
                    self._position = PositionType.neutral_position
                    self._dca = list()
                self._cumulative_reward += reward if self._position == PositionType.short_position else .0

        self._current_step += 1
        self._total_rewards += reward

        return StepObservation(
            array(self._environment_state, dtype=float32),
            reward,
            False,
            False,
            dict()
        )
