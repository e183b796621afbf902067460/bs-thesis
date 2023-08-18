# Baccalaureate Diploma
Depends on: [raffaelo](https://github.com/e183b796621afbf902067460/raffaelo).

---

The Art of Decision-Making: Building Real-Time Data Processing Pipeline With Kafka, ClickHouse and Apache Superset.

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
