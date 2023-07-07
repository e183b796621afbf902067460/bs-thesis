CREATE TABLE IF NOT EXISTS clickhouse.q_real_time_tx_processing
(
    q_real_time_tx_processing_uuid              UUID DEFAULT generateUUIDv4(),

    q_real_time_tx_processing_address           String,

    q_real_time_tx_processing_t0_symbol         String,
    q_real_time_tx_processing_t1_symbol         String,
    q_real_time_tx_processing_t0_amount         Float64,
    q_real_time_tx_processing_t1_amount         Float64,

    q_real_time_tx_processing_tx_hash           String,

    q_real_time_tx_processing_protocol          String,
    q_real_time_tx_processing_blockchain        String,

    q_real_time_tx_processing_timestamp         DateTime,
    q_real_time_tx_processing_load_ts           DateTime DEFAULT now()
)
ENGINE = Kafka
SETTINGS
    kafka_broker_list = 'kafka:9092',
    kafka_topic_list = 'real.time.tx.processing',
    kafka_group_name = 'q_real_time_tx_processing_result',
    kafka_format = 'JSONEachRow';