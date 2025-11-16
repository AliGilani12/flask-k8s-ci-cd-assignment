# Multi-stage Dockerfile for the Flask app

FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --prefix=/install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.11-slim AS runtime

WORKDIR /app

COPY --from=builder /install /usr/local

COPY app.py .
COPY app_utils.py .

EXPOSE 5000

CMD ["python", "app.py"]
