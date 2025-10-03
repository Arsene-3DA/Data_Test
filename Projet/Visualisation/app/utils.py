import logging
from tenacity import retry, wait_exponential, stop_after_attempt, retry_if_exception_type

# Logging structuré simple
logger = logging.getLogger("market_pipeline")
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")

# Retry decorator : backoff exponentiel
retry_on_exception = retry(
    reraise=True,
    wait=wait_exponential(multiplier=1, min=2, max=60),
    stop=stop_after_attempt(5),
    retry=retry_if_exception_type(Exception)
)
