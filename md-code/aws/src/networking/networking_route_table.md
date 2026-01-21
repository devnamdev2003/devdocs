<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🛣️ Route Tables – Complete Explanation](#️-route-tables--complete-explanation)
  - [1️⃣ What is a Route Table?](#1️⃣-what-is-a-route-table)
  - [2️⃣ Why Route Tables Are Needed](#2️⃣-why-route-tables-are-needed)
  - [3️⃣ Basic Route Table Concepts](#3️⃣-basic-route-table-concepts)
  - [4️⃣ How Route Tables Work (Simple Logic)](#4️⃣-how-route-tables-work-simple-logic)
  - [5️⃣ Example of a Simple Route Table](#5️⃣-example-of-a-simple-route-table)
    - [What this means:](#what-this-means)
  - [6️⃣ Default Route (`0.0.0.0/0`)](#6️⃣-default-route-00000)
  - [7️⃣ Longest Prefix Match (Very Important)](#7️⃣-longest-prefix-match-very-important)
  - [8️⃣ Route Tables in AWS (VPC Context)](#8️⃣-route-tables-in-aws-vpc-context)
  - [9️⃣ Default Route Table in AWS](#9️⃣-default-route-table-in-aws)
  - [🔟 Common Route Table Targets in AWS](#-common-route-table-targets-in-aws)
  - [1️⃣1️⃣ Public Subnet Route Table](#1️⃣1️⃣-public-subnet-route-table)
    - [Route Table:](#route-table)
    - [Result:](#result)
  - [1️⃣2️⃣ Private Subnet Route Table](#1️⃣2️⃣-private-subnet-route-table)
    - [Route Table:](#route-table-1)
    - [Result:](#result-1)
  - [1️⃣3️⃣ Route Table Association](#1️⃣3️⃣-route-table-association)
  - [1️⃣4️⃣ What Route Tables Do NOT Do](#1️⃣4️⃣-what-route-tables-do-not-do)
  - [1️⃣5️⃣ Route Tables vs Firewalls](#1️⃣5️⃣-route-tables-vs-firewalls)
  - [1️⃣6️⃣ Real AWS Traffic Flow Example](#1️⃣6️⃣-real-aws-traffic-flow-example)
    - [Private EC2 → Internet](#private-ec2--internet)
  - [1️⃣7️⃣ Common AWS Exam Traps](#1️⃣7️⃣-common-aws-exam-traps)
  - [1️⃣8️⃣ Route Table for VPC Peering](#1️⃣8️⃣-route-table-for-vpc-peering)
  - [1️⃣9️⃣ Route Propagation](#1️⃣9️⃣-route-propagation)
  - [2️⃣0️⃣ One-Line Exam Definition](#2️⃣0️⃣-one-line-exam-definition)
  - [2️⃣1️⃣ Simple Analogy](#2️⃣1️⃣-simple-analogy)
  - [2️⃣2️⃣ Final Summary](#2️⃣2️⃣-final-summary)


# 🛣️ Route Tables – Complete Explanation

---

## 1️⃣ What is a Route Table?

A **Route Table** is a set of **rules** that tells a network:

> **Where to send traffic next.**

In simple words:

> A route table decides the **path (route)** that network packets should take.

---

## 2️⃣ Why Route Tables Are Needed

When a packet reaches a router or subnet, the system must answer:

> **“Where should this packet go?”**

Without route tables:

* Packets would be lost
* Networks wouldn’t know how to communicate

---

## 3️⃣ Basic Route Table Concepts

A route table contains multiple **routes**.

Each route has:

| Field       | Meaning               |
| ----------- | --------------------- |
| Destination | IP range (CIDR)       |
| Target      | Where to send traffic |

---

## 4️⃣ How Route Tables Work (Simple Logic)

1. Packet arrives
2. Destination IP is checked
3. Route table is scanned
4. **Most specific route (longest prefix)** is chosen
5. Packet is forwarded to target

---

## 5️⃣ Example of a Simple Route Table

| Destination | Target           |
| ----------- | ---------------- |
| 10.0.0.0/16 | local            |
| 0.0.0.0/0   | Internet Gateway |

---

### What this means:

* Traffic within `10.0.0.0/16` stays inside VPC
* All other traffic goes to the internet

---

## 6️⃣ Default Route (`0.0.0.0/0`)

`0.0.0.0/0` means:

> **Any destination not matched by other routes**

This is called the **default route**.

---

## 7️⃣ Longest Prefix Match (Very Important)

If multiple routes match:

* The route with **more specific CIDR** wins

Example:

```
10.0.1.0/24 → local
10.0.0.0/16 → IGW
```

Traffic to `10.0.1.5` uses `/24`, not `/16`.

---

## 8️⃣ Route Tables in AWS (VPC Context)

In AWS:

* Every **VPC has route tables**
* Route tables are associated with **subnets**
* **One route table per subnet**

---

## 9️⃣ Default Route Table in AWS

When you create a VPC:

* AWS creates a **main route table**
* All subnets use it unless changed

Default route:

```
VPC CIDR → local
```

---

## 🔟 Common Route Table Targets in AWS

| Target                  | Purpose                               |
| ----------------------- | ------------------------------------- |
| local                   | VPC internal traffic                  |
| Internet Gateway (IGW)  | Internet access                       |
| NAT Gateway             | Outbound internet from private subnet |
| VPC Peering             | Connect two VPCs                      |
| Transit Gateway         | Hub routing                           |
| Virtual Private Gateway | VPN                                   |

---

## 1️⃣1️⃣ Public Subnet Route Table

### Route Table:

| Destination | Target |
| ----------- | ------ |
| 10.0.0.0/16 | local  |
| 0.0.0.0/0   | IGW    |

### Result:

* EC2 gets public internet access (if public IP exists)

---

## 1️⃣2️⃣ Private Subnet Route Table

### Route Table:

| Destination | Target      |
| ----------- | ----------- |
| 10.0.0.0/16 | local       |
| 0.0.0.0/0   | NAT Gateway |

### Result:

* Outbound internet allowed
* No inbound internet access

---

## 1️⃣3️⃣ Route Table Association

* Each subnet:

  * Must be associated with **one route table**
* Route table:

  * Can be associated with **multiple subnets**

---

## 1️⃣4️⃣ What Route Tables Do NOT Do

❌ They do NOT allow or block traffic
❌ They do NOT act as firewalls

👉 That’s the job of:

* Security Groups
* NACLs

---

## 1️⃣5️⃣ Route Tables vs Firewalls

| Feature             | Route Table    | Firewall          |
| ------------------- | -------------- | ----------------- |
| Purpose             | Path selection | Traffic filtering |
| Blocks traffic      | ❌ No           | ✅ Yes             |
| Chooses destination | ✅ Yes          | ❌ No              |

---

## 1️⃣6️⃣ Real AWS Traffic Flow Example

### Private EC2 → Internet

1. EC2 sends packet
2. Route table sees `0.0.0.0/0`
3. Sends traffic to NAT Gateway
4. NAT sends to IGW
5. Internet receives traffic

---

## 1️⃣7️⃣ Common AWS Exam Traps

❗ EC2 has public IP but no internet?

* Check route table

❗ Private EC2 reachable from internet?

* Impossible without IGW + public subnet

❗ VPC peering not working?

* Missing route entry

---

## 1️⃣8️⃣ Route Table for VPC Peering

Example:

```
VPC A CIDR → Peering Connection
```

Both VPCs must have:

* Correct route entries

---

## 1️⃣9️⃣ Route Propagation

Some gateways (VPN, TGW) can:

* Automatically add routes
* Using route propagation

---

## 2️⃣0️⃣ One-Line Exam Definition

> **A route table contains rules that determine where network traffic is directed within and outside a VPC.**

---

## 2️⃣1️⃣ Simple Analogy

Route Table = Google Maps
Firewall = Police Checkpoint

---

## 2️⃣2️⃣ Final Summary

* Route tables decide traffic paths
* They work on destination IP
* Public vs Private subnets depend on route tables
* They don’t provide security filtering
* Essential for AWS networking

---