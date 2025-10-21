# Notification Delivery Platform (Ruby POC)

This is a simplified simulator version of the Notification Delivery Platform, built to explore core concepts like multi-threading, worker pools, queue processing, dispatching, and logging.

---

## Components

- `producer.rb` – Simulates incoming notification requests.
- `queue_simulator.rb` – Simple in-memory queue (Kafka-like).
- `worker_pool.rb` – Multi-threaded worker pool.
- `dispatcher.rb` – Simulated email/SMS dispatcher.
- `logger_service.rb` – Logs processed results into SQLite.
- `main.rb` – Orchestrates all components.
- `input/orders.json` – Sample input data for demonstration.

---

## Dependencies

- Ruby >= 3.2
- Gems:
  - `sqlite3` – For logging notifications.
  - `json` – For parsing input data.

> Note: `json` is included in Ruby stdlib, `sqlite3` needs to be installed.

---

## Run Instructions

### 1. Run Locally

```bash
# Install bundler if not installed
gem install bundler

# Initialize bundle and install sqlite3 gem
bundle init
bundle add sqlite3

# Run the POC
ruby main.rb
````

### 2. Run via Docker

```bash
# Build Docker image
docker build -t notification_poc .

# Run container
docker run -it notification_poc
```

> All notifications processed will be logged into `notifications.db` (SQLite file).

---

## Notes

* Input orders can be modified in `input/orders.json`.
* Worker pool concurrency, dispatch delays, and simulated delivery failures can be tweaked in the respective classes for testing concepts.
* This POC focuses on demonstrating:

  * Multi-threaded processing
  * Queue-based decoupling
  * Dispatcher simulation
  * Thread-safe logging
  * Observing logs via SQLite

---
