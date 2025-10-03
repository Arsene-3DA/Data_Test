import os
from dataclasses import dataclass

@dataclass
class Settings:
    # variables DB
    DB_HOST: str = os.getenv("DB_HOST", "localhost")
    DB_PORT: int = int(os.getenv("DB_PORT", 5432))
    DB_NAME: str = os.getenv("DB_NAME", "market_data")
    DB_USER: str = os.getenv("DB_USER", "postgres")
    DB_PASS: str = os.getenv("DB_PASS", "")
    # Collection
    CCXT_TIMEOUT: int = int(os.getenv("CCXT_TIMEOUT", 30))
    # Other
    FETCH_LIMIT: int = int(os.getenv("FETCH_LIMIT", 200))

settings = Settings()
