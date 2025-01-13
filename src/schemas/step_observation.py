from dataclasses import dataclass

from numpy import array


@dataclass
class StepObservation:

    _observation: array
    _reward: float
    _is_terminated: bool
    _is_truncated: bool
    _info: dict

    def as_observation(self) -> tuple:
        return self._observation, self._reward, self._is_terminated, self._is_truncated, self._info
