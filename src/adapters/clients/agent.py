from collections import deque
from random import uniform, choice, sample

from attr import attrs, ib
from torch import FloatTensor, LongTensor, argmax, Tensor

from src.models.qnn import QNN
from src.schemas.step_observation import StepObservation


@attrs(slots=True, auto_attribs=True, kw_only=True)
class QOogwayTheGrandmasterAgent:

    _alpha: float  # learning rate, the higher the faster is learning
    _gamma: float
    _epsilon: float

    _qnn: QNN

    _memory: deque = ib(init=False, default=deque(maxlen=10_000))

    @property
    def learning_rate(self) -> float:
        return self._alpha

    @property
    def memory(self) -> deque:
        return self._memory

    @property
    def memory_length(self) -> int:
        return len(self._memory)

    @staticmethod
    def _get_observations(batch: list) -> tuple:
        states, actions, rewards, states_lead, dones = zip(*batch)
        return (
            FloatTensor(states),
            LongTensor(actions),
            FloatTensor(rewards),
            FloatTensor(states_lead),
            FloatTensor(dones)
        )

    def act(self, observation: StepObservation | tuple) -> int:
        if uniform(0, 1) < self._epsilon:
            return choice(range(self._qnn.action_space_dimension))  # exploration phase
        state: Tensor = FloatTensor(observation).unsqueeze(0)
        return argmax(self._qnn(state)).item()  # exploitation phase

    def learn(self, batch_size: int) -> tuple[float, float]:
        batch: list = sample(self._memory, batch_size)
        states, actions, rewards, states_lead, dones = QOogwayTheGrandmasterAgent._get_observations(batch=batch)

        q_lead = self._qnn(x=states_lead).max(1)[0]
        q_target = rewards + (self._gamma * q_lead * (1 - dones))

        q = self._qnn(x=states).gather(1, actions.unsqueeze(1)).squeeze(1)

        self._epsilon *= self._gamma

        return q, q_target




