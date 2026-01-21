<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../../)

# 🧪 HANDS-ON 2

## Event-Driven Processing

### (Amazon S3 → AWS Lambda)

This lab teaches you **true serverless behavior**:
👉 **code runs automatically when something happens**.

---

## 1️⃣ What You Are Building (Big Picture)

You are building an **automatic system** where:

> **Whenever a file is uploaded to S3, a Lambda function runs automatically.**

No API call.
No button click.
No server running.

---

### 🏗 Architecture

```
User / Application
 ↓ (Upload file)
Amazon S3 Bucket
 ↓ (Event notification)
AWS Lambda
 ↓
Process / Validate / Transform
```

---

## 2️⃣ Why This Lab Is VERY Important

This lab teaches:

✔ Event-driven architecture
✔ Asynchronous serverless execution
✔ Automation without APIs
✔ Real production use cases
✔ How AWS services talk to each other

This pattern is used **everywhere** in AWS.

---

## 3️⃣ Real-World Use Cases (Very Practical)

You’ll see this in real systems:

* Image resize after upload
* PDF validation
* Virus scanning
* Log processing
* Data ingestion pipelines
* File format conversion

---

## 4️⃣ Services Used & WHY

### 🔹 Amazon S3

* Stores files (objects)
* Triggers events automatically

### 🔹 AWS Lambda

* Runs code when event occurs
* No polling, no server

### 🔹 IAM

* Allows S3 to invoke Lambda
* Allows Lambda to read/write S3

---

## 5️⃣ Key Concept: Event-Driven ≠ API-Driven

### API-Driven

```
Client → API → Lambda
```

### Event-Driven

```
Event happens → Lambda runs
```

No client waits for response.

📌 **This is asynchronous processing**.

---

## 6️⃣ Step-by-Step Flow (CRITICAL)

Let’s walk through the **exact packet / event flow**.

---

### 🟢 Step 1: File Upload to S3

A file is uploaded:

* Via AWS Console
* CLI
* Application
* Lambda / EC2 / user

Example:

```
s3://my-bucket/uploads/image.jpg
```

---

### 🟢 Step 2: S3 Event Is Generated

S3 detects:

* ObjectCreated event

Examples:

* PUT
* POST
* Multipart upload

S3 creates an **event message**.

---

### 🟢 Step 3: S3 Triggers Lambda

S3:

* Sends event to Lambda
* Lambda is invoked asynchronously

📌 No retries from client
📌 S3 → Lambda is **internal AWS call**

---

### 🟢 Step 4: Lambda Receives Event Object

Lambda receives:

* Bucket name
* Object key (file path)
* File size
* Event type
* Timestamp

Lambda now knows:

> “Which file was uploaded, and where.”

---

### 🟢 Step 5: Lambda Processes the File

Lambda may:

* Read file from S3
* Validate content
* Resize image
* Rename file
* Store output in another bucket

---

### 🟢 Step 6: Lambda Finishes & Stops

* No server remains running
* No idle cost
* Execution ends

---

## 7️⃣ Lambda Event Object (Conceptual)

Lambda does NOT receive raw file.

It receives **metadata** like:

* Bucket name
* Object key

Lambda then:

* Uses AWS SDK
* Fetches file from S3 if needed

📌 **Important exam point**.

---

## 8️⃣ IAM Permissions (VERY IMPORTANT)

This lab teaches **service-to-service IAM**.

---

### Who needs permission to do what?

#### 🔹 S3 → Lambda

* S3 needs permission to **invoke Lambda**

#### 🔹 Lambda → S3

* Lambda needs permission to:

  * Read object
  * Write object

---

### IAM Role Flow

```
Lambda
 ↓ assumes
IAM Role
 ↓ allows
S3 access
```

Without IAM:
❌ Event fails
❌ Lambda errors

---

## 9️⃣ Stateless Nature (Reinforced)

Each file upload:

* Triggers a new Lambda execution
* No memory of previous files

State (if needed) stored in:

* S3
* DynamoDB

---

## 🔟 Scaling Behavior (Automatic & Powerful)

If:

* 1 file uploaded → 1 Lambda execution
* 1000 files uploaded → 1000 Lambda executions

AWS:
✔ Automatically scales
✔ No config needed

📌 **This is why serverless is powerful**.

---

## 1️⃣1️⃣ Error Handling (Important Concept)

### What if Lambda fails?

* S3 does NOT retry forever
* Lambda retries automatically (limited)
* Errors go to CloudWatch Logs

Best practice:

* Use DLQ (SQS or SNS)
* Add idempotent logic

---

## 1️⃣2️⃣ Cost Model (Why This Is Cheap)

You pay for:

* S3 storage
* Lambda execution time

You do NOT pay for:

* Idle compute
* Polling services

Event-driven systems are:
✔ Highly cost-efficient
✔ Scalable

---

## 1️⃣3️⃣ Common Mistakes (VERY IMPORTANT)

❌ Expecting Lambda to get file directly
❌ Forgetting IAM permission
❌ Processing very large files (> memory)
❌ Infinite loops (Lambda writes back to same bucket)

📌 **Avoid triggering Lambda from the same bucket path it writes to**.

---

## 1️⃣4️⃣ AWS Exam Points (MUST REMEMBER)

* S3 can trigger Lambda
* Event-driven architecture
* Asynchronous invocation
* Lambda receives metadata, not file
* IAM role required
* Auto scaling built-in

---

## 1️⃣5️⃣ Mental Model (REMEMBER FOREVER)

```
S3 = Event source
Lambda = Worker
```

Whenever S3 says:

> “Something happened”

Lambda replies:

> “I’ll handle it.”

---

## 1️⃣6️⃣ Why This Lab Is Essential

This lab teaches:
✔ Automation
✔ Event-driven thinking
✔ Real cloud workflows
✔ No API required

Many AWS systems are built like this.

---
