# Spring Boot Metrics Demo with Prometheus & Grafana

This repository contains a containerized monitoring setup for a Java Spring Boot application with Prometheus and Grafana, orchestrated via Docker Compose and fronted by NGINX.

---

## 📌 Components
- **Spring Boot Application**
  - Exposes JVM metrics and a custom metric (`custom_random_metric`) returning a random number between 10–50.
  - Access under `http://localhost:8080`
- **Prometheus**
  - Collects metrics from the Spring Boot application.
  - Access under `http://localhost:8080/actuator/prometheus`.
- **Grafana**
  - Visualizes metrics in a preconfigured dashboard.
  - Access under `http://localhost:8080/grafana`.
    → Login with admin / admin
  - Once logged in, go to Dashboards -> "Spring Boot Metrics Demo" dashboard to see the metrics
- **NGINX Reverse Proxy**
  - Provides unified access under `http://localhost:8080`.

---

## 🚀 Prerequisites
- [Docker](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/install/)
- Java 17+ (only required if you want to run the Spring Boot app locally without Docker. Prometheus, Grafana, and NGINX are only available via Docker.)

---

## ▶️ Usage
Clone the repository and start the stack:

```bash
./start.sh
```

This will:
1. Build the Spring Boot JAR via Docker multi-stage build
2. Start all containers with Docker Compose
3. Run simple health checks against the application and metrics

---

## 📂 Project Structure

```bash
docker-compose.yml        # Service orchestration
Dockerfile                # Multi-stage build for Spring Boot app
start.sh                  # Script to build, start and test stack
nginx/nginx.conf          # NGINX reverse proxy configuration
prometheus/prometheus.yml # Prometheus scrape configuration
grafana/provisioning/     # Grafana datasources & dashboards
src/main/java/...         # Spring Boot app with custom metric
```