from json import dumps


dicted = {
    'q_real_time_tx_processing_address': '0xC31E54c7a869B9FcBEcc14363CF510d1c41fa443',
    'q_real_time_tx_processing_timestamp': '2023-09-26 21:23:29',
    'q_real_time_tx_processing_t0_symbol': 'WETH',
    'q_real_time_tx_processing_t1_symbol': 'USDC',
    'q_real_time_tx_processing_t0_amount': -0.34997856082108125,
    'q_real_time_tx_processing_t1_amount': 555.076,
    'q_real_time_tx_processing_tx_hash': '0x9c19be4b46cb7a1c66c3a5b5737d9cbcd96128a76ae3cf9afaaceb79481bd398',
    'q_real_time_tx_processing_protocol': 'uniswap-v3',
    'q_real_time_tx_processing_blockchain': 'arbiscan.io',
    'q_real_time_tx_processing_swap_side': 'BUY',
    'q_real_time_tx_processing_swap_maker': '0x4243291C911c5A663427F91e9aEdb9d0300709f9',
    'q_real_time_tx_processing_swap_quote_price': 1586.0285804300174
}

dumped = dumps(dicted).encode('utf-8').decode()
dd = dumps(dumped)
print(
    type(dumped)
)