# D3tl

Depends on: [raffaelo](https://github.com/e183b796621afbf902067460/raffaelo), [d3f1nance](https://github.com/e183b796621afbf902067460/d3f1nance) and [trad3r](https://github.com/e183b796621afbf902067460/trad3r).

---
D3tl is an ETL-framework that helps to get the needed blockchain data from smart-contracts. The scalability of the framework is based on it's architecture that provides a simple way to scale up amount of a new handlers and add it to right factories. Each factory is an independent analytical unit and must located at abstract factory. Bridge helps to orchestrate of whole amount of factories and handlers.

# Installation
```
pip install git+https://github.com/e183b796621afbf902067460/d3tl.git#egg=d3tl
```

# Usage
For example, to get [`ERC20WalletBalancesHandler`](https://github.com/e183b796621afbf902067460/d3tl/blob/master/d3tl/handlers/wallet_balances/erc20/handlers.py#L8) need to call [`D3BridgeConfigurator`](https://github.com/e183b796621afbf902067460/d3tl/blob/master/d3tl/bridge/configurator.py#L5) and pass to it constructor next arguments and then call `produce_handler()` method:

```python
from d3tl.abstract.fabric import d3Abstract
from d3tl.bridge.configurator import D3BridgeConfigurator
from trad3r.root.composite.trader import rootTrad3r


address = '0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270'
provider = HTTPProvider(uri='https://rpc.ankr.com/polygon')

class_ = D3BridgeConfigurator(
    abstract=d3Abstract,
    fabric_name='wallet_balances',
    handler_name='erc20'
).produce_handler()

handler = class_(
    address=address,
    provider=provider,
    trader=rootTrad3r
)
```

Current handler is `ERC20WalletBalancesHandler`. After this we can call `get_overview()` method and pass our wallet address in arguments to get the amount of wMATIC ERC20-token balance.
