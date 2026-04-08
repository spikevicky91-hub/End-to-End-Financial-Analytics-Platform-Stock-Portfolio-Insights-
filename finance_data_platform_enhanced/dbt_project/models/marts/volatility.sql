
SELECT
    ticker,
    STDDEV(close) AS volatility
FROM {{ ref('stg_stock') }}
GROUP BY ticker
