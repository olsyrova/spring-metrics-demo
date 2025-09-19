#!/bin/bash
set -e

# Start containers
docker-compose up -d --build

echo "⏳ Waiting for services to start..."
sleep 10

# Check Spring Boot health endpoint
echo "🔍 Checking Spring Boot health..."
curl -fs http://localhost:8080/actuator/health || { echo "❌ Spring Boot health check failed"; exit 1; }

# Check custom metric in Prometheus endpoint
echo "🔍 Checking custom metric..."
curl -fs http://localhost:8080/actuator/prometheus | grep -q custom_random_metric || { echo "❌ Custom metric not found"; exit 1; }

# Check Grafana endpoint
echo "🔍 Checking grafana endpoint..."
curl -fs http://localhost:8080/grafana/ || { echo "❌ Grafana not reachable"; exit 1; }

echo "✅ All services are healthy!"
