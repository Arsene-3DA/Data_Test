import yfinance as yf

SYMBOLS = {
    "BTCUSDT": "BTC-USD",
    "ETHUSDT": "ETH-USD",
    "NQ1!": "^NDX"
}

def get_market_data():
    data = {}
    for key, symbol in SYMBOLS.items():
        ticker = yf.Ticker(symbol)
        price = ticker.history(period="1d")["Close"].iloc[-1]
        data[key] = float(price)
    return data
