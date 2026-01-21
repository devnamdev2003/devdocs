<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)


- [🔐 NACL vs Security Group (SG) – FULL PACKET FLOW EXPLAINED](#-nacl-vs-security-group-sg--full-packet-flow-explained)
  - [1️⃣ First, the Core Difference (Must Remember)](#1️⃣-first-the-core-difference-must-remember)
  - [2️⃣ Where NACL and SG Sit in AWS Networking](#2️⃣-where-nacl-and-sg-sit-in-aws-networking)
    - [🔁 Actual AWS Traffic Flow Order](#-actual-aws-traffic-flow-order)
  - [3️⃣ NACL vs SG – High-Level Comparison](#3️⃣-nacl-vs-sg--high-level-comparison)
  - [4️⃣ What “Stateful” vs “Stateless” REALLY Means](#4️⃣-what-stateful-vs-stateless-really-means)
    - [🔹 Stateless (NACL)](#-stateless-nacl)
    - [🔹 Stateful (Security Group)](#-stateful-security-group)
  - [5️⃣ FULL PACKET FLOW – Public Web Server Example](#5️⃣-full-packet-flow--public-web-server-example)
    - [🧩 Setup](#-setup)
  - [6️⃣ PACKET FLOW: Client → EC2 (Inbound Traffic)](#6️⃣-packet-flow-client--ec2-inbound-traffic)
    - [🌍 Step 1: Client Sends Request](#-step-1-client-sends-request)
    - [🌐 Step 2: Internet Gateway (IGW)](#-step-2-internet-gateway-igw)
    - [🛣 Step 3: Route Table](#-step-3-route-table)
    - [🔐 Step 4: NACL (Inbound Rule Check)](#-step-4-nacl-inbound-rule-check)
    - [🔐 Step 5: Security Group (Inbound Rule Check)](#-step-5-security-group-inbound-rule-check)
    - [🖥 Step 6: EC2 Receives Request](#-step-6-ec2-receives-request)
  - [7️⃣ PACKET FLOW: EC2 → Client (Outbound Response)](#7️⃣-packet-flow-ec2--client-outbound-response)
    - [🖥 Step 7: EC2 Sends Response](#-step-7-ec2-sends-response)
    - [🔐 Step 8: Security Group (Outbound Check)](#-step-8-security-group-outbound-check)
    - [🔐 Step 9: NACL (Outbound Rule Check)](#-step-9-nacl-outbound-rule-check)
    - [🌐 Step 10: IGW Sends Response to Internet](#-step-10-igw-sends-response-to-internet)
  - [8️⃣ REQUIRED RULES SUMMARY (VERY IMPORTANT)](#8️⃣-required-rules-summary-very-important)
    - [✅ Security Group Rules](#-security-group-rules)
    - [✅ NACL Rules](#-nacl-rules)
  - [9️⃣ What Happens If One Rule Is Missing?](#9️⃣-what-happens-if-one-rule-is-missing)
    - [❌ Missing NACL outbound ephemeral ports](#-missing-nacl-outbound-ephemeral-ports)
    - [❌ Missing SG inbound rule](#-missing-sg-inbound-rule)
    - [❌ Missing NACL inbound rule](#-missing-nacl-inbound-rule)
  - [🔟 FULL PACKET FLOW – Private EC2 with NAT Gateway](#-full-packet-flow--private-ec2-with-nat-gateway)
    - [🧩 Setup](#-setup-1)
    - [Flow](#flow)
  - [1️⃣1️⃣ NACL vs SG – Decision Rule (EXAM GOLD)](#1️⃣1️⃣-nacl-vs-sg--decision-rule-exam-gold)
  - [1️⃣2️⃣ Common AWS Exam Traps](#1️⃣2️⃣-common-aws-exam-traps)
  - [1️⃣3️⃣ Mental Model (REMEMBER THIS)](#1️⃣3️⃣-mental-model-remember-this)
  - [1️⃣4️⃣ One-Line Exam Definitions](#1️⃣4️⃣-one-line-exam-definitions)
    - [NACL](#nacl)
    - [Security Group](#security-group)
  - [1️⃣5️⃣ Final Summary (Must Remember)](#1️⃣5️⃣-final-summary-must-remember)


# 🔐 NACL vs Security Group (SG) – FULL PACKET FLOW EXPLAINED

---

## 1️⃣ First, the Core Difference (Must Remember)

> **NACL works at the subnet level and is stateless, while Security Group works at the instance level and is stateful.**

Everything else comes from this.

---

## 2️⃣ Where NACL and SG Sit in AWS Networking

Let’s first fix the **order of traffic flow**, because this is where most confusion happens.

### 🔁 Actual AWS Traffic Flow Order

```
Internet
 ↓
Internet Gateway (IGW)
 ↓
Route Table (decides path)
 ↓
NACL (Subnet-level firewall)
 ↓
Security Group (Instance-level firewall)
 ↓
EC2 Instance
```

📌 **Both NACL and SG must allow traffic**
If **either blocks**, traffic is blocked.

---

## 3️⃣ NACL vs SG – High-Level Comparison

| Feature         | NACL                          | Security Group        |
| --------------- | ----------------------------- | --------------------- |
| Level           | Subnet                        | Instance              |
| Stateful        | ❌ No                          | ✅ Yes                 |
| Allow rules     | ✅ Yes                         | ✅ Yes                 |
| Deny rules      | ✅ Yes                         | ❌ No                  |
| Rule order      | Numbered (evaluated in order) | No order              |
| Default inbound | Allow all (default NACL)      | Deny all              |
| Return traffic  | Must be explicitly allowed    | Automatically allowed |

---

## 4️⃣ What “Stateful” vs “Stateless” REALLY Means

### 🔹 Stateless (NACL)

> NACL does **NOT remember** traffic.

If a request is allowed **in**, the response is **NOT automatically allowed**.

You must allow:

* Request
* Response
  **Both directions**

---

### 🔹 Stateful (Security Group)

> Security Group **remembers** traffic.

If a request is allowed:

* Response is automatically allowed
* No extra rule needed

---

## 5️⃣ FULL PACKET FLOW – Public Web Server Example

Let’s take a **real scenario**.

### 🧩 Setup

* VPC: `10.0.0.0/16`
* Public Subnet: `10.0.1.0/24`
* EC2 private IP: `10.0.1.10`
* EC2 public IP: `54.12.34.56`
* Website running on **port 80**

---

## 6️⃣ PACKET FLOW: Client → EC2 (Inbound Traffic)

### 🌍 Step 1: Client Sends Request

```
Client IP: 203.0.113.5
Client Port: 53000 (ephemeral)
Destination IP: 54.12.34.56
Destination Port: 80
Protocol: TCP
```

---

### 🌐 Step 2: Internet Gateway (IGW)

* IGW maps:

```
54.12.34.56 → 10.0.1.10
```

IGW does **NOT filter traffic**.

---

### 🛣 Step 3: Route Table

* Route table confirms destination subnet
* Traffic forwarded internally

---

### 🔐 Step 4: NACL (Inbound Rule Check)

NACL checks **inbound rules**:

Required NACL inbound rule:

```
Allow TCP 80 from 0.0.0.0/0
```

✔ If allowed → packet continues
❌ If denied → packet dropped here

---

### 🔐 Step 5: Security Group (Inbound Rule Check)

Security Group checks inbound rules:

Required SG inbound rule:

```
Allow TCP 80 from 0.0.0.0/0
```

✔ Allowed → packet reaches EC2
❌ Denied → packet dropped

---

### 🖥 Step 6: EC2 Receives Request

EC2 processes HTTP request.

---

## 7️⃣ PACKET FLOW: EC2 → Client (Outbound Response)

Now comes the **MOST IMPORTANT PART**.

---

### 🖥 Step 7: EC2 Sends Response

```
Source IP: 10.0.1.10
Source Port: 80
Destination IP: 203.0.113.5
Destination Port: 53000
```

---

### 🔐 Step 8: Security Group (Outbound Check)

Here is where **stateful behavior** matters.

👉 Because inbound traffic was allowed:

* Response traffic is **automatically allowed**
* No outbound rule needed

✔ SG allows response automatically

---

### 🔐 Step 9: NACL (Outbound Rule Check)

Since NACL is **stateless**, it checks outbound rules.

You MUST have:

```
Allow TCP 1024–65535 to 0.0.0.0/0
```

Why?

* Client port = 53000 (ephemeral)

❌ If missing → response blocked
✔ If present → response allowed

---

### 🌐 Step 10: IGW Sends Response to Internet

IGW maps private IP back to public IP.

Client receives website response.

---

## 8️⃣ REQUIRED RULES SUMMARY (VERY IMPORTANT)

### ✅ Security Group Rules

Inbound:

```
TCP 80 from 0.0.0.0/0
```

Outbound:

```
Allow all (default)
```

---

### ✅ NACL Rules

Inbound:

```
Allow TCP 80 from 0.0.0.0/0
Allow TCP 1024–65535 from 0.0.0.0/0
```

Outbound:

```
Allow TCP 80 to 0.0.0.0/0
Allow TCP 1024–65535 to 0.0.0.0/0
```

📌 **Ephemeral ports are mandatory in NACLs**

---

## 9️⃣ What Happens If One Rule Is Missing?

### ❌ Missing NACL outbound ephemeral ports

* Request reaches EC2
* Response blocked
* Browser hangs

### ❌ Missing SG inbound rule

* Packet blocked at instance
* No response

### ❌ Missing NACL inbound rule

* Packet blocked before reaching EC2

---

## 🔟 FULL PACKET FLOW – Private EC2 with NAT Gateway

Let’s quickly understand **private subnet flow**.

---

### 🧩 Setup

* Private subnet
* EC2 has **no public IP**
* NAT Gateway in public subnet

---

### Flow

```
EC2 → SG → NACL → Route Table → NAT Gateway → IGW → Internet
```

Return traffic:

```
Internet → IGW → NAT → Route Table → NACL → SG → EC2
```

📌 NACL must allow:

* Outbound ephemeral ports
* Inbound ephemeral ports

📌 SG auto-allows response traffic

---

## 1️⃣1️⃣ NACL vs SG – Decision Rule (EXAM GOLD)

| Requirement           | Use            |
| --------------------- | -------------- |
| Instance-level access | Security Group |
| Subnet-wide blocking  | NACL           |
| Explicit deny         | NACL           |
| Stateful control      | Security Group |
| Simple management     | Security Group |

---

## 1️⃣2️⃣ Common AWS Exam Traps

❓ SG allows traffic but app not reachable
➡ NACL blocking

❓ Return traffic blocked
➡ Missing ephemeral ports in NACL

❓ Want to block a single IP
➡ NACL (SG cannot deny)

❓ Multiple SGs attached
➡ Rules are combined (OR logic)

---

## 1️⃣3️⃣ Mental Model (REMEMBER THIS)

```
NACL = Border control (stateless)
SG   = Door lock (stateful)
```

---

## 1️⃣4️⃣ One-Line Exam Definitions

### NACL

> A stateless subnet-level firewall that controls inbound and outbound traffic using allow and deny rules.

### Security Group

> A stateful instance-level firewall that allows traffic and automatically permits response traffic.

---

## 1️⃣5️⃣ Final Summary (Must Remember)

* NACL is checked **before** SG
* NACL is stateless → allow both directions
* SG is stateful → return traffic automatic
* Both must allow traffic
* Ephemeral ports are key for NACLs

---
