
## ⚙️ `docs/components.md`

# 🔍 Component Breakdown

| Component | File | Class | Description | Key Concepts |
|------------|------|--------|--------------|---------------|
| **Producer** | `producer.rb` | `Producer` | Reads orders, enqueues them | Job Production |
| **Queue Simulator** | `queue_simulator.rb` | `QueueSimulator` | Thread-safe in-memory queue | Concurrency |
| **Worker Pool** | `worker_pool.rb` | `WorkerPool` | Spawns multiple threads | Thread Management |
| **Dispatcher** | `dispatcher.rb` | `Dispatcher` | Simulates external API | Latency, Faults |
| **Logger Service** | `logger_service.rb` | `LoggerService` | Writes to SQLite | Persistence |
| **Main Orchestrator** | `main.rb` | - | Connects all modules | System Integration |

---

## 🧵 Threading
- Each worker thread consumes one job at a time.
- `@queue.pop` blocks until a job is available.
- Clean shutdown with `break unless job`.

---

## 🧩 Key Features
- Simple `Queue` synchronization using Ruby’s `Queue` class.
- Artificial delay using `sleep(0.5)` to mimic I/O latency.
- SQLite DB ensures persisted logs for verification.
