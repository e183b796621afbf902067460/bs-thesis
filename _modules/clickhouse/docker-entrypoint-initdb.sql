-- Actual table to store the data fetched from an Apache Kafka topic
CREATE TABLE IF NOT EXISTS clickhouse.dm_real_time_tx_processing
(
    q_real_time_tx_processing_address           String,

    q_real_time_tx_processing_t0_symbol         String,
    q_real_time_tx_processing_t1_symbol         String,
    q_real_time_tx_processing_t0_amount         Float64,
    q_real_time_tx_processing_t1_amount         Float64,

    q_real_time_tx_processing_tx_hash           String,

    q_real_time_tx_processing_protocol          String,
    q_real_time_tx_processing_blockchain        String,

    q_real_time_tx_processing_timestamp         DateTime
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(q_real_time_tx_processing_timestamp)
ORDER BY q_real_time_tx_processing_timestamp;

-- Kafka Engine which consumes the data from 'real.time.tx.processing' of Apache Kafka
CREATE TABLE IF NOT EXISTS clickhouse.q_real_time_tx_processing
(
    q_real_time_tx_processing_address           String,

    q_real_time_tx_processing_t0_symbol         String,
    q_real_time_tx_processing_t1_symbol         String,
    q_real_time_tx_processing_t0_amount         Float64,
    q_real_time_tx_processing_t1_amount         Float64,

    q_real_time_tx_processing_tx_hash           String,

    q_real_time_tx_processing_protocol          String,
    q_real_time_tx_processing_blockchain        String,

    q_real_time_tx_processing_timestamp         DateTime
)
ENGINE = Kafka
SETTINGS
    kafka_broker_list = 'kafka:9092',
    kafka_topic_list = 'real.time.tx.processing',
    kafka_group_name = 'q_real_time_tx_processing_ch',
    kafka_format = 'JSONEachRow';

-- Materialized View to insert any consumed data by Kafka Engine to 'dm_real_time_tx_processing' table
CREATE MATERIALIZED VIEW clickhouse.mv_real_time_tx_processing TO clickhouse.dm_real_time_tx_processing AS
SELECT
    q_real_time_tx_processing_address,
    q_real_time_tx_processing_t0_symbol,
    q_real_time_tx_processing_t1_symbol,
    q_real_time_tx_processing_t0_amount,
    q_real_time_tx_processing_t1_amount,
    q_real_time_tx_processing_tx_hash,
    q_real_time_tx_processing_protocol,
    q_real_time_tx_processing_blockchain,
    q_real_time_tx_processing_timestamp
FROM
    clickhouse.q_real_time_tx_processing;