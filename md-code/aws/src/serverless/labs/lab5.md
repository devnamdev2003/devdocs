<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

# 🧪 HANDS-ON 5

## Secure Serverless Compute

### (AWS Lambda + VPC + Security Groups + Secrets Manager)

This lab teaches you how **real companies run Lambda securely**.

---

## 1️⃣ What You Are Building (Big Picture)

You are building a Lambda function that:

> **Runs inside a private VPC and securely accesses a private resource (DB / service) using secrets.**

No public exposure.
No hardcoded credentials.

---

### 🏗 Architecture

```
Client / Event
 ↓
AWS Lambda (inside VPC)
 ↓
Security Group
 ↓
Private Resource (RDS / EC2 / internal API)
 ↑
AWS Secrets Manager
```

---

## 2️⃣ Why This Lab Is VERY IMPORTANT

This lab teaches:

✔ Lambda inside VPC
✔ Private networking
✔ Security Groups with Lambda
✔ Secrets management
✔ Enterprise security patterns
✔ Cold start trade-offs

📌 **This is how real production systems work.**

---

## 3️⃣ The Core Problem This Lab Solves

### 🔴 Problem 1: Lambda Is Public by Default

By default:

* Lambda runs outside your VPC
* It can access public AWS services
* It cannot access **private resources**

---

### 🔴 Problem 2: Credentials Must Be Secure

Hardcoding:

```txt
DB_PASSWORD=admin123
```

❌ Security risk
❌ Compliance violation
❌ Exam trap

---

### ✅ Solution

* Put Lambda **inside VPC**
* Use **Security Groups**
* Store secrets in **Secrets Manager**

---

## 4️⃣ Key Concept: Lambda Inside a VPC

### What does this really mean?

When Lambda runs in a VPC:

* AWS creates **ENIs (Elastic Network Interfaces)**
* Lambda attaches to your subnets
* Lambda follows **VPC networking rules**

📌 Lambda behaves like an EC2 **network-wise** (not compute-wise).

---

## 5️⃣ Networking Setup (CRITICAL)

### Typical Secure Setup

| Component        | Placement      |
| ---------------- | -------------- |
| Lambda           | Private Subnet |
| Database         | Private Subnet |
| NAT Gateway      | Public Subnet  |
| Internet Gateway | VPC            |

---

### Why Private Subnet?

Because:

* Lambda should not be directly exposed
* DB must not be public
* Security best practice

---

## 6️⃣ Full Execution Flow (VERY IMPORTANT)

Let’s go step by step.

---

### 🟢 Step 1: Lambda Is Triggered

Trigger could be:

* API Gateway
* EventBridge
* SQS
* S3

Trigger does NOT change networking behavior.

---

### 🟢 Step 2: Lambda Gets ENI in VPC

AWS:

* Creates ENI in your subnet
* Assigns private IP
* Attaches Security Group

This is transparent to you.

---

### 🟢 Step 3: Lambda Fetches Secret

Lambda:

* Calls AWS Secrets Manager
* Uses IAM role
* Retrieves credentials securely

📌 No password in code
📌 No config file

---

### 🟢 Step 4: Lambda Connects to Private Resource

Lambda:

* Uses private IP
* Security Group allows access
* DB / service accepts connection

---

### 🟢 Step 5: Lambda Completes Execution

* Connection closes
* Execution ends
* No server remains

---

## 7️⃣ Security Groups with Lambda (VERY IMPORTANT)

### Security Group Rules

Lambda SG:

```
Outbound → DB port (e.g. 3306)
```

Database SG:

```
Inbound → from Lambda SG
```

📌 **Security Group to Security Group reference**
(best practice, no IPs).

---

## 8️⃣ Secrets Manager (CRITICAL SECURITY CONCEPT)

### Why Secrets Manager?

It:

* Stores credentials securely
* Encrypts secrets
* Rotates secrets automatically
* Integrates with IAM

---

### What Secrets Are Stored?

* DB username/password
* API keys
* Tokens
* Certificates

---

### How Lambda Accesses Secrets

```
Lambda
 ↓
IAM Role
 ↓
Secrets Manager
```

IAM policy example:

* `secretsmanager:GetSecretValue`

---

## 9️⃣ IAM Role Design (Exam Important)

Lambda execution role needs:

✔ Access to Secrets Manager
✔ Access to logs (CloudWatch)
✔ Access to other AWS services

❌ Never store credentials in environment variables (unless encrypted)

---

## 🔟 Internet Access from VPC Lambda (BIG EXAM TRAP)

### ❓ Can Lambda access internet inside VPC?

❌ NOT by default

---

### ✅ How to Enable Internet Access

```
Lambda (Private Subnet)
 ↓
NAT Gateway
 ↓
Internet Gateway
```

📌 **NAT Gateway is required**
📌 **This increases cost**

---

## 1️⃣1️⃣ Cold Start Impact (VERY IMPORTANT)

Lambda in VPC:

* Needs ENI creation
* Cold starts are **slower**

Mitigation:

* Provisioned concurrency
* Keep function warm
* Avoid VPC unless required

---

## 1️⃣2️⃣ Cost Implications (Real World)

Additional costs:

* NAT Gateway hourly cost
* NAT data processing cost

📌 Many “expensive Lambda” problems are actually **NAT Gateway costs**.

---

## 1️⃣3️⃣ Common Enterprise Use Cases

* Lambda → RDS
* Lambda → internal microservice
* Lambda → private API
* Secure backend processing

---

## 1️⃣4️⃣ Common Mistakes (VERY IMPORTANT)

❌ Hardcoding secrets
❌ Using public DB
❌ Missing SG rules
❌ Forgetting NAT for internet access
❌ Overusing VPC Lambda

---

## 1️⃣5️⃣ AWS Exam Points (MUST REMEMBER)

* Lambda can run inside VPC
* Uses ENIs
* Security Groups apply to Lambda
* Secrets Manager for credentials
* NAT Gateway needed for internet
* VPC increases cold start time

---

## 1️⃣6️⃣ Mental Model (REMEMBER FOREVER)

```
Lambda in VPC = Secure employee inside office
Secrets Manager = Locker with keys
Security Group = Door access rules
```

---

## 1️⃣7️⃣ Why This Lab Completes Serverless Mastery

After all 5 labs, you now understand:

✔ APIs
✔ Events
✔ Async processing
✔ Scheduling
✔ Security & networking

👉 **This is full serverless compute coverage**.


