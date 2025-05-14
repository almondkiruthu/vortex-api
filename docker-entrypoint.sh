#!/bin/sh
echo "Waiting for Postgres to start..."
./wait-for postgres:5432

echo "Running Alembic migrations..."
alembic upgrade head

echo "Starting Uvicorn server..."
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
