<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🚪 What is a Port?](#-what-is-a-port)
  - [📦 Why Ports are Needed](#-why-ports-are-needed)
  - [🔢 Port Range (Very Important)](#-port-range-very-important)
    - [Categories:](#categories)
    - [1️⃣ Well-Known Ports (0–1023)](#1️⃣-well-known-ports-01023)
    - [2️⃣ Registered Ports (1024–49151)](#2️⃣-registered-ports-102449151)
    - [3️⃣ Dynamic / Ephemeral Ports (49152–65535)](#3️⃣-dynamic--ephemeral-ports-4915265535)
  - [⭐ Common Ports You MUST Remember (AWS + Interviews)](#-common-ports-you-must-remember-aws--interviews)
  - [🧠 How Ports Work (Simple Flow)](#-how-ports-work-simple-flow)
  - [🔐 TCP vs UDP Ports](#-tcp-vs-udp-ports)
    - [🧱 TCP (Reliable)](#-tcp-reliable)
    - [⚡ UDP (Fast)](#-udp-fast)
  - [☁️ Ports in AWS (Very Important)](#️-ports-in-aws-very-important)
    - [Security Group = Firewall](#security-group--firewall)
  - [🧪 Real AWS Example](#-real-aws-example)
  - [🛑 Important AWS Exam Traps](#-important-aws-exam-traps)
  - [🔍 Check Open Ports (Linux)](#-check-open-ports-linux)
    - [Check listening ports:](#check-listening-ports)
  - [🧠 One-Line Exam Definition](#-one-line-exam-definition)
  - [📝 Quick Memory Trick](#-quick-memory-trick)

# 🚪 What is a Port?

A **port** is like a **door** on a computer or server.

* **IP address** → identifies the **machine**
* **Port number** → identifies the **application/service** on that machine

👉 **IP = building address**
👉 **Port = flat/room number**

---

## 📦 Why Ports are Needed

One server runs **many services** at the same time:

| Service        | Port |
| -------------- | ---- |
| Website        | 80   |
| Secure Website | 443  |
| SSH            | 22   |
| Database       | 3306 |

Without ports:
❌ Computer wouldn’t know **which service** should receive the data.

---

## 🔢 Port Range (Very Important)

Ports range from:

```
0 – 65535
```

### Categories:

### 1️⃣ Well-Known Ports (0–1023)

Reserved for common services.

### 2️⃣ Registered Ports (1024–49151)

Used by applications.

### 3️⃣ Dynamic / Ephemeral Ports (49152–65535)

Temporary ports used by clients.

---

## ⭐ Common Ports You MUST Remember (AWS + Interviews)

| Port  | Service    | Use                |
| ----- | ---------- | ------------------ |
| 22    | SSH        | Login to Linux EC2 |
| 80    | HTTP       | Website            |
| 443   | HTTPS      | Secure website     |
| 21    | FTP        | File transfer      |
| 25    | SMTP       | Send emails        |
| 53    | DNS        | Domain resolution  |
| 3306  | MySQL      | Database           |
| 5432  | PostgreSQL | Database           |
| 27017 | MongoDB    | Database           |
| 3389  | RDP        | Windows login      |

---

## 🧠 How Ports Work (Simple Flow)

Example: You open a website.

1️⃣ Your browser uses a **random client port**

```
Example: 52344
```

2️⃣ It connects to server:

```
Server IP : 443
```

3️⃣ Server replies back to:

```
Your IP : 52344
```

✔ Server port is **fixed**
✔ Client port is **temporary**

---

## 🔐 TCP vs UDP Ports

Ports work with **protocols**.

### 🧱 TCP (Reliable)

* Connection-oriented
* Slower but safe

Used for:

* HTTP (80)
* HTTPS (443)
* SSH (22)

---

### ⚡ UDP (Fast)

* No connection
* Faster but not guaranteed

Used for:

* DNS (53)
* Video streaming
* Gaming

---

## ☁️ Ports in AWS (Very Important)

### Security Group = Firewall

Security Groups control:

* **Which ports are allowed**
* **From which IP**

Example:

```
Allow inbound:
Port 22 → My IP
Port 80 → 0.0.0.0/0
```

If port is **closed**:
❌ Service is running
❌ But cannot be accessed

---

## 🧪 Real AWS Example

You launch EC2 and install Apache.

Apache listens on:

```
Port 80
```

But you forget to open port 80 in Security Group.

Result:
❌ Website not accessible

👉 **Security Group must allow the port**

---

## 🛑 Important AWS Exam Traps

❗ EC2 not accessible?
Check:

1. Security Group
2. NACL
3. Correct port
4. Correct protocol (TCP/UDP)

---

## 🔍 Check Open Ports (Linux)

### Check listening ports:

```bash
ss -tuln
```

or

```bash
netstat -tuln
```

---

## 🧠 One-Line Exam Definition

> **A port is a logical communication endpoint that allows multiple services to run on the same IP address.**

---

## 📝 Quick Memory Trick

* **22** → SSH
* **80** → Web
* **443** → Secure Web
* **3306** → MySQL
* **5432** → PostgreSQL

---