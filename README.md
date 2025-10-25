# 📬 Notification Delivery Platform (Ruby POC)

This Proof of Concept (POC) demonstrates how a notification delivery system can efficiently process multiple delivery jobs in parallel using **multi-threading**, **worker pools**, and **message queue simulation** — similar to how large-scale systems handle millions of notifications concurrently.

---

## 🧩 Concept in Simple Terms

Think of this as a **Post Office for digital notifications**.

- **Producer** → The person dropping letters into the mailbox.  
  Reads incoming notification requests (orders) and enqueues them.

- **QueueSimulator** → The mailbox that holds all letters (jobs) safely until delivery.  
  It ensures messages are processed one at a time by available workers.

- **WorkerPool** → The team of postmen (workers) delivering letters simultaneously.  
  Each worker processes one delivery at a time in parallel.

- **Dispatcher** → The delivery van that actually sends each message (email/SMS).  
  It can simulate success or failure — just like a delivery attempt might fail.

- **LoggerService** → The delivery logbook that records every attempt into `notifications.db`.  
  This helps track both successful and failed deliveries.

📦 **In summary:**  
Orders = Letters → Queue = Mailbox → Workers = Postmen → Dispatcher = Delivery → Logger = Record book  

This POC shows how a **distributed, reliable, and fault-tolerant delivery flow** can be modeled in Ruby using threads, queues, and logging.

---

## 🧠 Concept Demonstrated

- Message Queueing  
- Worker Pooling & Thread Management  
- Asynchronous Job Processing  
- Logging & Persistence  
- Fault Handling Simulation  

---

## ⚙️ Components

| Component | File | Responsibility |
|------------|------|----------------|
| **Producer** | `producer.rb` | Simulates incoming notification requests |
| **Queue** | `queue_simulator.rb` | In-memory queue (Kafka-like) |
| **Worker Pool** | `worker_pool.rb` | Multi-threaded job execution |
| **Dispatcher** | `dispatcher.rb` | Simulated email/SMS API delivery |
| **Logger** | `logger_service.rb` | Logs delivery outcomes into SQLite |
| **Main Orchestrator** | `main.rb` | Wires all components together |
| **Sample Input** | `input/orders.json` | Contains test orders for demo |

---

## 🧩 Core Concepts → Implementation Mapping

| Concept | Implementation | Purpose |
|----------|----------------|----------|
| **Producer** | `producer.rb` | Simulates event producers pushing jobs |
| **Queue** | `queue_simulator.rb` | Holds jobs like Kafka/Redis |
| **Worker Pool** | `worker_pool.rb` | Concurrent job execution |
| **Dispatcher** | `dispatcher.rb` | Simulates email/SMS delivery |
| **Logger** | `logger_service.rb` | Persists results |
| **SQLite** | `logger_service.rb` | Lightweight persistence layer |

---

## 🔄 Data Flow

1. `producer.rb` reads `orders.json` and pushes jobs into the queue.  
2. `worker_pool.rb` spins up N threads (workers).  
3. Each worker pops a job and sends it via the `dispatcher.rb`.  
4. `dispatcher.rb` simulates API delivery (success/failure).  
5. `logger_service.rb` stores each result in `notifications.db`.  
6. When all jobs are processed, workers stop gracefully.

---

## 📦 Dependencies

- **Ruby** ≥ 3.2  
- **Gems**
  - `sqlite3` – For persistence  
  - `json` – For parsing input data (included in stdlib)

> Note: Install `sqlite3` gem manually or via Bundler.

---

## ▶️ Run Instructions

### 1. Run Locally

```bash
# Install bundler if not installed
gem install bundler

# Initialize and install sqlite3 gem
bundle init
bundle add sqlite3

# Execute the POC
ruby main.rb
````

### 2. Run via Docker

```bash
# Build Docker image
docker build -t notification_poc .

# Run container
docker run -it notification_poc
```

> Logs are stored in `notifications.db` after all jobs are processed.

---

## 🗂️ Folder Structure

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

---

## 📚 Further Reading

* [Architecture Overview](./docs/architecture.md)
* [Detailed Components](./docs/components.md)
* [Test & Demo Scenarios](./docs/scenarios.md)
* [Design Trade-offs](./docs/tradeoffs.md)
* [Functional Walkthrough](./docs/presentation.md)

---

## 🧩 Notes

* You can modify input data in `input/orders.json` for different test cases.
* Concurrency levels, simulated delivery failures, or sleep intervals can be tweaked in respective classes.
* This POC highlights:

  * Multi-threaded message delivery
  * Queue-based decoupling
  * Dispatcher simulation
  * Thread-safe logging
  * Result persistence via SQLite

---