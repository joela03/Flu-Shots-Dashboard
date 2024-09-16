import psycopg2
import pandas as pd


def get_connection():
    """Sets up database connection"""
    conn = psycopg2.connect(
        dbname="healthcare",
        user="joel",
        host='localhost',
        port='5432'
    )
    return conn


def load_data_to_db(table_name, data_file, conn):
    """Loads data into the database"""

    try:
        df = pd.read_csv(data_file, delimiter=',')

        curs = conn.cursor()

        for i, row in df.iterrows():
            cols = ', '.join(list(df.columns))
            values = ', '.join(["%s"] * len(row))
            insert_query = f"INSERT INTO {
                table_name} ({cols}) VALUES ({values})"

            curs.execute(insert_query, tuple(row))

        conn.commit()
        print(f"Data from {data_file} loaded into {table_name} successfully.")

    except Exception as e:
        print(f"Error: {e}")
        conn.rollback()

    finally:
        curs.close()
