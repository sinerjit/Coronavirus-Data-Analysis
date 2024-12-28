import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# Ask the user for database credentials and CSV file path
db_host = input("Enter the database host (e.g., localhost): ")
db_name = input("Enter the database name: ")
db_user = input("Enter the database username: ")
db_password = input("Enter the database password: ")
db_port = input("Enter the database port (e.g., 5432): ")
csv_file_path = input("Enter the path to the CSV file: ")

# Read the CSV file and handle faulty lines
try:
    print("Reading the CSV file...")
    df = pd.read_csv(csv_file_path, delimiter=';', on_bad_lines='warn')
    print("CSV file successfully read.")
except Exception as e:
    print(f"Error reading the CSV file: {e}")
    exit()

try:
    # Establish a connection to the PostgreSQL database
    print("Connecting to the database...")
    db_connection = psycopg2.connect(
        host=db_host,
        database=db_name,
        user=db_user,
        password=db_password,
        port=db_port
    )
    print("Connected to the database.")

    # Create a SQLAlchemy engine
    engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')

    # Write the DataFrame to the PostgreSQL table
    table_name = input("Enter the table name to write data (e.g., covid_vaccinations): ")
    print(f"Writing data to the table '{table_name}'...")
    df.to_sql(table_name, con=engine, if_exists='append', index=False)
    print(f"Data successfully written to the table '{table_name}'.")

except Exception as e:
    print(f"Error: {e}")

finally:
    # Ensure the database connection is closed
    if 'db_connection' in locals() and db_connection:
        db_connection.close()
        print("Database connection closed.")
