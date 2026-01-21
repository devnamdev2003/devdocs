<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../../)

# 🧪 HANDS-ON 3

## Asynchronous Messaging

### (Amazon SQS → AWS Lambda)

This lab teaches you how to build **decoupled, reliable, and scalable serverless systems**.

---

## 1️⃣ What You Are Building (Big Picture)

You are building a system where:

> **Messages are sent to a queue, and Lambda processes them asynchronously.**

The sender and processor **do not talk directly**.

---

### 🏗 Architecture

```
Producer (App / API / Lambda)
 ↓
Amazon SQS Queue
 ↓
AWS Lambda (Consumer / Worker)
 ↓
Process Task (email, DB update, etc.)
```

---

## 2️⃣ Why This Lab Is CRITICAL

This lab teaches:

✔ Decoupling systems
✔ Asynchronous processing
✔ Reliability & retries
✔ Failure handling
✔ Back-pressure control
✔ Real-world scalability

📌 Almost every **large system uses queues**.

---

## 3️⃣ Real-World Use Cases (Very Important)

You will see this pattern in:

* Order processing
* Email sending
* Payment processing
* Log ingestion
* Background jobs
* Notification systems

---

## 4️⃣ Why SQS Is Needed (The Core Problem)

### 🔴 Without SQS (Bad Design)

```
Service A → Service B
```

Problems:

* If Service B is down → Service A fails
* Traffic spikes crash Service B
* Tight coupling

---

### ✅ With SQS (Good Design)

```
Service A → SQS → Service B
```

Benefits:
✔ Loose coupling
✔ Automatic buffering
✔ Retry handling
✔ Fault tolerance

---

## 5️⃣ What Is Amazon SQS?

**Amazon SQS (Simple Queue Service)** is a **fully managed message queue**.

> It stores messages until they are processed.

Key idea:

> **Send now, process later.**

---

## 6️⃣ Types of SQS Queues (Exam Important)

### 🔹 Standard Queue (Most Common)

* At-least-once delivery
* High throughput
* Messages may be duplicated

### 🔹 FIFO Queue

* Exactly-once processing
* Strict ordering
* Lower throughput

📌 For this lab, assume **Standard Queue**.

---

## 7️⃣ Key SQS Concepts (Must Understand)

### 🔹 Message

* A unit of data (JSON, text)

### 🔹 Visibility Timeout

* Time during which message is hidden after being read

### 🔹 Retention Period

* How long SQS keeps unprocessed messages

### 🔹 Dead Letter Queue (DLQ)

* Stores failed messages

---

## 8️⃣ Full Step-by-Step Flow (VERY IMPORTANT)

Let’s go through the **exact flow**.

---

### 🟢 Step 1: Producer Sends Message

A producer could be:

* API Gateway + Lambda
* Another Lambda
* EC2
* Any AWS service

Message example:

```json
{
  "orderId": "123",
  "email": "user@test.com"
}
```

Producer sends message to SQS.

---

### 🟢 Step 2: Message Is Stored in SQS

SQS:

* Stores message durably
* Replicates it across AZs
* Waits for a consumer

📌 SQS is highly available by default.

---

### 🟢 Step 3: Lambda Polls SQS (IMPORTANT)

Unlike S3:

* SQS does NOT push events

Instead:

* AWS Lambda **polls SQS automatically**
* You do NOT write polling code

📌 This is a common exam trick.

---

### 🟢 Step 4: Lambda Receives Message

Lambda receives:

* Message body
* Message ID
* Receipt handle

Lambda starts processing.

---

### 🟢 Step 5: Message Becomes Invisible

Once Lambda receives message:

* Message becomes **invisible**
* Controlled by **Visibility Timeout**

This prevents:

* Multiple Lambdas processing same message at once

---

### 🟢 Step 6: Lambda Processes Message

Lambda performs task:

* Send email
* Update database
* Call external API

---

### 🟢 Step 7: Message Is Deleted

If Lambda succeeds:

* Message is deleted from SQS
* Processing complete

---

## 9️⃣ Failure Handling (MOST IMPORTANT PART)

### ❌ What If Lambda Fails?

If Lambda:

* Throws error
* Times out
* Crashes

Then:

* Message is NOT deleted
* Visibility timeout expires
* Message becomes visible again

➡ Lambda retries automatically

---

## 🔟 Retry Behavior (Exam Favorite)

SQS + Lambda provides:

* **Automatic retries**
* No extra configuration

But:

* Retries are infinite by default

This can cause:
❌ Poison messages

---

## 1️⃣1️⃣ Dead Letter Queue (DLQ) – CRITICAL

### What Is a DLQ?

A **Dead Letter Queue** is a backup queue where:

> **Messages go after multiple failures**

---

### How It Works

1. Message fails processing
2. Retry count increases
3. After max receives:

   * Message moved to DLQ
4. Main queue is protected

---

### Why DLQ Is Important

✔ Prevents infinite retries
✔ Allows manual inspection
✔ Improves reliability

📌 **Exams LOVE DLQ questions**

---

## 1️⃣2️⃣ Scaling Behavior (Powerful Concept)

If:

* 10 messages → 10 Lambda executions
* 10,000 messages → 10,000 executions

AWS:
✔ Scales Lambda automatically
✔ Processes messages in parallel

You control:

* Batch size
* Concurrency

---

## 1️⃣3️⃣ Back-Pressure Handling

If Lambda is slow:

* Messages stay in queue
* Producers are NOT affected

This protects your system from overload.

---

## 1️⃣4️⃣ IAM Permissions (Very Important)

### Who needs access?

#### 🔹 Producer

* Permission to send message to SQS

#### 🔹 Lambda

* Permission to:

  * Receive messages
  * Delete messages

IAM role is mandatory.

---

## 1️⃣5️⃣ Cost Model (Why This Is Efficient)

You pay for:

* SQS requests
* Lambda execution

You do NOT pay for:

* Idle workers
* Polling servers

Queues are extremely cheap.

---

## 1️⃣6️⃣ Common Mistakes (VERY IMPORTANT)

❌ Forgetting to delete message
❌ Visibility timeout too short
❌ No DLQ configured
❌ Assuming exactly-once delivery
❌ Heavy processing in Lambda

---

## 1️⃣7️⃣ AWS Exam Points (MUST REMEMBER)

* SQS decouples systems
* Lambda polls SQS automatically
* Visibility timeout prevents duplicates
* DLQ handles poison messages
* At-least-once delivery
* Serverless & scalable

---

## 1️⃣8️⃣ Mental Model (REMEMBER FOREVER)

```
SQS = Waiting room
Lambda = Worker
```

Workers come and go.
Messages wait safely.

---

## 1️⃣9️⃣ Why This Lab Is ESSENTIAL

This lab teaches:
✔ Reliability
✔ Scalability
✔ Fault tolerance
✔ Real enterprise architecture

Without queues:

* Systems break under load

---
