<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../../)

# 🧪 HANDS-ON 1

## Serverless REST API

### (API Gateway + Lambda + DynamoDB)

This is the **MOST IMPORTANT serverless lab**.
If you understand this, **80% of serverless concepts are clear**.

---

## 1️⃣ What You Are Building (Big Picture)

You are building a **fully serverless backend API**.

### Example use case

A simple **User / Expense / Todo API**:

* Create data
* Read data

No servers. No EC2. No load balancer.

---

### 🏗 Architecture

```
Client (Browser / Postman)
 ↓
API Gateway (HTTP endpoint)
 ↓
Lambda (business logic)
 ↓
DynamoDB (database)
```

---

## 2️⃣ Why This Architecture Is Important

This architecture teaches you:

✔ How HTTP requests reach Lambda
✔ How Lambda handles business logic
✔ How data is stored (stateless Lambda)
✔ How IAM permissions work
✔ How real production serverless APIs are built

This is **industry standard**.

---

## 3️⃣ Services Used & WHY

### 🔹 API Gateway

* Gives a **public HTTP endpoint**
* Handles request/response
* Protects Lambda from abuse

### 🔹 AWS Lambda

* Runs backend code
* No server management
* Auto scales

### 🔹 DynamoDB

* Serverless database
* Scales automatically
* Perfect for Lambda (low latency)

### 🔹 IAM

* Controls permissions
* Lambda → DynamoDB access

---

## 4️⃣ What API We Will Build (Simple & Clear)

### Endpoints

| Method | Path          | Action      |
| ------ | ------------- | ----------- |
| POST   | `/items`      | Create item |
| GET    | `/items/{id}` | Get item    |

---

## 5️⃣ Step-by-Step Build Flow (Conceptual)

Don’t rush — **understand the flow first**.

---

### 🔁 Full Request Flow

1. Client sends HTTP request
2. API Gateway receives it
3. API Gateway triggers Lambda
4. Lambda runs code
5. Lambda reads/writes DynamoDB
6. Lambda returns response
7. API Gateway sends HTTP response

---

## 6️⃣ Step 1: Create DynamoDB Table (Concept)

### Why first?

Because:

* Lambda is stateless
* We need a place to store data

---

### Table Design (Simple)

| Attribute | Purpose              |
| --------- | -------------------- |
| `id`      | Primary Key (string) |
| `data`    | Stored content       |

📌 DynamoDB is **schema-less**
You define only the key.

---

## 7️⃣ Step 2: Create IAM Role for Lambda

### Why IAM Role is REQUIRED

Lambda:

* Has **no permissions by default**
* Must be allowed to access DynamoDB

---

### IAM Role Concept

```
Lambda Function
 ↓ (assume role)
IAM Role
 ↓
DynamoDB permissions
```

---

### Permissions Needed

* `PutItem`
* `GetItem`

📌 **Least privilege principle**
Only allow what is needed.

---

## 8️⃣ Step 3: Create Lambda Function (Core Logic)

### Lambda’s Job

Lambda will:

* Read HTTP request
* Decide what to do (GET or POST)
* Talk to DynamoDB
* Return response

---

### Lambda Input (Event Object)

Lambda receives:

* HTTP method
* Path parameters
* Body

Example:

```
POST /items
{
  "id": "101",
  "data": "hello"
}
```

---

### Lambda Output

Lambda returns:

* Status code
* Response body

Example:

```
200 OK
{
  "message": "Item saved"
}
```

---

## 9️⃣ Step 4: Connect API Gateway to Lambda

### Why API Gateway?

Because:

* Lambda cannot be accessed directly by browser
* API Gateway acts as **front door**

---

### Integration Concept

```
HTTP Request
 ↓
API Gateway
 ↓
Lambda Invoke
```

API Gateway:

* Converts HTTP → Lambda event
* Converts Lambda response → HTTP

---

## 🔟 Security Flow (VERY IMPORTANT)

### Who calls what?

| Component            | Access       |
| -------------------- | ------------ |
| Client → API Gateway | Public       |
| API Gateway → Lambda | AWS internal |
| Lambda → DynamoDB    | IAM role     |

📌 Client NEVER touches DynamoDB directly.

---

## 1️⃣1️⃣ Stateless Design (Key Serverless Concept)

Lambda:

* Does NOT remember previous requests
* Each request is independent

State is stored in:

* DynamoDB

This is **mandatory** for scaling.

---

## 1️⃣2️⃣ Scaling Behavior (Automatic)

If:

* 1 request → 1 Lambda execution
* 1000 requests → 1000 executions

You do:
❌ No scaling config
❌ No load balancer

AWS handles everything.

---

## 1️⃣3️⃣ Cost Model (Why This Is Cheap)

You pay for:

* API requests
* Lambda execution time
* DynamoDB usage

You do NOT pay for:

* Idle servers
* Load balancers
* OS

Perfect for:

* Startups
* Side projects
* APIs with spikes

---

## 1️⃣4️⃣ Common Mistakes (VERY IMPORTANT)

❌ Forgetting IAM permission
❌ Expecting Lambda to store state
❌ Forgetting to return proper HTTP response
❌ Not handling JSON parsing
❌ Using EC2 mindset

---

## 1️⃣5️⃣ AWS Exam Points (MUST REMEMBER)

* API Gateway + Lambda = serverless API
* Lambda is stateless
* DynamoDB is ideal for Lambda
* IAM role required for service access
* Auto scaling is built-in

---

## 1️⃣6️⃣ Mental Model (REMEMBER FOREVER)

```
API Gateway = Front door
Lambda      = Brain
DynamoDB    = Memory
```

---

## 1️⃣7️⃣ Why This Lab Covers “Almost Everything”

This single lab teaches:

✔ Serverless compute
✔ Event-driven execution
✔ IAM & security
✔ HTTP APIs
✔ Stateless architecture
✔ Scaling & cost

That’s why it’s **Lab #1**.

---
