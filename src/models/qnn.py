from torch.nn import Module, Linear, LeakyReLU
from torch import relu, sigmoid


class QNN(Module):

    def __init__(self, observation_space_dimension: int, action_space_dimension: int) -> None:
        super(QNN, self).__init__()

        self._observation_space_dimension: int = observation_space_dimension
        self._action_space_dimension: int = action_space_dimension

        self._input_layer: Linear = Linear(in_features=observation_space_dimension, out_features=1024)
        self._hidden_layer: Linear = Linear(in_features=1024, out_features=1024)
        self._output_layer: Linear = Linear(in_features=1024, out_features=action_space_dimension)

        self._activation_function: LeakyReLU = LeakyReLU()

    def forward(self, x):
        x = sigmoid(input=self._input_layer(x))
        x = sigmoid(input=self._hidden_layer(x))
        return self._activation_function(self._output_layer(x))

    @property
    def observation_space_dimension(self) -> int:
        return self._observation_space_dimension

    @property
    def action_space_dimension(self) -> int:
        return self._action_space_dimension
