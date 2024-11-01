import os

from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
import psycopg2

load_dotenv("../.env")

model = SentenceTransformer(os.getenv("MODEL_NAME"))
conn = psycopg2.connect(
    dbname=os.getenv("DB_DATABASE"), user=os.getenv("DB_USER"), password=os.getenv("DB_PASSWORD"), host="localhost",
    port="5432"
)

cursor = conn.cursor()

cursor.execute("SELECT id, name FROM products WHERE embedding IS NULL;")
products = cursor.fetchall()

product_ids = [product[0] for product in products]
product_names = [product[1] for product in products]

product_embeddings = model.encode(product_names)

for index, embedding in enumerate(product_embeddings):
    product_id = product_ids[index]
    embedding_str = "[" + ", ".join(map(str, embedding)) + "]"

    cursor.execute("UPDATE products SET embedding = %s WHERE id = %s", (embedding_str, product_id))

conn.commit()
cursor.close()

conn.close()
