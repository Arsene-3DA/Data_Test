from fastapi import FastAPI
from app.collector import get_market_data

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Market Data Collector API"}

@app.get("/data")
def fetch_data():
    return get_market_data()
