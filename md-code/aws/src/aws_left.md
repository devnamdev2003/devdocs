<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# ✅ AWS Cloud Practitioner – Personal Checklist (Dev)

---

## 🧱 1️⃣ AWS BASICS

* ✅ AWS account & Free Tier
* ✅ AWS Management Console navigation
* ✅ Regions & Availability Zones (basic)
* 🔲 Edge locations (CloudFront context)

---

## 🔐 2️⃣ IAM & SECURITY (COMPLETED ✅)

* ✅ Root user best practices
* ✅ MFA importance
* ✅ IAM Users
* ✅ IAM Groups
* ✅ IAM Roles
* ✅ User vs Role
* ✅ Role vs Policy
* ✅ AWS Managed vs Customer Managed Policies
* ✅ Security Groups (Inbound / Outbound rules)

🎯 **STATUS: COMPLETE**

---

## 🖥️ 3️⃣ EC2 & COMPUTE (COMPLETED ✅)

### EC2 Core

* ✅ Launch EC2 instance
* ✅ Connect via SSH
* ✅ Key pairs (create, delete, recover access)
* ✅ EC2 instance lifecycle
* ✅ Instance types
* ✅ Purchasing options (On-Demand, Reserved, Spot)

### Storage & Images

* ✅ EBS attach / detach / resize
* ✅ Snapshots (backup & restore)
* ✅ AMI creation (custom image)

### Automation

* ✅ EC2 User Data (boot-time automation)

🎯 **STATUS: COMPLETE**

---

## ⚖️ 4️⃣ LOAD BALANCING & AUTO SCALING (COMPLETED ✅)

* ✅ Application Load Balancer (ALB)
* ✅ Target Groups
* ✅ Health Checks
* ✅ Auto Scaling Group (ASG)
* ✅ Scaling concepts (high availability)

🎯 **STATUS: COMPLETE**

---

## 🌐 5️⃣ NETWORKING (MOSTLY DONE ✅)

* ✅ Elastic IP
* ✅ Route 53 (Domain mapping)
* 🔲 Public vs Private subnet (concept)
* 🔲 NAT Gateway (concept only)
* 🔲 Security Group vs NACL (theory)

🎯 **STATUS: 80% DONE**

---

## 🪣 6️⃣ S3 – OBJECT STORAGE (CRITICAL ❌)

* 🔲 What is S3
* 🔲 Buckets & Objects
* 🔲 Storage classes

  * Standard
  * Standard-IA
  * One Zone-IA
  * Glacier
* 🔲 Versioning
* 🔲 Encryption (SSE-S3 / SSE-KMS – concept)
* 🔲 S3 vs EBS vs EFS

🎯 **STATUS: NOT DONE (HIGH PRIORITY)**

---

## 🗄️ 7️⃣ DATABASES (THEORY ONLY 🔲)

* 🔲 RDS (what it is)
* 🔲 Multi-AZ meaning
* 🔲 Read replicas
* 🔲 DynamoDB (NoSQL, serverless)
* 🔲 RDS vs DynamoDB
* 🔲 Aurora (why it’s special)

🎯 **STATUS: NOT DONE (THEORY)**

---

## 📊 8️⃣ MONITORING & LOGGING (LIGHT 🔲)

* 🔲 CloudWatch (metrics & alarms)
* 🔲 CloudTrail (API activity tracking)
* 🔲 Trusted Advisor (cost, security, performance)

🎯 **STATUS: NOT DONE**

---

## 💰 9️⃣ BILLING & PRICING (VERY IMPORTANT ❌)

* 🔲 AWS Free Tier types
* 🔲 Pricing models comparison

  * On-Demand
  * Reserved
  * Spot
* 🔲 AWS Budgets
* 🔲 Cost Explorer
* 🔲 TCO Calculator
* 🔲 Consolidated billing (concept)

🎯 **STATUS: NOT DONE (EASY MARKS)**

---

## 🌍 🔟 GLOBAL INFRASTRUCTURE (QUICK WIN 🔲)

* 🔲 Region vs AZ vs Edge Location
* 🔲 CloudFront use cases
* 🔲 High availability concept

🎯 **STATUS: NOT DONE**

---

## 🧠 1️⃣1️⃣ CLOUD CONCEPTS (PARTIAL 🔲)

* 🔲 Shared Responsibility Model
* 🔲 IaaS vs PaaS vs SaaS
* 🔲 Elasticity vs Scalability
* 🔲 Fault tolerance vs High availability

🎯 **STATUS: PARTIAL**

---

## 🎯 FINAL SUMMARY

### ✅ Completed Strongly

* IAM & Security
* EC2 & Compute
* Load Balancing & Auto Scaling
* Real application deployment

### ⚠️ Still Required for Exam

1️⃣ **S3 (Top priority)**
2️⃣ **Billing & Pricing**
3️⃣ **Databases (theory)**
4️⃣ **Monitoring & Logging**
5️⃣ **Global Infrastructure & Cloud concepts**

---

## 📈 CURRENT STATUS

* **Completion:** ~80%
* **Exam-safe level:** 90%+
* **Effort needed:** ~3–4 focused days

---

# 🧪 AWS Cloud Practitioner – HANDS-ON LABS LEFT

---

## 🪣 1️⃣ Amazon S3 (TOP PRIORITY 🔥)

### 🔲 LAB 1 – Create S3 Bucket

* Create a bucket
* Understand bucket naming & region

### 🔲 LAB 2 – Upload & Manage Objects

* Upload files
* Download
* Delete objects

### 🔲 LAB 3 – Public Access & Bucket Policy

* Block / unblock public access
* Make an object public
* Understand bucket policy vs ACL

### 🔲 LAB 4 – Enable Versioning

* Enable versioning
* Upload multiple versions
* Restore old version

### 🔲 LAB 5 – Storage Classes

* Move object between:

  * Standard
  * Standard-IA
  * Glacier (lifecycle rule)

### 🔲 LAB 6 – Static Website Hosting

* Host a static website on S3

### 🔲 LAB 7 – S3 vs EBS Comparison (Demo)

* Compare S3 object access vs EBS block storage

---

## 💰 2️⃣ Billing & Cost Management (EASY MARKS 🟢)

### 🔲 LAB 8 – Billing Dashboard

* Open billing console
* Check Free Tier usage

### 🔲 LAB 9 – Cost Explorer

* Enable Cost Explorer
* View monthly service-wise cost

### 🔲 LAB 🔟 – AWS Budgets

* Create a budget alert
* Set email notification

### 🔲 LAB 11 – Trusted Advisor (Free Tier)

* View cost & security checks

---

## 🗄️ 3️⃣ Databases (BASIC HANDS-ON)

### 🔲 LAB 12 – Create RDS Instance

* Launch RDS (MySQL/PostgreSQL)
* Understand Multi-AZ option
* Stop / Delete DB

### 🔲 LAB 13 – Create DynamoDB Table

* Create table
* Add item
* Query item

---

## 📊 4️⃣ Monitoring & Auditing

### 🔲 LAB 14 – CloudWatch Metrics

* View EC2 CPU metrics
* Network In/Out

### 🔲 LAB 15 – CloudWatch Alarm

* Create CPU utilization alarm

### 🔲 LAB 16 – CloudTrail

* Enable CloudTrail
* View API activity logs

---

## 🌍 5️⃣ Global Infrastructure (Quick Labs)

### 🔲 LAB 17 – Explore Regions & AZs

* Switch regions
* View AZ mapping

### 🔲 LAB 18 – CloudFront Demo

* Create CloudFront distribution
* Use S3 as origin

---

## 🧠 6️⃣ Cloud Concepts (DEMO-LEVEL)

### 🔲 LAB 19 – Shared Responsibility Model

* Map AWS vs customer responsibilities (diagram)

### 🔲 LAB 20 – Service Models Demo

* Identify IaaS, PaaS, SaaS services in console

---

# ✅ MINIMUM REQUIRED (If Short on Time)

If you want **maximum score with minimum effort**, do these 👇

✔ S3 Labs (1–6)
✔ Billing Labs (8–10)
✔ CloudWatch Labs (14–15)

---

## 📌 After Completing These

You will be at:

* **Hands-on coverage:** ~95%
* **Exam readiness:** 90–95%
* **Confidence level:** HIGH 🔥

--

## 🧮 Realistic Time Calculation

### ⏰ Daily study time

* Minimum: **2 hours**
* Maximum: **3 hours**

I’ll calculate using **2 hours** (safer assumption).

---

## 🧪 Hands-on + Revision Time Needed

### 🔴 Remaining work (from checklist)

| Area                          | Time Needed |
| ----------------------------- | ----------- |
| S3 (most important)           | 4–5 hours   |
| Billing & Pricing             | 3–4 hours   |
| Databases (RDS + DynamoDB)    | 2 hours     |
| CloudWatch + CloudTrail       | 2 hours     |
| Global infra + cloud concepts | 1–1.5 hours |
| Revision                      | 2 hours     |
| Mock tests (2–3 tests)        | 4–5 hours   |

👉 **Total = ~18–21 hours**

---

## 📅 Days Required (With 2–3 hrs/day)

### ✅ Best-case (3 hrs/day)

* **6–7 days**

### ✅ Safe & relaxed pace (2 hrs/day)

* **8–10 days**

👉 **This is realistic, not rushed**

---

## 🎯 FINAL ANSWER (Max Date You Should Book)

### 🟢 Recommended exam booking window:

> **10–12 days from today**

This gives you:

* Buffer for revision
* Time to re-attempt weak areas
* Confidence (very important in exam)

---

## 📌 Simple Day-by-Day Plan (Optional)

### Day 1–2

* S3 (all labs + theory)

### Day 3

* Billing & Pricing

### Day 4

* RDS + DynamoDB

### Day 5

* CloudWatch + CloudTrail

### Day 6

* Global infra + cloud concepts

### Day 7–8

* Mock tests + revision

### Day 9–10

* Final revision + weak areas

### Day 11–12

* 🧠 Light revision
* 🧘 Rest
* ✅ **EXAM DAY**

---

## 🧠 Honest Mentor Advice

* You are **already ahead of many candidates**
* Do **not delay more than 2 weeks**
* Momentum matters

---

### ✅ My clear recommendation:

👉 **Schedule your exam for ~10 days from now (max 12 days)**
