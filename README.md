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

## 🧠 Concept Demonstrated
- Message Queueing
- Worker Pooling & Thread Management
- Asynchronous Job Processing
- Logging & Persistence
- Fault Handling Simulation

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

# 🗂️ Folder Structure

```
notification-delivery-poc/
│
├── README.md
├── main.rb
├── producer.rb
├── worker_pool.rb
├── dispatcher.rb
├── logger_service.rb
├── queue_simulator.rb
├── input/
│   └── orders.json
└── docs/
    ├── architecture.md
    ├── components.md
    ├── scenarios.md
    ├── tradeoffs.md
    └── presentation.md
```

## 📚 Further Reading

* [Architecture Overview](./docs/architecture.md)
* [Detailed Components](./docs/components.md)
* [Test & Demo Scenarios](./docs/scenarios.md)
* [Design Trade-offs](./docs/tradeoffs.md)
* [Functional Walkthrough](./presentation.md)

--- 

## 🧠 Concept Mapping

| Concept         | Implementation       | Purpose                                |
| --------------- | -------------------- | -------------------------------------- |
| **Producer**    | `producer.rb`        | Simulates event producers pushing jobs |
| **Queue**       | `queue_simulator.rb` | Holds jobs like Kafka/Redis            |
| **Worker Pool** | `worker_pool.rb`     | Concurrent job execution               |
| **Dispatcher**  | `dispatcher.rb`      | Simulates email/SMS API call           |
| **Logger**      | `logger_service.rb`  | Persists success/failure results       |
| **SQLite**      | `logger_service.rb`  | Lightweight persistence layer          |

---

## 🔄 Data Flow

1. `producer.rb` reads `orders.json` and pushes jobs to queue.
2. `worker_pool.rb` spins up N threads.
3. Each worker pops a job and hands it to `dispatcher.rb`.
4. `dispatcher.rb` simulates API send and returns result.
5. `logger_service.rb` stores job + result to SQLite.
6. Once all jobs processed, workers gracefully stop.

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
