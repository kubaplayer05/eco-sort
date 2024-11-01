import os
import sys
from dotenv import load_dotenv
from sentence_transformers import SentenceTransformer

load_dotenv("../.env")

plain_name = sys.stdin.read().strip()

model = SentenceTransformer(os.getenv("MODEL_NAME"))
name_embedding = model.encode(plain_name)

embedding_str = "[" + ", ".join(map(str, name_embedding)) + "]"

print(embedding_str)
