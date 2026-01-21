<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🌐 CIDR Notation – Complete Explanation](#-cidr-notation--complete-explanation)
  - [1️⃣ What is CIDR?](#1️⃣-what-is-cidr)
  - [2️⃣ Why CIDR Was Introduced (The Real Problem)](#2️⃣-why-cidr-was-introduced-the-real-problem)
    - [🔴 Classful IP Problems](#-classful-ip-problems)
    - [✅ CIDR Solved This](#-cidr-solved-this)
  - [3️⃣ Basic CIDR Format](#3️⃣-basic-cidr-format)
  - [4️⃣ What Does `/24` Mean?](#4️⃣-what-does-24-mean)
  - [5️⃣ Understanding IP Addresses in Binary (Very Important)](#5️⃣-understanding-ip-addresses-in-binary-very-important)
  - [6️⃣ Network Bits vs Host Bits](#6️⃣-network-bits-vs-host-bits)
  - [7️⃣ How Many IPs Does a CIDR Block Have?](#7️⃣-how-many-ips-does-a-cidr-block-have)
    - [Formula:](#formula)
    - [Usable IPs:](#usable-ips)
  - [8️⃣ CIDR Examples (VERY IMPORTANT)](#8️⃣-cidr-examples-very-important)
    - [🔹 Example 1: `/24`](#-example-1-24)
    - [🔹 Example 2: `/16`](#-example-2-16)
    - [🔹 Example 3: `/28`](#-example-3-28)
  - [9️⃣ Common CIDR Blocks You Must Remember](#9️⃣-common-cidr-blocks-you-must-remember)
  - [🔟 CIDR and Subnetting (Connection)](#-cidr-and-subnetting-connection)
  - [1️⃣1️⃣ CIDR in AWS (VERY IMPORTANT)](#1️⃣1️⃣-cidr-in-aws-very-important)
    - [VPC CIDR](#vpc-cidr)
    - [Subnet CIDR](#subnet-cidr)
  - [1️⃣2️⃣ AWS Reserved IPs (IMPORTANT EXAM POINT)](#1️⃣2️⃣-aws-reserved-ips-important-exam-point)
  - [1️⃣3️⃣ CIDR and Route Tables](#1️⃣3️⃣-cidr-and-route-tables)
  - [1️⃣4️⃣ CIDR and Security (SG / NACL)](#1️⃣4️⃣-cidr-and-security-sg--nacl)
  - [1️⃣5️⃣ `0.0.0.0/0` (VERY IMPORTANT)](#1️⃣5️⃣-00000-very-important)
  - [1️⃣6️⃣ Private IP CIDR Ranges (MUST MEMORIZE)](#1️⃣6️⃣-private-ip-cidr-ranges-must-memorize)
  - [1️⃣7️⃣ Longest Prefix Match (Exam Concept)](#1️⃣7️⃣-longest-prefix-match-exam-concept)
  - [1️⃣8️⃣ Real-World Analogy](#1️⃣8️⃣-real-world-analogy)
  - [1️⃣9️⃣ One-Line Exam Definition](#1️⃣9️⃣-one-line-exam-definition)
  - [2️⃣0️⃣ Final Summary (Must Remember)](#2️⃣0️⃣-final-summary-must-remember)


# 🌐 CIDR Notation – Complete Explanation

---

## 1️⃣ What is CIDR?

**CIDR** stands for:

> **Classless Inter-Domain Routing**

CIDR is a method used to:

* Represent **IP address ranges**
* Perform **subnetting**
* Control **network size**
* Optimize IP usage

---

## 2️⃣ Why CIDR Was Introduced (The Real Problem)

Before CIDR, networking used **classful addressing**.

### 🔴 Classful IP Problems

| Class   | Network Size |
| ------- | ------------ |
| Class A | Very large   |
| Class B | Medium       |
| Class C | Very small   |

Problems:
❌ Wasted IP addresses
❌ Inflexible network sizes
❌ Poor internet scalability

---

### ✅ CIDR Solved This

CIDR:

* Removed fixed classes
* Allowed **custom network sizes**
* Improved IP utilization
* Enabled modern subnetting

---

## 3️⃣ Basic CIDR Format

CIDR notation looks like:

```
IP_address/prefix_length
```

Example:

```
192.168.1.0/24
```

---

## 4️⃣ What Does `/24` Mean?

The `/24` is called the **prefix length**.

It means:

> **The first 24 bits are network bits**

Since IPv4 has **32 bits total**:

```
Network bits = 24
Host bits = 32 - 24 = 8
```

---

## 5️⃣ Understanding IP Addresses in Binary (Very Important)

IPv4 address:

```
192.168.1.0
```

In binary:

```
11000000.10101000.00000001.00000000
```

Each octet = **8 bits**

---

## 6️⃣ Network Bits vs Host Bits

CIDR divides IP into:

* **Network part** → identifies network
* **Host part** → identifies devices

Example `/24`:

```
Network: 192.168.1
Host:    last octet
```

---

## 7️⃣ How Many IPs Does a CIDR Block Have?

### Formula:

```
Total IPs = 2^(host bits)
```

### Usable IPs:

```
2^(host bits) - 2
```

(One for network address, one for broadcast)

---

## 8️⃣ CIDR Examples (VERY IMPORTANT)

---

### 🔹 Example 1: `/24`

```
192.168.1.0/24
```

* Host bits = 8
* Total IPs = 256
* Usable IPs = 254

Range:

```
192.168.1.0  → Network
192.168.1.1  → First host
192.168.1.254 → Last host
192.168.1.255 → Broadcast
```

---

### 🔹 Example 2: `/16`

```
10.0.0.0/16
```

* Host bits = 16
* Total IPs = 65,536
* Usable IPs = 65,534

---

### 🔹 Example 3: `/28`

```
192.168.1.0/28
```

* Host bits = 4
* Total IPs = 16
* Usable IPs = 14

---

## 9️⃣ Common CIDR Blocks You Must Remember

| CIDR | Total IPs | Usable |
| ---- | --------- | ------ |
| /16  | 65,536    | 65,534 |
| /24  | 256       | 254    |
| /25  | 128       | 126    |
| /26  | 64        | 62     |
| /27  | 32        | 30     |
| /28  | 16        | 14     |

---

## 🔟 CIDR and Subnetting (Connection)

Subnetting is:

> **Splitting a CIDR block into smaller CIDR blocks**

Example:

```
10.0.0.0/24
```

Split into two subnets:

```
10.0.0.0/25
10.0.0.128/25
```

---

## 1️⃣1️⃣ CIDR in AWS (VERY IMPORTANT)

### VPC CIDR

When creating a VPC:

```
10.0.0.0/16
```

This defines:

* Size of your VPC
* How many subnets you can create

---

### Subnet CIDR

Subnets use **smaller CIDR blocks** inside VPC CIDR.

Example:

```
VPC:     10.0.0.0/16
Subnet1: 10.0.1.0/24
Subnet2: 10.0.2.0/24
```

---

## 1️⃣2️⃣ AWS Reserved IPs (IMPORTANT EXAM POINT)

In AWS:

* **5 IPs are reserved per subnet**

For `/24`:

```
Total IPs = 256
Usable = 251
```

Reserved:

* Network address
* Router
* DNS
* Future use
* Broadcast

---

## 1️⃣3️⃣ CIDR and Route Tables

Route tables use CIDR blocks to:

* Match destination IPs
* Decide where traffic goes

Example:

```
0.0.0.0/0 → IGW
10.0.0.0/16 → local
```

---

## 1️⃣4️⃣ CIDR and Security (SG / NACL)

CIDR is used to define:

* Allowed IP ranges
* Blocked IP ranges

Example:

```
Allow SSH from 203.0.113.0/24
```

---

## 1️⃣5️⃣ `0.0.0.0/0` (VERY IMPORTANT)

This means:

> **All IPv4 addresses**

Used as:

* Default route
* Open access

---

## 1️⃣6️⃣ Private IP CIDR Ranges (MUST MEMORIZE)

| Range          | Purpose |
| -------------- | ------- |
| 10.0.0.0/8     | Private |
| 172.16.0.0/12  | Private |
| 192.168.0.0/16 | Private |

---

## 1️⃣7️⃣ Longest Prefix Match (Exam Concept)

If multiple routes match:

* Route with **largest prefix length** wins

Example:

```
10.0.1.0/24 → local
10.0.0.0/16 → IGW
```

Traffic to `10.0.1.5`:

* Uses `/24` route

---

## 1️⃣8️⃣ Real-World Analogy

CIDR is like:

* Apartment building size
* `/16` → big building
* `/24` → floor
* `/28` → few flats

---

## 1️⃣9️⃣ One-Line Exam Definition

> **CIDR notation defines an IP address range using a prefix length that determines the network and host portions.**

---

## 2️⃣0️⃣ Final Summary (Must Remember)

* CIDR replaced classful addressing
* `/number` = network bits
* Remaining bits = hosts
* Used everywhere in AWS
* Essential for subnetting, routing, and security

---
