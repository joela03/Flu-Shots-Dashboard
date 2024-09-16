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
