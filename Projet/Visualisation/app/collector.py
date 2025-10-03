import ccxt
import yfinance as yf
import pandas as pd
from datetime import datetime
from app.config import settings
from app.utils import retry_on_exception, logger

# --- Crypto via CCXT (Binance)
@retry_on_exception
def fetch_crypto_ohlcv(symbol: str = "BTC/USDT", timeframe: str = "1h", limit: int = None) -> pd.DataFrame:
    """
    Récupère OHLCV depuis Binance via CCXT.
    Retour : DataFrame colonne [timestamp, open, high, low, close, volume]
    """
    if limit is None:
        limit = settings.FETCH_LIMIT

    # initialise l'API ccxt pour Binance (public endpoints)
    exchange = ccxt.binance({
        "timeout": settings.CCXT_TIMEOUT * 1000,
        "enableRateLimit": True,
    })

    # fetch_ohlcv renvoie une liste de listes [ts, o, h, l, c, v]
    ohlcv = exchange.fetch_ohlcv(symbol, timeframe=timeframe, limit=limit)

    df = pd.DataFrame(ohlcv, columns=["timestamp", "open", "high", "low", "close", "volume"])
    # timestamp en ms -> datetime
    df["timestamp"] = pd.to_datetime(df["timestamp"], unit="ms")
    logger.info("Fetched %d rows for %s", len(df), symbol)
    return df

# --- Indices via yfinance
@retry_on_exception
def fetch_index_ohlcv(symbol: str = "^NDX", interval: str = "60m", period: str = "5d") -> pd.DataFrame:
    """
    Récupère OHLCV depuis yfinance pour indices/stocks.
    interval: "1d","60m","1m" selon disponibilité
    """
    ticker = yf.Ticker(symbol)
    df = ticker.history(interval=interval, period=period).reset_index()
    # unify columns
    df.rename(columns={"Date": "timestamp", "Open": "open", "High": "high", "Low": "low", "Close": "close", "Volume": "volume"}, inplace=True)
    df["timestamp"] = pd.to_datetime(df["timestamp"])
    logger.info("Fetched %d rows for %s", len(df), symbol)
    return df
