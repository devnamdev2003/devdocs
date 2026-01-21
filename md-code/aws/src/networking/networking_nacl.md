<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🔐 Network Access Control Lists (NACLs) in AWS – Complete Deep Explanation](#-network-access-control-lists-nacls-in-aws--complete-deep-explanation)
  - [1️⃣ What is a NACL?](#1️⃣-what-is-a-nacl)
    - [Simple definition:](#simple-definition)
  - [2️⃣ Why NACLs Exist (The Core Purpose)](#2️⃣-why-nacls-exist-the-core-purpose)
  - [3️⃣ Where NACLs Sit in AWS Networking](#3️⃣-where-nacls-sit-in-aws-networking)
  - [4️⃣ Key Characteristics of NACLs (VERY IMPORTANT)](#4️⃣-key-characteristics-of-nacls-very-important)
  - [5️⃣ Stateless Nature of NACLs (MOST IMPORTANT CONCEPT)](#5️⃣-stateless-nature-of-nacls-most-important-concept)
    - [What does stateless mean?](#what-does-stateless-mean)
    - [Example (Very Important)](#example-very-important)
  - [6️⃣ Structure of a NACL Rule](#6️⃣-structure-of-a-nacl-rule)
  - [7️⃣ Rule Evaluation Order](#7️⃣-rule-evaluation-order)
  - [8️⃣ Default NACL vs Custom NACL](#8️⃣-default-nacl-vs-custom-nacl)
    - [🔹 Default NACL](#-default-nacl)
    - [🔹 Custom NACL](#-custom-nacl)
  - [9️⃣ NACL Association Rules](#9️⃣-nacl-association-rules)
  - [🔟 Inbound vs Outbound Rules (Clear Difference)](#-inbound-vs-outbound-rules-clear-difference)
    - [Inbound Rules](#inbound-rules)
    - [Outbound Rules](#outbound-rules)
  - [1️⃣1️⃣ Ephemeral Ports (CRITICAL for NACLs)](#1️⃣1️⃣-ephemeral-ports-critical-for-nacls)
    - [What are ephemeral ports?](#what-are-ephemeral-ports)
    - [Why they matter in NACLs](#why-they-matter-in-nacls)
  - [1️⃣2️⃣ Real Traffic Flow Example (Public Web Server)](#1️⃣2️⃣-real-traffic-flow-example-public-web-server)
    - [Scenario:](#scenario)
    - [Required NACL Rules](#required-nacl-rules)
      - [Inbound:](#inbound)
      - [Outbound:](#outbound)
  - [1️⃣3️⃣ NACL vs Security Group (EXAM FAVORITE)](#1️⃣3️⃣-nacl-vs-security-group-exam-favorite)
  - [1️⃣4️⃣ Why Use NACLs If Security Groups Exist?](#1️⃣4️⃣-why-use-nacls-if-security-groups-exist)
  - [1️⃣5️⃣ NACLs and AWS Architecture](#1️⃣5️⃣-nacls-and-aws-architecture)
    - [Typical Setup:](#typical-setup)
  - [1️⃣6️⃣ Common AWS Exam Traps](#1️⃣6️⃣-common-aws-exam-traps)
    - [❓ Traffic allowed in Security Group but not working](#-traffic-allowed-in-security-group-but-not-working)
    - [❓ Return traffic blocked](#-return-traffic-blocked)
    - [❓ Want to explicitly deny an IP](#-want-to-explicitly-deny-an-ip)
  - [1️⃣7️⃣ NACL and Route Tables (Important Difference)](#1️⃣7️⃣-nacl-and-route-tables-important-difference)
  - [1️⃣8️⃣ Logging and Monitoring](#1️⃣8️⃣-logging-and-monitoring)
  - [1️⃣9️⃣ Real-World Analogy](#1️⃣9️⃣-real-world-analogy)
    - [NACL = Society Main Gate Rules](#nacl--society-main-gate-rules)
    - [Security Group = House Door Lock](#security-group--house-door-lock)
  - [2️⃣0️⃣ One-Line Exam Definitions](#2️⃣0️⃣-one-line-exam-definitions)
    - [NACL:](#nacl)
  - [2️⃣1️⃣ Final Summary (Must Remember)](#2️⃣1️⃣-final-summary-must-remember)
  - [2️⃣2️⃣ Mental Model to Remember Forever](#2️⃣2️⃣-mental-model-to-remember-forever)


# 🔐 Network Access Control Lists (NACLs) in AWS – Complete Deep Explanation

---

## 1️⃣ What is a NACL?

A **Network Access Control List (NACL)** is a **stateless firewall** that controls **inbound and outbound traffic at the subnet level** in an AWS VPC.

### Simple definition:

> **A NACL is a set of rules that allow or deny traffic entering or leaving a subnet.**

---

## 2️⃣ Why NACLs Exist (The Core Purpose)

AWS security follows **layered security (defense in depth)**.

Even though we already have **Security Groups**, AWS still provides **NACLs** because:

* Security Groups protect **instances**
* NACLs protect **entire subnets**
* NACLs give **coarse-grained, network-level control**

Think of it as:

* **NACL = Gate at the colony**
* **Security Group = Lock on the house**

---

## 3️⃣ Where NACLs Sit in AWS Networking

```
Internet
 ↓
Internet Gateway
 ↓
NACL (Subnet level)
 ↓
Security Group (Instance level)
 ↓
EC2 Instance
```

Traffic must pass **both**:

* NACL rules
* Security Group rules

If **either blocks traffic**, traffic is blocked.

---

## 4️⃣ Key Characteristics of NACLs (VERY IMPORTANT)

| Feature          | NACL                          |
| ---------------- | ----------------------------- |
| Scope            | Subnet level                  |
| Stateful         | ❌ No (stateless)              |
| Rules            | Allow + Deny                  |
| Rule order       | Numbered (evaluated in order) |
| Default behavior | Allow all (default NACL)      |
| Applies to       | All resources in subnet       |

---

## 5️⃣ Stateless Nature of NACLs (MOST IMPORTANT CONCEPT)

### What does stateless mean?

> **NACL does not remember previous traffic.**

This means:

* If inbound traffic is allowed
* Outbound response traffic must be **explicitly allowed**

❗ This is the biggest difference from Security Groups.

---

### Example (Very Important)

If you allow:

```
Inbound: TCP 80 from 0.0.0.0/0
```

You must also allow:

```
Outbound: Ephemeral ports (1024–65535)
```

Otherwise:
❌ Website will not work

---

## 6️⃣ Structure of a NACL Rule

Each NACL rule contains:

| Field              | Meaning             |
| ------------------ | ------------------- |
| Rule Number        | Order of evaluation |
| Protocol           | TCP / UDP / ICMP    |
| Port Range         | Allowed ports       |
| Source/Destination | IP range            |
| Action             | Allow / Deny        |

---

## 7️⃣ Rule Evaluation Order

NACL rules are evaluated:

> **From lowest rule number to highest**

First matching rule is applied.

Example:

```
Rule 100 → Allow TCP 80
Rule 200 → Deny all
```

Traffic on port 80:
✔ Allowed (rule 100 matched)

---

## 8️⃣ Default NACL vs Custom NACL

---

### 🔹 Default NACL

When a VPC is created:

* AWS creates a **default NACL**
* It allows:

  * All inbound traffic
  * All outbound traffic

Rules:

```
Inbound: Allow all
Outbound: Allow all
```

---

### 🔹 Custom NACL

When you create a custom NACL:

* Default behavior:

```
Inbound: Deny all
Outbound: Deny all
```

You must **explicitly allow traffic**.

---

## 9️⃣ NACL Association Rules

* Each subnet:

  * Must be associated with **one NACL**
* One NACL:

  * Can be associated with **multiple subnets**
* If no custom NACL:

  * Subnet uses **default NACL**

---

## 🔟 Inbound vs Outbound Rules (Clear Difference)

### Inbound Rules

* Control traffic **entering the subnet**
* Example:

```
Allow TCP 80 from 0.0.0.0/0
```

### Outbound Rules

* Control traffic **leaving the subnet**
* Example:

```
Allow TCP 443 to 0.0.0.0/0
```

---

## 1️⃣1️⃣ Ephemeral Ports (CRITICAL for NACLs)

### What are ephemeral ports?

* Temporary ports used by clients
* Range:

```
1024 – 65535
```

---

### Why they matter in NACLs

When a client:

* Sends request from ephemeral port
* Server replies back to that port

So you must allow:

```
Outbound or inbound ephemeral ports
```

Otherwise:
❌ Response traffic blocked

---

## 1️⃣2️⃣ Real Traffic Flow Example (Public Web Server)

### Scenario:

* EC2 in public subnet
* Website running on port 80

---

### Required NACL Rules

#### Inbound:

```
Allow TCP 80 from 0.0.0.0/0
Allow TCP 1024–65535 from 0.0.0.0/0
```

#### Outbound:

```
Allow TCP 1024–65535 to 0.0.0.0/0
Allow TCP 80 to 0.0.0.0/0
```

Both directions are needed due to **stateless behavior**.

---

## 1️⃣3️⃣ NACL vs Security Group (EXAM FAVORITE)

| Feature     | NACL      | Security Group |
| ----------- | --------- | -------------- |
| Level       | Subnet    | Instance       |
| Stateful    | ❌ No      | ✅ Yes          |
| Allow rules | ✅ Yes     | ✅ Yes          |
| Deny rules  | ✅ Yes     | ❌ No           |
| Rule order  | Numbered  | Not ordered    |
| Default     | Allow all | Deny inbound   |

---

## 1️⃣4️⃣ Why Use NACLs If Security Groups Exist?

Because NACLs:

* Provide **extra protection**
* Can block entire IP ranges
* Act as **network-level guardrails**

Common use cases:

* Block known malicious IPs
* Restrict subnet-wide access
* Add compliance controls

---

## 1️⃣5️⃣ NACLs and AWS Architecture

### Typical Setup:

* Public Subnet:

  * NACL allows HTTP/HTTPS
* Private Subnet:

  * NACL blocks all inbound internet traffic

Security Groups then handle **fine-grained control**.

---

## 1️⃣6️⃣ Common AWS Exam Traps

### ❓ Traffic allowed in Security Group but not working

➡ Check NACL

### ❓ Return traffic blocked

➡ Missing ephemeral port rule

### ❓ Want to explicitly deny an IP

➡ Use NACL (SG cannot deny)

---

## 1️⃣7️⃣ NACL and Route Tables (Important Difference)

* **Route Table** decides *where traffic goes*
* **NACL** decides *whether traffic is allowed*

They serve **different purposes**.

---

## 1️⃣8️⃣ Logging and Monitoring

NACLs:

* Do NOT provide logs directly

To monitor traffic:

* Use **VPC Flow Logs**

---

## 1️⃣9️⃣ Real-World Analogy

### NACL = Society Main Gate Rules

* “No entry after 10 PM”
* “Block unknown vehicles”

### Security Group = House Door Lock

* Only family allowed inside

---

## 2️⃣0️⃣ One-Line Exam Definitions

### NACL:

> A stateless subnet-level firewall that controls inbound and outbound traffic using allow and deny rules.

---

## 2️⃣1️⃣ Final Summary (Must Remember)

* NACL works at subnet level
* Stateless → allow return traffic explicitly
* Supports allow + deny
* Evaluated by rule number
* Acts as first line of defense
* Complements Security Groups

---

## 2️⃣2️⃣ Mental Model to Remember Forever

```
Route Table → NACL → Security Group → EC2
```
