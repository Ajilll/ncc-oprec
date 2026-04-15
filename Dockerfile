# STAGE 1: Builder (Menginstall dependencies)
FROM python:3.11-alpine AS builder
WORKDIR /app

COPY requirements.txt .
# Install dependencies ke folder user lokal agar mudah dipindah
RUN pip install --user --no-cache-dir -r requirements.txt

# STAGE 2: Runner (Image final yang super ringan)
FROM python:3.11-alpine
WORKDIR /app

# Copy dependencies yang sudah diinstall dari stage builder
COPY --from=builder /root/.local /root/.local
COPY . .

# Pastikan environment path mengenali binary dari dependencies
ENV PATH=/root/.local/bin:$PATH

# Poin Plus: Environment Variable bawaan
ENV APP_NAME="NCC_Health_Service"

# Poin Plus: HEALTHCHECK instruction
# Docker akan mengecek setiap 30 detik apakah endpoint /health bisa diakses
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/health || exit 1

# Poin Plus: Port configuration yang jelas
EXPOSE 8000

# Perintah untuk menjalankan service
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
