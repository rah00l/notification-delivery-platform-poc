# ⚖️ Technical Trade-offs

| Area | Current Choice | Reason | Future Option |
|------|----------------|--------|----------------|
| **Queueing** | In-memory Queue | Simplicity | Kafka / Redis Streams |
| **Persistence** | SQLite | Lightweight | PostgreSQL |
| **Concurrency** | Ruby Threads | Easy demo setup | Sidekiq, async jobs |
| **Logging** | Console + DB | Visual clarity | Structured JSON logs |
| **Dispatch Simulation** | Random success/failure | Demonstrate retries | Real API integration |

---

## 🚧 Limitations
- Not distributed across machines
- Shared memory space (no isolation)
- No retry or backoff mechanism
- Single DB writer thread


## 🔮 Future Enhancements
- Retry queues and dead-letter queues
- Web dashboard for monitoring
- Containerized scaling with Docker Compose
  
