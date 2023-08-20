# Baccalaureate Diploma
Depends on: [raffaelo](https://github.com/e183b796621afbf902067460/raffaelo).

---

The Art of Decision-Making: Building Real-Time Data Processing Pipeline With Kafka, ClickHouse and Apache Superset. 

Based on public blockchain-transactions data from liquidity pools we will build a real-time analytical dashboard using Apache Kafka, ClickHouse and Apache Superset to get know the best price of Ethereum and deploy it with Docker.

[![asciicast](https://camo.githubusercontent.com/09c47a17f473254ee9b27f2b8c5640c73f1a2a08f2a7e83618cb0ceabfef9958/68747470733a2f2f61736369696e656d612e6f72672f612f3333353438302e737667)](https://raw.githubusercontent.com/e183b796621afbf902067460/baccalaureate-diploma/master/_modules/gif/1692557219498273.gif)

# Configuration

- Clone current repository:

```bash
git clone https://github.com/e183b796621afbf902067460/baccalaureate-diploma.git
```

- Get into the project folder:

```bash
cd baccalaureate-diploma/
```

- Set environment variables in [docker-compose.yaml](https://github.com/e183b796621afbf902067460/baccalaureate-diploma/blob/master/docker-compose.yaml), but you can use same as I used:

```yaml
ETHEREUM_WSS_PROVIDER: wss://eth-mainnet.g.alchemy.com/v2/3cUbt6VJQ2KgDyyb4t5ZptdleD7zv1zP
POLYGON_WSS_PROVIDER: wss://polygon-mainnet.g.alchemy.com/v2/drfaRvfwnYV1B09OP5OqDFArrsQDxrOT
ARBITRUM_WSS_PROVIDER: wss://arb-mainnet.g.alchemy.com/v2/NmRerg5M8qeYs7G7Y5VxHWBKOlgtRkl0
```

# Deploy

- Run docker-compose (`sudo`):

```bash
docker-compose up -d --build
```

After setup each dashboard can be seen in the Apache Superset UI — http://0.0.0.0:8088/.

# Usage

- By default you can use these credentials to authenticate:
```
admin
```

# Exit
- To stop and remove composed containers:

```bash
docker-compose down
```
