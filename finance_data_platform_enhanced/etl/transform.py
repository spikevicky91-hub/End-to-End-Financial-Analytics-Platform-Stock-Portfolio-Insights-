import pandas as pd

def transform():
    df = pd.read_csv("data/stock_data_2000.csv")
    df['daily_return'] = df.groupby('ticker')['close'].pct_change()
    df['ma_7'] = df.groupby('ticker')['close'].transform(lambda x: x.rolling(7).mean())
    df['ma_30'] = df.groupby('ticker')['close'].transform(lambda x: x.rolling(30).mean())
    df.to_csv("data/transformed.csv", index=False)

if __name__ == "__main__":
    transform()
