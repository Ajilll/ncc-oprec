from fastapi import FastAPI, status
import os

app = FastAPI()

# Mengambil environment variable (Poin Plus)
APP_NAME = os.getenv("APP_NAME", "NCC_Service")

@app.get("/health", status_code=status.HTTP_200_OK)
def health_check():
    return {
        "status": "sukses", 
        "kode": 200,
        "pesan": f"OK - {APP_NAME} berjalan dengan baik!"
    }
