
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
