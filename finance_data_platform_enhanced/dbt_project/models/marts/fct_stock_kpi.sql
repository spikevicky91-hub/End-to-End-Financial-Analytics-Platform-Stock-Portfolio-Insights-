
SELECT
    date,
    ticker,
    close,
    close - LAG(close) OVER (PARTITION BY ticker ORDER BY date) AS price_change,
    AVG(close) OVER (PARTITION BY ticker ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS ma_7,
    AVG(close) OVER (PARTITION BY ticker ORDER BY date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS ma_30
FROM {{ ref('stg_stock') }}
