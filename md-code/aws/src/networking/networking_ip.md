<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

- [🌐 IPv4 Address Structure, Private IPs, and Public IPs](#-ipv4-address-structure-private-ips-and-public-ips)
  - [1️⃣ IPv4 Address Structure](#1️⃣-ipv4-address-structure)
    - [What is an IPv4 Address?](#what-is-an-ipv4-address)
    - [Example:](#example)
  - [2️⃣ IPv4 Address Format](#2️⃣-ipv4-address-format)
  - [3️⃣ Network Part vs Host Part](#3️⃣-network-part-vs-host-part)
  - [4️⃣ Special IPv4 Addresses (Must Know)](#4️⃣-special-ipv4-addresses-must-know)
  - [5️⃣ What Is a Private IP Address?](#5️⃣-what-is-a-private-ip-address)
  - [6️⃣ Why Private IP Addresses Exist](#6️⃣-why-private-ip-addresses-exist)
  - [7️⃣ Private IP Ranges (VERY IMPORTANT – MEMORIZE)](#7️⃣-private-ip-ranges-very-important--memorize)
  - [8️⃣ Characteristics of Private IPs](#8️⃣-characteristics-of-private-ips)
  - [9️⃣ What Is a Public IP Address?](#9️⃣-what-is-a-public-ip-address)
  - [🔟 Characteristics of Public IPs](#-characteristics-of-public-ips)
  - [1️⃣1️⃣ Public IPs in AWS (IMPORTANT)](#1️⃣1️⃣-public-ips-in-aws-important)
  - [1️⃣2️⃣ Private vs Public IP (Clear Comparison)](#1️⃣2️⃣-private-vs-public-ip-clear-comparison)
  - [1️⃣3️⃣ How Private IP Accesses Internet](#1️⃣3️⃣-how-private-ip-accesses-internet)
  - [1️⃣4️⃣ Public IP Access Flow](#1️⃣4️⃣-public-ip-access-flow)
  - [1️⃣5️⃣ AWS Exam Traps (VERY IMPORTANT)](#1️⃣5️⃣-aws-exam-traps-very-important)
  - [1️⃣6️⃣ Elastic IP (Special Public IP)](#1️⃣6️⃣-elastic-ip-special-public-ip)
  - [1️⃣7️⃣ Real-World Analogy](#1️⃣7️⃣-real-world-analogy)
  - [1️⃣8️⃣ One-Line Exam Definitions](#1️⃣8️⃣-one-line-exam-definitions)
    - [IPv4 Address:](#ipv4-address)
    - [Private IP:](#private-ip)
    - [Public IP:](#public-ip)
  - [1️⃣9️⃣ Final Summary (Must Remember)](#1️⃣9️⃣-final-summary-must-remember)


# 🌐 IPv4 Address Structure, Private IPs, and Public IPs

---

## 1️⃣ IPv4 Address Structure

### What is an IPv4 Address?

An **IPv4 address** is a **32-bit number** used to **identify a device on a network**.

It is written in **dotted decimal format**.

### Example:

```
192.168.1.10
```

---

## 2️⃣ IPv4 Address Format

An IPv4 address has:

* **4 parts (octets)**
* Each octet has **8 bits**
* Each octet range: **0–255**

```
Octet1.Octet2.Octet3.Octet4
```

Example:

```
11000000.10101000.00000001.00001010
   192       168        1        10
```

---

## 3️⃣ Network Part vs Host Part

An IPv4 address is divided into:

* **Network portion** → identifies the network
* **Host portion** → identifies the device

This division is defined using **CIDR notation**.

Example:

```
192.168.1.0/24
```

* Network part → first 24 bits
* Host part → last 8 bits

---

## 4️⃣ Special IPv4 Addresses (Must Know)

| Address              | Meaning            |
| -------------------- | ------------------ |
| Network address      | Identifies network |
| Broadcast address    | Sends to all hosts |
| Loopback (127.0.0.1) | Local system       |
| 0.0.0.0              | Default route      |

---

## 5️⃣ What Is a Private IP Address?

A **Private IP address** is an IP that:

* Is used **inside internal networks**
* Is **not routable on the internet**
* Must use **NAT** to access internet

---

## 6️⃣ Why Private IP Addresses Exist

Because:

* IPv4 addresses are limited
* Not every device needs public access
* Improves security
* Reduces cost

---

## 7️⃣ Private IP Ranges (VERY IMPORTANT – MEMORIZE)

These are defined by **RFC 1918**.

| Class   | CIDR             | Range                         |
| ------- | ---------------- | ----------------------------- |
| Class A | `10.0.0.0/8`     | 10.0.0.0 – 10.255.255.255     |
| Class B | `172.16.0.0/12`  | 172.16.0.0 – 172.31.255.255   |
| Class C | `192.168.0.0/16` | 192.168.0.0 – 192.168.255.255 |

📌 These IPs **cannot be used on the internet**.

---

## 8️⃣ Characteristics of Private IPs

✔ Free to use
✔ Reusable across networks
✔ Hidden from internet
✔ Require NAT for internet access

Example:

```
10.0.1.15
192.168.1.10
```

---

## 9️⃣ What Is a Public IP Address?

A **Public IP address** is an IP that:

* Is **globally unique**
* Is **routable on the internet**
* Can be accessed from anywhere

Example:

```
3.110.45.21
```

---

## 🔟 Characteristics of Public IPs

✔ Globally unique
✔ Assigned by ISP / AWS
✔ Internet-routable
✔ Limited and valuable

---

## 1️⃣1️⃣ Public IPs in AWS (IMPORTANT)

In AWS:

* Public IPs are assigned to:

  * EC2 instances
  * Load Balancers
  * NAT Gateways
* Public IPs change when instance stops (unless Elastic IP)

---

## 1️⃣2️⃣ Private vs Public IP (Clear Comparison)

| Feature           | Private IP | Public IP      |
| ----------------- | ---------- | -------------- |
| Internet routable | ❌ No       | ✅ Yes          |
| Unique globally   | ❌ No       | ✅ Yes          |
| Used inside VPC   | ✅ Yes      | ❌ No           |
| Cost              | Free       | Limited / Paid |
| Security risk     | Low        | Higher         |

---

## 1️⃣3️⃣ How Private IP Accesses Internet

Private IP cannot talk to internet directly.

Flow:

```
Private IP
 ↓
NAT Gateway
 ↓
Internet Gateway
 ↓
Internet
```

---

## 1️⃣4️⃣ Public IP Access Flow

Public IP:

```
Internet
 ↓
Internet Gateway
 ↓
EC2 (Public IP)
```

---

## 1️⃣5️⃣ AWS Exam Traps (VERY IMPORTANT)

❓ Private IP can access internet directly
➡ ❌ False

❓ Public IP guarantees internet access
➡ ❌ False (route table + SG required)

❓ Same private IPs can exist in different VPCs
➡ ✅ True

---

## 1️⃣6️⃣ Elastic IP (Special Public IP)

Elastic IP:

* Static public IP
* Does not change
* Charged if unused

Used for:

* Fixed endpoints
* NAT Gateway
* Bastion hosts

---

## 1️⃣7️⃣ Real-World Analogy

| Network    | Analogy              |
| ---------- | -------------------- |
| Private IP | Office extension     |
| Public IP  | Company phone number |
| NAT        | Receptionist         |

---

## 1️⃣8️⃣ One-Line Exam Definitions

### IPv4 Address:

> A 32-bit numerical label used to identify a device on a network.

### Private IP:

> An IP address used inside private networks that is not routable on the internet.

### Public IP:

> A globally unique IP address that allows direct internet communication.

---

## 1️⃣9️⃣ Final Summary (Must Remember)

* IPv4 = 32-bit address
* Written as 4 octets
* Private IPs are internal
* Public IPs are internet-facing
* NAT connects private to public
* AWS uses both extensively

