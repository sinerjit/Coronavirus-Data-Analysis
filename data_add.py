import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# CSV dosyasını oku ve hatalı satırları atla
df = pd.read_csv('C:\\Users\\sarp_\\Desktop\\X\\Projects\\Data Analyst Portfolio Project 1\\CovidDeaths.csv', delimiter=';', on_bad_lines='skip')

# Veriyi incele
# pd.set_option('display.max_columns', None)
# pd.set_option('display.expand_frame_repr', False)
# print(df)
try:
    db_connection = psycopg2.connect(
        host="localhost",
        database="CoronaVirus",
        user="postgres",
        password="1S2a3r4p",
        port="5433"  # PostgreSQL sunucunuzun kullandığı port numarası
    )

 # Burada bağlantı üzerinde çalışmalar yapabilirsiniz.
except Exception as e:
    print(f"Error: {e}")
finally:
    if db_connection:
        print("Connected")
        db_connection.close()

engine = create_engine('postgresql://postgres:1S2a3r4p@localhost:5433/CoronaVirus')

df.to_sql('covid_deaths', con=engine, if_exists='append', index=False)  # 'replace' yerine 'append' de kullanabilirsiniz

db_connection.close()