import psycopg2
from psycopg2.extras import execute_values
from typing import List, Tuple
from app.config import settings
from app.utils import logger

def get_conn():
    """Crée une connexion avec sslmode=require si fourni par l'environnement."""
    conn = psycopg2.connect(
        host=settings.DB_HOST,
        port=settings.DB_PORT,
        dbname=settings.DB_NAME,
        user=settings.DB_USER,
        password=settings.DB_PASS,
        sslmode="require"  # for security; change based on infra
    )
    return conn

def upsert_ohlcv_rows(rows: List[Tuple]):
    """
    rows : list of tuples (timestamp, symbol, open, high, low, close, volume)
    Utilise execute_values pour insertion en bulk et ON CONFLICT DO NOTHING (idempotent).
    """
    sql = """
    INSERT INTO ohlcv (timestamp, symbol, open, high, low, close, volume)
    VALUES %s
    ON CONFLICT (timestamp, symbol) DO UPDATE
      SET open = EXCLUDED.open,
          high = EXCLUDED.high,
          low = EXCLUDED.low,
          close = EXCLUDED.close,
          volume = EXCLUDED.volume;
    """
    conn = get_conn()
    try:
        with conn:
            with conn.cursor() as cur:
                execute_values(cur, sql, rows, template=None, page_size=1000)
        logger.info("Inserted %d rows", len(rows))
    finally:
        conn.close()
