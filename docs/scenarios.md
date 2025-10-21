## 🧪 `docs/scenarios.md`

# 🧪 Test & Demo Scenarios


| Scenario                | Description                            | Input Modifications                           | Concepts Demonstrated                         |
| ----------------------- | -------------------------------------- | --------------------------------------------- | --------------------------------------------- |
| **Single-threaded**     | Only 1 worker processes orders         | WorkerPool size = 1                           | Threading basics, sequential processing       |
| **Multi-threaded**      | 2–3 workers process orders             | WorkerPool size = 2–3                         | Concurrency, parallelism                      |
| **Delivery Failures**   | Some emails fail to send               | Randomly simulate failures in `dispatcher.rb` | Error handling, retries, logging              |
| **High Volume**         | Many orders queued (50+)               | Large input JSON                              | Queue handling, load, thread contention       |
| **Duplicate Orders**    | Same order repeated                    | Duplicate `order_id`s in JSON                 | Deduplication, thread safety (if Redis used)  |
| **Mixed Delays**        | Varying processing times               | Sleep in dispatcher 0.1–1 sec                 | Observing asynchronous behavior, non-blocking |
| **Logging Check**       | Ensure all outcomes logged             | Use previous scenarios                        | SQLite logging, data persistence              |
| **Worker Pool Scaling** | Observe how multiple threads pick jobs | Adjust WorkerPool size dynamically            | Thread allocation, load balancing             |

---

### Example Input: `orders.json`
```json
[
  {"order_id": 1, "email": "alice@example.com", "message": "Order confirmed!"},
  {"order_id": 2, "email": "bob@example.com", "message": "Your order has shipped!"},
  {"order_id": 3, "email": "carol@example.com", "message": "Your package was delivered!"}
]

````

---

### Expected Log Output

```
[Producer] Queuing order #1
[Worker 1] Processing order #1
[Dispatcher] Sending message to alice@example.com...
[Producer] Queuing order #2
[Dispatcher] Failed delivery
[Producer] Queuing order #3
[Producer] Queuing order #4
[Worker 1] Processing order #2
[Dispatcher] Sending message to bob@example.com...
✓ Logged to DB
```

---

### Verifying SQLite Logs

```bash
sqlite3 notification_log.db "SELECT * FROM logs;"
```
