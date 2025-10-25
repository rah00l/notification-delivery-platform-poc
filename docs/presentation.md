
# 📈 Functional & Concept Presentation

### 🎯 Purpose
Demonstrate how notifications move through a simplified delivery system — from incoming requests to final delivery — while ensuring scalability, concurrency, and persistence.

---

### 🧩 System Flow
1. **Customer request** enters → producer captures it.
2. **Job queued** → placed into a central queue (simulating Kafka).
3. **Worker pool** picks up jobs → multiple threads process simultaneously.
4. **Dispatcher** sends notification → success or simulated failure.
5. **Logger** records outcome → stored for audit.
6. **System gracefully shuts down** when all jobs done.

---

### 📮 **Notification Delivery Platform — Mailroom Simulation Tests**

Think of this system as a **digital Post Office**:

* 🧑‍💼 **Producer** → The Clerk receiving letters (orders).
* 📦 **Queue** → The Mailroom tray holding envelopes to be sent.
* 👷‍♂️ **Workers** → The Mailmen who pick up letters from the tray.
* 🚴‍♀️ **Dispatcher** → The delivery process that sends each letter to its destination.
* 📓 **Logger (Database)** → The record book noting which letters were delivered or failed.

---

### ⚙️ 1. **Base Flow — Smooth Postal Operation**

**Goal:** Verify that letters move properly from counter → tray → mailmen → doorstep.

**Input**

```json
[
  {"order_id": 1, "email": "alice@example.com"},
  {"order_id": 2, "email": "bob@example.com"}
]
```

**Output**

```
[Clerk] Accepted letter #1
[Mailman 1] Delivering to alice@example.com...
[Mailman 2] Delivering to bob@example.com...
[Dispatcher] Both deliveries successful
```

🟢 **Concept:** End-to-end delivery pipeline validation.

---

### ⚡ 2. **Multi-Mailman Concurrency**

**Goal:** Show that multiple mailmen can deliver letters *at the same time*.

**Concept:** Thread-safe queue, worker pool, concurrent dispatch.

**Input**

```json
[
  {"order_id": 1, "email": "a@example.com"},
  {"order_id": 2, "email": "b@example.com"},
  {"order_id": 3, "email": "c@example.com"}
]
```

**Output**

```
[Mailman 0] Delivering to a@example.com...
[Mailman 1] Delivering to b@example.com...
[Mailman 2] Delivering to c@example.com...
[Post Office] All letters delivered in parallel!
```

🟢 **Concept:** Multi-threaded delivery efficiency.

---

### ❌ 3. **Failed Deliveries — Address Not Found**

**Goal:** Ensure one failed letter doesn’t halt the others.

**Concept:** Fault isolation, resilience, retry scope.

**Input**

```json
[
  {"order_id": 1, "email": "alice@example.com"},
  {"order_id": 2, "email": "bob@unknown-domain.com"}
]
```

**Output**

```
[Mailman 1] Delivered to alice@example.com
[Mailman 2] Failed to deliver to bob@unknown-domain.com
[Post Office] Logged both outcomes safely
```

🟢 **Concept:** Isolated thread errors don’t affect queue flow.

---

### 🔁 4. **Duplicate Letters — Same Envelope Twice**

**Goal:** Prevent the same letter from being sent twice.

**Concept:** Idempotency, data safety.

**Input**

```json
[
  {"order_id": 1, "email": "alice@example.com"},
  {"order_id": 1, "email": "alice@example.com"}
]
```

**Output**

```
[Mailman 0] Delivered letter #1
[Mailman 1] Duplicate detected, skipping delivery
```

🟢 **Concept:** Smart duplicate handling to avoid re-delivery.

---

### ⚠️ 5. **Invalid Addresses — Bad or Missing Data**

**Goal:** Handle invalid or blank addresses gracefully.

**Concept:** Validation and safe error recovery.

**Input**

```json
[
  {"order_id": 1, "email": ""},
  {"order_id": 2, "email": "invalid-email"},
  {"order_id": 3, "email": "carol@example.com"}
]
```

**Output**

```
[Mailman 0] Invalid address, skipping letter #1
[Mailman 1] Invalid format for letter #2
[Mailman 2] Delivered to carol@example.com
```

🟢 **Concept:** Robustness under incorrect data.

---

### 🚀 6. **High Volume Mailbag — 50 Letters at Once**

**Goal:** Test how the post office handles bulk dispatches.

**Concept:** Load distribution, queue backpressure, thread scheduling.

**Input**

```json
[ { "order_id": 1 }, { "order_id": 2 }, ... { "order_id": 50 } ]
```

**Output**

```
[Clerk] Received 50 letters
[Mailmen 0-4] Delivering in batches...
[Dispatcher] All 50 letters delivered successfully
```

🟢 **Concept:** Scalable, concurrent, high-throughput delivery.

---

### 📊 **Quick Summary**

| Scenario         | Real-World Analogy  | Focus               | Outcome     |
| ---------------- | ------------------- | ------------------- | ----------- |
| Base Flow        | Regular postal run  | End-to-end flow     | ✅ Smooth    |
| Concurrency      | Many mailmen        | Parallel processing | ✅ Efficient |
| Failure Handling | Wrong address       | Fault isolation     | ✅ Safe      |
| Duplicate Orders | Same envelope twice | Idempotency         | ✅ Prevented |
| Invalid Data     | Missing address     | Validation          | ✅ Handled   |
| Scalability      | Big mailbag         | Load management     | ✅ Stable    |

---

**How to Run**

```bash
docker run -it notification_poc
```

**Verify logs:**
Check `notifications.db` — your post office ledger of all deliveries.

---

### 💡 Key Takeaways
- Conceptual demonstration of **asynchronous processing** and **parallelism**.
- Highlights **decoupling** between producer, queue, and consumer.
- Can be extended into real-world cloud architecture (Kafka + Sidekiq + PostgreSQL).

---

### 🎥 Optional Demo Steps
1. Show JSON file with jobs.
2. Run `ruby main.rb`.
3. Display console logs (workers processing).
4. Query `sqlite3` DB to show results.

---
