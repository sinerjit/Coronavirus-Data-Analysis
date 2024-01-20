import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# Read the CSV file and skip faulty lines
df = pd.read_csv('__csv_file_path__', delimiter=';', on_bad_lines='skip')

# Explore the data
# pd.set_option('display.max_columns', None)
# pd.set_option('display.expand_frame_repr', False)
# print(df)

try:
    # Establish a connection to the PostgreSQL database
    db_connection = psycopg2.connect(
        host="localhost",
        database="__database_name__",
        user="__username__",
        password="__password__",
        port="__port_number__"
    )


    # Check if the database connection is established
    if db_connection:
        # If connected, print a message indicating a successful connection
        print("Connected")

        # Create a SQLAlchemy engine for PostgreSQL
        engine = create_engine('postgresql://postgres:password@localhost:port_number/CoronaVirus')

        # Write the DataFrame to the PostgreSQL table 'covid_vaccinations'
        df.to_sql('covid_vaccinations', con=engine, if_exists='append', index=False)

        # Close the database connection
        db_connection.close()

except Exception as e:
    # If there is an exception during the database connection attempt, print a more specific error message
    print(f"Error during database connection: {e}")

# Create a SQLAlchemy engine for PostgreSQL
engine = create_engine('postgresql://postgres:1S2a3r4p@localhost:5433/CoronaVirus')

# Write the DataFrame to the PostgreSQL table 'covid_vaccinations'
df.to_sql('covid_vaccinations', con=engine, if_exists='append', index=False)  # 'replace' yerine 'append' de kullanabilirsiniz

# Close the database connection
db_connection.close()