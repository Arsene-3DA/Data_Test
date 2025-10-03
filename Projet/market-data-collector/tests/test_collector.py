from app.collector import get_market_data

def test_get_market_data():
    data = get_market_data()
    assert "BTCUSDT" in data
    assert isinstance(data["BTCUSDT"], float)
    assert data["BTCUSDT"] > 0
