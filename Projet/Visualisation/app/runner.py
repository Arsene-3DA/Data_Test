from app.collector import fetch_crypto_ohlcv, fetch_index_ohlcv
from app.db import upsert_ohlcv_rows
from app.utils import logger

def df_to_rows(df, symbol):
    # prépare tuples (timestamp, symbol, open, high, low, close, volume)
    return [
        (row["timestamp"].to_pydatetime(), symbol, float(row["open"]), float(row["high"]),
         float(row["low"]), float(row["close"]), float(row["volume"]))
        for _, row in df.iterrows()
    ]

def main():
    # liste configurée d'actifs
    cryptos = ["BTC/USDT", "ETH/USDT", "SOL/USDT"]
    indices = ["^NDX", "^DJI", "^GSPC"]

    for c in cryptos:
        df = fetch_crypto_ohlcv(c, timeframe="1h", limit=200)
        rows = df_to_rows(df, c.replace("/", ""))
        upsert_ohlcv_rows(rows)

    for idx in indices:
        df = fetch_index_ohlcv(idx, interval="60m", period="5d")
        rows = df_to_rows(df, idx.replace("^", "").replace("!", ""))
        upsert_ohlcv_rows(rows)

if __name__ == "__main__":
    main()
