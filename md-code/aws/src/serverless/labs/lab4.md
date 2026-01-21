<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

# 🧪 HANDS-ON 4

## Scheduled & Rule-Based Serverless Jobs

### (Amazon EventBridge → AWS Lambda)

This lab shows how **Lambda runs automatically on a schedule or event rule**, without any server running.

---

## 1️⃣ What You Are Building (Big Picture)

You are building a **serverless scheduled job**.

> **Lambda runs automatically at a fixed time or interval.**

No EC2
No cron server
No background process

---

### 🏗 Architecture

```
Amazon EventBridge (Rule / Schedule)
 ↓
AWS Lambda
 ↓
Perform Task (cleanup, report, notification)
```

---

## 2️⃣ Why This Lab Is VERY Important

This lab teaches:

✔ Time-based execution
✔ Rule-based execution
✔ Automation without servers
✔ Cost-effective cron replacement
✔ Real operational use cases

Almost every production system needs **scheduled jobs**.

---

## 3️⃣ Real-World Use Cases (Very Practical)

You’ll see this pattern in:

* Daily report generation
* Database cleanup
* Log archival
* Sending reminders
* Monitoring & alerts
* Cost optimization jobs

---

## 4️⃣ What Is Amazon EventBridge?

**Amazon EventBridge** is a **serverless event bus service**.

It:

* Receives events
* Matches them against rules
* Sends them to targets (Lambda, SQS, SNS)

---

## 5️⃣ Two Ways EventBridge Triggers Lambda

### 1️⃣ Scheduled Rules (Cron / Rate)

Example:

* Every day at 9 AM
* Every 5 minutes

### 2️⃣ Event-Based Rules

Example:

* EC2 state change
* S3 event
* AWS service event

📌 In this lab, we focus on **Scheduled Rules**.

---

## 6️⃣ Step-by-Step Flow (VERY IMPORTANT)

Let’s walk through **exact execution flow**.

---

### 🟢 Step 1: EventBridge Schedule Triggers

EventBridge rule:

```
Rate(5 minutes)
```

or

```
Cron(0 9 * * ? *)
```

At the scheduled time:

* EventBridge creates an event

---

### 🟢 Step 2: EventBridge Sends Event to Lambda

EventBridge:

* Invokes Lambda asynchronously
* No client involved

---

### 🟢 Step 3: Lambda Receives Event

Lambda receives:

* Event metadata
* Schedule information
* Timestamp

Lambda does **not care** who triggered it.

---

### 🟢 Step 4: Lambda Executes Task

Lambda performs task:

* Cleanup old data
* Generate report
* Send notification
* Call APIs

---

### 🟢 Step 5: Lambda Stops

Execution finishes.
No idle compute.
No waiting.

---

## 7️⃣ Key Concept: Asynchronous Invocation

EventBridge invokes Lambda:

* Asynchronously
* With retries on failure

Client does NOT wait for response.

---

## 8️⃣ Cron vs Rate Expressions (Exam Important)

### 🔹 Rate Expression

Example:

```
rate(10 minutes)
```

* Simple
* Repeating interval

---

### 🔹 Cron Expression

Example:

```
cron(0 2 * * ? *)
```

* Complex schedules
* Specific time/date

📌 EventBridge cron is **different from Linux cron** (6 fields).

---

## 9️⃣ IAM Permissions (Very Important)

### Who needs permission?

#### 🔹 EventBridge

* Permission to invoke Lambda

#### 🔹 Lambda

* Permission to access resources it uses

IAM is handled automatically in most cases, but conceptually:

* Service-to-service trust is required

---

## 🔟 Failure Handling & Retries

If Lambda fails:

* EventBridge retries automatically
* Retries are limited

Best practice:

* Use DLQ (SQS)
* Add idempotent logic

---

## 1️⃣1️⃣ Scaling Behavior

If:

* Rule triggers once → 1 Lambda execution
* Multiple rules → multiple executions

No scaling configuration needed.

---

## 1️⃣2️⃣ Cost Model (Why This Is Cheap)

You pay for:

* Lambda execution time
* EventBridge rule (very cheap)

You do NOT pay for:

* Running cron servers
* Idle EC2

Perfect for:
✔ Automation
✔ Maintenance jobs

---

## 1️⃣3️⃣ EventBridge vs CloudWatch Events

📌 Important exam point:

* **CloudWatch Events = Old name**
* **EventBridge = New service**

They are functionally similar, but:

> EventBridge is the modern, recommended service.

---

## 1️⃣4️⃣ Common Mistakes (VERY IMPORTANT)

❌ Thinking Lambda runs continuously
❌ Using EC2 for cron jobs
❌ Wrong cron expression
❌ No DLQ for failures
❌ Hardcoding time logic in Lambda

---

## 1️⃣5️⃣ AWS Exam Points (MUST REMEMBER)

* EventBridge triggers Lambda
* Supports cron & rate
* Serverless scheduler
* Asynchronous invocation
* Cost-effective automation

---

## 1️⃣6️⃣ Mental Model (REMEMBER FOREVER)

```
EventBridge = Alarm clock
Lambda = Worker
```

When alarm rings → Lambda wakes up.

---

## 1️⃣7️⃣ Why This Lab Matters

This lab teaches:
✔ Automation
✔ Time-based execution
✔ Zero-server scheduling
✔ Operational excellence

---
