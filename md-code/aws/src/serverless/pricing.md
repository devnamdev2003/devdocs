<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)


- [💰 AWS Lambda Pricing – Complete Explanation](#-aws-lambda-pricing--complete-explanation)
  - [1️⃣ Big Picture: How AWS Lambda Charges You](#1️⃣-big-picture-how-aws-lambda-charges-you)
  - [2️⃣ What Exactly Do You Pay For?](#2️⃣-what-exactly-do-you-pay-for)
  - [3️⃣ Request Pricing (Invocation Cost)](#3️⃣-request-pricing-invocation-cost)
    - [What is a request?](#what-is-a-request)
    - [Free Tier (Very Important)](#free-tier-very-important)
    - [Example](#example)
  - [4️⃣ Duration Pricing (Execution Time)](#4️⃣-duration-pricing-execution-time)
    - [How Duration Is Measured](#how-duration-is-measured)
    - [What Affects Duration?](#what-affects-duration)
  - [5️⃣ Memory-Based Pricing (Key Concept)](#5️⃣-memory-based-pricing-key-concept)
  - [6️⃣ How AWS Calculates Duration Cost](#6️⃣-how-aws-calculates-duration-cost)
    - [Example 1️⃣](#example-1️⃣)
    - [AWS Price (approx)](#aws-price-approx)
  - [7️⃣ Free Tier for Duration](#7️⃣-free-tier-for-duration)
  - [8️⃣ Full Cost Example (Very Important)](#8️⃣-full-cost-example-very-important)
    - [Scenario](#scenario)
    - [Step 1: Request Cost](#step-1-request-cost)
    - [Step 2: Duration Cost](#step-2-duration-cost)
    - [💵 Total Monthly Cost](#-total-monthly-cost)
  - [9️⃣ Why Increasing Memory Can REDUCE Cost (Exam Favorite)](#9️⃣-why-increasing-memory-can-reduce-cost-exam-favorite)
    - [Example](#example-1)
  - [🔟 Lambda Pricing vs EC2 Pricing](#-lambda-pricing-vs-ec2-pricing)
    - [EC2](#ec2)
    - [Lambda](#lambda)
  - [1️⃣1️⃣ Additional Lambda-Related Costs (Important)](#1️⃣1️⃣-additional-lambda-related-costs-important)
  - [1️⃣2️⃣ Lambda Pricing with VPC (Hidden Cost)](#1️⃣2️⃣-lambda-pricing-with-vpc-hidden-cost)
  - [1️⃣3️⃣ Cost Optimization Best Practices](#1️⃣3️⃣-cost-optimization-best-practices)
  - [1️⃣4️⃣ Lambda Pricing in Exams (Key Points)](#1️⃣4️⃣-lambda-pricing-in-exams-key-points)
  - [1️⃣5️⃣ One-Line Exam Definition](#1️⃣5️⃣-one-line-exam-definition)
  - [1️⃣6️⃣ Mental Model to Remember Forever](#1️⃣6️⃣-mental-model-to-remember-forever)
  - [1️⃣7️⃣ Final Summary (Must Remember)](#1️⃣7️⃣-final-summary-must-remember)


# 💰 AWS Lambda Pricing – Complete Explanation

---

## 1️⃣ Big Picture: How AWS Lambda Charges You

AWS Lambda follows a **pay-per-use model**.

> **You pay only when your code runs.**

You do **NOT** pay for:

* Idle time
* Servers
* OS
* Scaling
* Availability

This is the **core advantage of serverless**.

---

## 2️⃣ What Exactly Do You Pay For?

Lambda pricing has **3 main components**:

1️⃣ **Number of requests**
2️⃣ **Execution duration (time)**
3️⃣ **Memory allocated (which also controls CPU)**

Let’s break each one slowly.

---

## 3️⃣ Request Pricing (Invocation Cost)

### What is a request?

Every time your Lambda function is triggered → **1 request**.

Triggers include:

* API Gateway call
* S3 upload
* Scheduled event
* SQS message

---

### Free Tier (Very Important)

AWS Free Tier includes:

* **1 million free requests per month**

After free tier:

* **$0.20 per 1 million requests**

📌 This is extremely cheap.

---

### Example

If your Lambda is invoked:

* 5 million times per month

Cost:

```
First 1 million → Free
Remaining 4 million → 4 × $0.20 = $0.80
```

✔ Less than 1 dollar

---

## 4️⃣ Duration Pricing (Execution Time)

This is the **most important part** of Lambda pricing.

---

### How Duration Is Measured

Lambda charges based on:

* **Execution time**
* Rounded to the **nearest millisecond**
* From function start → function end

---

### What Affects Duration?

* Code efficiency
* Memory allocated
* Cold starts
* External service calls

---

## 5️⃣ Memory-Based Pricing (Key Concept)

When you configure a Lambda function, you choose:

* Memory size (128 MB → 10,240 MB)

📌 **CPU power scales proportionally with memory**

So:

* More memory = more CPU = faster execution
* Faster execution can **reduce total cost**

---

## 6️⃣ How AWS Calculates Duration Cost

Lambda pricing unit:

> **GB-seconds**

Formula:

```
Memory (GB) × Execution time (seconds)
```

---

### Example 1️⃣

* Memory: 512 MB = 0.5 GB
* Execution time: 2 seconds

Cost unit:

```
0.5 × 2 = 1 GB-second
```

---

### AWS Price (approx)

* **$0.0000166667 per GB-second**

So:

```
1 GB-second × $0.0000166667
```

Very small cost.

---

## 7️⃣ Free Tier for Duration

AWS Free Tier also includes:

* **400,000 GB-seconds per month**

This is **a lot**.

Meaning:

* Small workloads often cost **$0**

---

## 8️⃣ Full Cost Example (Very Important)

Let’s calculate a **realistic Lambda cost**.

---

### Scenario

* Requests: 2 million/month
* Memory: 1024 MB (1 GB)
* Execution time: 500 ms (0.5 sec)

---

### Step 1: Request Cost

```
2M requests
1M free
1M paid → $0.20
```

---

### Step 2: Duration Cost

Per request:

```
1 GB × 0.5 sec = 0.5 GB-seconds
```

Total:

```
0.5 × 2,000,000 = 1,000,000 GB-seconds
```

Free tier:

```
400,000 GB-seconds free
```

Paid:

```
600,000 GB-seconds × $0.0000166667 ≈ $10
```

---

### 💵 Total Monthly Cost

```
$0.20 + $10 = ~$10.20
```

✔ For 2 million executions
✔ No servers
✔ Auto scaling

---

## 9️⃣ Why Increasing Memory Can REDUCE Cost (Exam Favorite)

This feels confusing at first.

### Example

| Memory  | Time    | Cost   |
| ------- | ------- | ------ |
| 512 MB  | 2 sec   | Higher |
| 1024 MB | 0.7 sec | Lower  |

Even though memory cost is higher:

* Execution is much faster
* Total GB-seconds reduced

📌 **Always benchmark memory vs duration**

---

## 🔟 Lambda Pricing vs EC2 Pricing

### EC2

* Pay per hour
* Pay even when idle
* Manual scaling

### Lambda

* Pay per execution
* Zero idle cost
* Automatic scaling

👉 Lambda is cheaper for:

* Spiky traffic
* Low/medium workloads
* Event-driven apps

---

## 1️⃣1️⃣ Additional Lambda-Related Costs (Important)

Lambda itself is cheap, but **other services may add cost**:

* API Gateway
* CloudWatch Logs
* NAT Gateway (if Lambda in VPC)
* Data transfer

📌 Exams often ask:

> “Why is Lambda suddenly expensive?”

Answer:
➡ **NAT Gateway data charges**

---

## 1️⃣2️⃣ Lambda Pricing with VPC (Hidden Cost)

If Lambda runs inside a VPC:

* Internet access requires NAT Gateway
* NAT Gateway is **expensive**

Best practice:

* Avoid VPC unless required
* Use VPC endpoints where possible

---

## 1️⃣3️⃣ Cost Optimization Best Practices

✔ Optimize memory size
✔ Reduce execution time
✔ Avoid unnecessary logs
✔ Use async processing
✔ Avoid NAT Gateway if possible
✔ Use caching (DynamoDB / Redis)

---

## 1️⃣4️⃣ Lambda Pricing in Exams (Key Points)

You must remember:

* Pay per request
* Pay per duration
* Memory affects CPU
* Free tier exists
* No cost when idle

---

## 1️⃣5️⃣ One-Line Exam Definition

> **AWS Lambda pricing is based on the number of requests and the execution duration measured in GB-seconds, with a generous free tier.**

---

## 1️⃣6️⃣ Mental Model to Remember Forever

```
Cost = How often × How long × How big
```

* How often → Requests
* How long → Duration
* How big → Memory

---

## 1️⃣7️⃣ Final Summary (Must Remember)

* Lambda is extremely cost-effective
* Pay only when code runs
* Memory and time decide cost
* Free tier covers most small apps
* NAT Gateway is the biggest hidden cost

---