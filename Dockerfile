# Stage 1: Build Stage
FROM python:3.11.7-alpine3.17 AS builder
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache build-base libffi-dev && \
    python -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime Stage for ECR
FROM python:3.11.7-alpine3.17
WORKDIR /app
COPY --from=builder /app/venv /app/venv
COPY . .
EXPOSE 5000
CMD ["venv/bin/python", "app.py"]