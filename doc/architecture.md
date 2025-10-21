# 🏗️ Architecture Overview

This POC models a simplified notification delivery platform in Ruby.  
It demonstrates **data flow**, **multi-threaded worker pools**, and **fault-tolerant processing** using simple building blocks.

---

## ⚙️ High-Level Flow

```text
        ┌───────────┐
        │ Producer  │  → generates orders/jobs
        └─────┬─────┘
              ↓
        ┌────────────┐
        │ Queue      │  → holds pending jobs
        └─────┬──────┘
              ↓
        ┌────────────┐
        │ WorkerPool │  → multiple threads consume queue
        └─────┬──────┘
              ↓
        ┌────────────┐
        │ Dispatcher │  → simulate email/SMS sending
        └─────┬──────┘
              ↓
        ┌────────────┐
        │ Logger     │  → saves result to SQLite
        └────────────┘
```