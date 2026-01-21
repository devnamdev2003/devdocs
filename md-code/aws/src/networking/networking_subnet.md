<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🌐 What is Subnetting?](#-what-is-subnetting)
  - [🤔 Why do we need Subnetting?](#-why-do-we-need-subnetting)
    - [1️⃣ Better Network Management](#1️⃣-better-network-management)
    - [2️⃣ Security](#2️⃣-security)
    - [3️⃣ Reduced Network Traffic](#3️⃣-reduced-network-traffic)
    - [4️⃣ Required in AWS](#4️⃣-required-in-aws)
  - [🧠 Basic IP Address Concept (Very Important)](#-basic-ip-address-concept-very-important)
  - [🧩 CIDR Notation (Foundation of Subnetting)](#-cidr-notation-foundation-of-subnetting)
    - [What does `/24` mean?](#what-does-24-mean)
  - [📊 Host Calculation Formula](#-host-calculation-formula)
  - [🧮 Example 1: /24 Network](#-example-1-24-network)
    - [Range:](#range)
  - [✂️ Subnetting Example (Very Important)](#️-subnetting-example-very-important)
    - [We have:](#we-have)
    - [Step 1: Borrow bits](#step-1-borrow-bits)
    - [Step 2: New subnets](#step-2-new-subnets)
      - [Subnet 1](#subnet-1)
      - [Subnet 2](#subnet-2)
  - [🧠 Easy Trick to Remember](#-easy-trick-to-remember)
  - [☁️ Subnetting in AWS (Very Important)](#️-subnetting-in-aws-very-important)
    - [Example AWS Setup](#example-aws-setup)
    - [Public Subnet](#public-subnet)
    - [Private Subnet](#private-subnet)
  - [🎯 Key Points for Exams (Cloud Practitioner)](#-key-points-for-exams-cloud-practitioner)
  - [🧠 AWS Special Rule (Very Important)](#-aws-special-rule-very-important)
  - [📌 Simple One-Line Definition (Exam Ready)](#-simple-one-line-definition-exam-ready)


# 🌐 What is Subnetting?

**Subnetting** means:

> **Dividing one big network into smaller networks (sub-networks).**

These smaller networks are called **subnets**.

---

## 🤔 Why do we need Subnetting?

There are **4 main reasons**:

### 1️⃣ Better Network Management

* Easier to organize systems
* Example:

  * One subnet for **servers**
  * One subnet for **databases**
  * One subnet for **users**

---

### 2️⃣ Security

* You can **restrict access** between subnets
* Example:

  * Database subnet cannot be accessed directly from the internet

👉 **Very important for AWS**

---

### 3️⃣ Reduced Network Traffic

* Smaller networks = less broadcast traffic
* Faster communication

---

### 4️⃣ Required in AWS

In AWS:

* **VPC = network**
* **Subnet = smaller network inside VPC**

You **cannot launch EC2 without a subnet**.

---

## 🧠 Basic IP Address Concept (Very Important)

An **IP address** looks like this:

```
192.168.1.10
```

It has **32 bits** (IPv4).

---

## 🧩 CIDR Notation (Foundation of Subnetting)

Subnetting uses **CIDR**.

Example:

```
192.168.1.0/24
```

### What does `/24` mean?

* **24 bits** are for **network**
* **Remaining bits** are for **hosts**

---

## 📊 Host Calculation Formula

```
Number of hosts = 2^(host bits) - 2
```

Why `-2`?

* 1 for **Network address**
* 1 for **Broadcast address**

---

## 🧮 Example 1: /24 Network

```
192.168.1.0/24
```

* Total bits: 32
* Network bits: 24
* Host bits: 8

```
Hosts = 2^8 - 2 = 254
```

### Range:

```
Network:   192.168.1.0
First IP:  192.168.1.1
Last IP:   192.168.1.254
Broadcast: 192.168.1.255
```

---

## ✂️ Subnetting Example (Very Important)

### We have:

```
192.168.1.0/24
```

We want **2 subnets**.

---

### Step 1: Borrow bits

To create **2 subnets**, borrow **1 bit**.

```
/24 → /25
```

---

### Step 2: New subnets

#### Subnet 1

```
192.168.1.0/25
Range: 192.168.1.0 – 192.168.1.127
Usable IPs: 126
```

#### Subnet 2

```
192.168.1.128/25
Range: 192.168.1.128 – 192.168.1.255
Usable IPs: 126
```

---

## 🧠 Easy Trick to Remember

| CIDR | Total IPs | Usable |
| ---- | --------- | ------ |
| /24  | 256       | 254    |
| /25  | 128       | 126    |
| /26  | 64        | 62     |
| /27  | 32        | 30     |
| /28  | 16        | 14     |

---

## ☁️ Subnetting in AWS (Very Important)

### Example AWS Setup

```
VPC: 10.0.0.0/16
```

You create subnets like:

```
Public Subnet:  10.0.1.0/24
Private Subnet: 10.0.2.0/24
```

### Public Subnet

* Route to **Internet Gateway**
* EC2 can access internet

### Private Subnet

* No direct internet
* Used for **DB, backend**

---

## 🎯 Key Points for Exams (Cloud Practitioner)

✔ Subnet = smaller network
✔ CIDR defines IP range
✔ AWS reserves **5 IPs per subnet**
✔ Public subnet = route to IGW
✔ Private subnet = no IGW route

---

## 🧠 AWS Special Rule (Very Important)

In AWS, **5 IPs are always reserved**:

Example for `/24`:

```
Total IPs: 256
Usable in AWS: 251
```

Reserved:

* Network address
* Router
* DNS
* Reserved future use
* Broadcast

---

## 📌 Simple One-Line Definition (Exam Ready)

> **Subnetting is the process of dividing a large IP network into smaller, manageable networks using CIDR notation.**

---
