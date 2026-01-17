<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 🔑 Big Picture: EC2 Access + Linux Users (ONE CLEAR MODEL)

When you create an **EC2 instance**, there are **two separate systems** involved:

### 1️⃣ AWS level (IAM & Key Pair)

Controls:

* **Who can connect to the EC2**
* Uses **SSH keys (.pem)**

### 2️⃣ Linux level (Users & Groups)

Controls:

* **What a person can do inside the server**
* Uses **users, groups, permissions**

👉 These two are **independent** but **work together**.

---

## 🔐 What the `.pem` file really does

* A `.pem` file is **NOT a user**
* It is **NOT root access**
* It only proves:

> “I am allowed to connect to this server”

When you SSH using a PEM file:

```
ssh -i key.pem ec2-user@IP
```

You log in as:

```
ec2-user
```

✔ Not root
✔ Normal Linux user
✔ Has `sudo` access

---

## 👤 Are you root after login?

❌ **No**

AWS **disables direct root login** for security.

To become root:

```
sudo su -
```

or

```
sudo -i
```

Root access is **temporary** and **controlled**.

---

## 👥 Giving EC2 access to another person (CORRECT WAY)

You **do NOT** share your PEM file.

### Correct process:

1. **Other person generates their own SSH key**
2. They send you **only the public key**
3. You create a **Linux user** on EC2
4. You add their public key to that user
5. You set **permissions** for what they can access

---



# 🔑 1️⃣ What does “login with a PEM file” actually mean?

When you run this command:

```
ssh -i mykey.pem ec2-user@EC2-IP
```

You are doing **SSH key-based authentication**.

Let’s break it down:

| Part              | Meaning                                    |
| ----------------- | ------------------------------------------ |
| `ssh`             | Secure Shell (connect to server)           |
| `-i mykey.pem`    | Use this **private key** to prove identity |
| `ec2-user@EC2-IP` | Login as Linux user `ec2-user`             |

👉 **Important:**
The PEM file is **not a user**.
It is **not root access**.
It is just a **key to open the door**.

---

## 👤 2️⃣ Which user do you become after login?

You become the **Linux user you specify** in the SSH command.

Example:

```
ssh -i mykey.pem ec2-user@EC2-IP
```

You are logged in as:

```
ec2-user
```

You can verify:

```
whoami
```

Output:

```
ec2-user
```

✅ You are **NOT root**
✅ You are a **normal Linux user**

---

## ❌ 3️⃣ Are you root by default after login?

**NO. Never.**

Even though you used a PEM file:

* You are **not root**
* You are **not superuser**
* You have **limited permissions**

AWS does this **intentionally** for security.

---

## 🧠 4️⃣ Why AWS does NOT log you in as root

AWS **disables direct root login by default**.

### Reasons:

1. **Security**

   * Root can delete OS, disks, users
2. **Accidental damage**

   * One wrong command can destroy server
3. **Industry best practice**

   * Least privilege principle

So AWS says:

> “Login as a normal user, become root only when needed.”

---

## 🔐 5️⃣ Then how can `ec2-user` do admin work?

Because `ec2-user` has **sudo access**.

Check:

```
groups ec2-user
```

Output:

```
ec2-user wheel
```

The `wheel` group allows:

```
sudo
```

---

## 🚀 6️⃣ How to access root (IMPORTANT)

There are **two correct and safe ways**.

---

### ✅ Method 1: Run a single command as root

```
sudo command
```

Example:

```
sudo yum install nginx
```

What happens:

* Only this command runs as root
* You remain `ec2-user`

Check:

```
sudo whoami
```

Output:

```
root
```

---

### ✅ Method 2: Switch to full root shell

```
sudo su -
```

OR

```
sudo -i
```

Now your prompt changes:

```
[root@ip-172-31-x-x ~]#
```

Now:

* You are **root**
* You have **full control**

To exit root:

```
exit
```

---

## ⚠️ 7️⃣ Why root login is dangerous

As root you can:

* Delete `/`
* Stop networking
* Remove users
* Break boot process

That’s why:

* Root login via SSH is **disabled**
* Root is accessed **temporarily via sudo**

---

## 🧠 8️⃣ Mental model (VERY IMPORTANT)

Think like this:

* **PEM file** → proves who you are
* **Linux user** → decides what you can do
* **sudo** → temporary root power

```
PEM file ≠ root
```

---

## 📌 9️⃣ One-command summary

| Action         | Result               |
| -------------- | -------------------- |
| SSH with PEM   | Login as normal user |
| `whoami`       | ec2-user             |
| `sudo command` | Run as root          |
| `sudo su -`    | Become root          |
| Root SSH login | Disabled             |

---

## ✅ Final clear statement (remember this)

> When you log in using a PEM file, you are logged in as a normal Linux user (like `ec2-user`), not as root. AWS disables direct root login for security reasons. To perform administrative tasks, you temporarily become root using `sudo`.

---


# How to create a new user and how to do proper setup for that user

This is exactly how it is done on **real EC2 servers**.

---

## 🧠 First understand the goal

When you create a new user, you want:

✔ The user to log in **with their own SSH key**
✔ The user to have **their own home directory**
✔ The user to access **only allowed files**
✔ The user to **NOT be root by default**

---

## 👤 Step 1: Login as admin user

First, **you** (admin) log in to EC2:

```
ssh -i admin.pem ec2-user@EC2-IP
```

You are logged in as:

```
ec2-user
```

This user has **sudo access**.

---

## 👤 Step 2: Create a new Linux user

Create a new user (example: `devuser`):

```
sudo useradd devuser
```

What this does:

* Creates a Linux user named `devuser`
* Assigns a UID (user ID)
* Creates entry in `/etc/passwd`

---

## 📂 Step 3: Create home directory (IMPORTANT)

Some systems create it automatically, but to be safe:

```
sudo mkdir /home/devuser
```

Set ownership:

```
sudo chown devuser:devuser /home/devuser
```

Now:

```
/home/devuser
```

belongs only to `devuser`.

---

## 🔐 Step 4: Create `.ssh` directory

This is required for **SSH key login**.

```
sudo mkdir /home/devuser/.ssh
```

Set correct permissions:

```
sudo chmod 700 /home/devuser/.ssh
sudo chown devuser:devuser /home/devuser/.ssh
```

### Why 700?

* Only the user can read/write/enter
* SSH will **refuse login** if permissions are wrong

---

## 🔑 Step 5: Add public key (MOST IMPORTANT)

Create the authorized keys file:

```
sudo nano /home/devuser/.ssh/authorized_keys
```

Paste the **public key** of the user here.

⚠️ **Only public key**, never private key.

Set permissions:

```
sudo chmod 600 /home/devuser/.ssh/authorized_keys
sudo chown devuser:devuser /home/devuser/.ssh/authorized_keys
```

---

## 🧪 Step 6: Test user login

Now the user can log in from **their own machine**:

```
ssh -i devuser.pem devuser@EC2-IP
```

Check:

```
whoami
```

Output:

```
devuser
```

✅ User is logged in
✅ Not root
✅ Isolated from other users

---

## 🔐 Step 7: Decide sudo access (VERY IMPORTANT)

### ❓ Should the user be root-capable?

### ❌ If NO (most secure):

Do nothing.

User:

* Cannot install software
* Cannot change system config
* Cannot access `/etc`, `/var`, etc.

---

### ✅ If YES (admin / senior dev):

Add user to sudo group.

On Amazon Linux:

```
sudo usermod -aG wheel devuser
```

On Ubuntu:

```
sudo usermod -aG sudo devuser
```

Now user can run:

```
sudo command
```

---

## 📂 Step 8: Folder & file access control

Example:
You have a folder:

```
/app-data
```

You want:

* `devuser` → access
* Others → no access

```
sudo chown devuser:devuser /app-data
sudo chmod 700 /app-data
```

Now:

* Only `devuser` can access
* Others are blocked

---

## 👥 Step 9: Groups (Professional setup)

Create a group:

```
sudo groupadd devteam
```

Add user to group:

```
sudo usermod -aG devteam devuser
```

Assign folder to group:

```
sudo chown :devteam /shared-data
sudo chmod 770 /shared-data
```

Now:

* All devteam members can access
* Others cannot

---

## ❌ Common mistakes (IMPORTANT)

❌ Forgetting `.ssh` permissions
❌ Putting private key on server
❌ Logging everyone in as `ec2-user`
❌ Giving sudo to everyone

---

## 🧠 Mental model (REMEMBER THIS)

```
User = identity
Group = role
SSH key = login method
Permissions = access control
```

---

## ✅ Final summary (Task 2)

> To set up a new user on an EC2 instance, you create a Linux user, create a home directory, configure SSH access using the user’s public key, set strict permissions on `.ssh` files, and optionally grant sudo access using groups. This ensures secure, controlled access for each individual user.

---


# How the other user creates their PEM file and shares it with you

This task is about **what the OTHER PERSON does**, not you.

---

## 🧠 First, clear one very important misunderstanding

👉 **The admin does NOT create the PEM file for the user.**
👉 **The user creates their OWN PEM file on their OWN machine.**

This is how it works in real companies.

---

## 👤 Who is “the other user”?

* Developer
* Teammate
* Intern
* Ops engineer

They want access to **your EC2 server**.

---

## 🔑 Step 1: User creates SSH key pair on their own machine

On their **laptop / system**, they run:

```
ssh-keygen
```

They will see something like:

```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa):
```

They can press **Enter**
OR give a custom name:

```
devuser.pem
```

---

### What files are created?

Two files are created:

| File              | Purpose                            |
| ----------------- | ---------------------------------- |
| `devuser.pem`     | **PRIVATE KEY** (never shared)     |
| `devuser.pem.pub` | **PUBLIC KEY** (shared with admin) |

📌 The `.pem` file stays **ONLY** with the user.

---

## 🔐 Step 2: Optional – set passphrase (recommended)

User may be asked:

```
Enter passphrase (empty for no passphrase):
```

* Passphrase = extra password protection
* If someone steals the key → still cannot use it

In companies:
✔️ Passphrase is recommended

---

## 📤 Step 3: User shares ONLY the public key

The user sends **ONLY** this file (or its content):

```
devuser.pem.pub
```

Example content:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7...
```

They can share it via:

* Email
* Slack
* Ticket
* Git (private repo)

⚠️ **They NEVER share**:

```
devuser.pem
```

---

## 🔒 Why private key is never shared

If someone has the private key:

* They can login as that user
* No password needed
* Full access

So:

```
Private key = identity
```

---

## 🖥️ Step 4: You (admin) add public key to EC2

You paste the public key into:

```
/home/devuser/.ssh/authorized_keys
```

Now the server trusts:

* Anyone who proves they own the matching private key

---

## 🧪 Step 5: How the user logs in

From their machine, the user runs:

```
ssh -i devuser.pem devuser@EC2-IP
```

Important points:

* Command runs on **their laptop**
* Uses **their private key**
* Logs in as **devuser**

---

## 🔍 Step 6: How SSH verifies identity (Simple explanation)

1. Server sends a challenge
2. User signs it with private key
3. Server checks public key
4. Match found ✔️
5. Login allowed 🎉

The private key is **never sent** to the server.

---

## ❌ Common beginner mistakes (VERY IMPORTANT)

❌ Admin generates key and shares PEM
❌ User sends private key via WhatsApp 😬
❌ Storing private keys on server
❌ One key used by multiple users

---

## 🧠 Simple analogy (remember this)

| Real world  | SSH                |
| ----------- | ------------------ |
| House key   | Private key (.pem) |
| Lock design | Public key (.pub)  |
| House owner | EC2 admin          |

---

## ✅ Final summary (Task 3)

> The other user generates their own SSH key pair on their own system using `ssh-keygen`. They keep the private key (`.pem`) securely with them and share only the public key (`.pub`) with the EC2 admin. The admin adds this public key to the user’s `authorized_keys` file, allowing secure SSH access without sharing secrets.

---

# How the other user creates their PEM file and shares it with you

This task is about **what the OTHER PERSON does**, not you.

---

## 🧠 First, clear one very important misunderstanding

👉 **The admin does NOT create the PEM file for the user.**
👉 **The user creates their OWN PEM file on their OWN machine.**

This is how it works in real companies.

---

## 👤 Who is “the other user”?

* Developer
* Teammate
* Intern
* Ops engineer

They want access to **your EC2 server**.

---

## 🔑 Step 1: User creates SSH key pair on their own machine

On their **laptop / system**, they run:

```
ssh-keygen
```

They will see something like:

```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa):
```

They can press **Enter**
OR give a custom name:

```
devuser.pem
```

---

### What files are created?

Two files are created:

| File              | Purpose                            |
| ----------------- | ---------------------------------- |
| `devuser.pem`     | **PRIVATE KEY** (never shared)     |
| `devuser.pem.pub` | **PUBLIC KEY** (shared with admin) |

📌 The `.pem` file stays **ONLY** with the user.

---

## 🔐 Step 2: Optional – set passphrase (recommended)

User may be asked:

```
Enter passphrase (empty for no passphrase):
```

* Passphrase = extra password protection
* If someone steals the key → still cannot use it

In companies:
✔️ Passphrase is recommended

---

## 📤 Step 3: User shares ONLY the public key

The user sends **ONLY** this file (or its content):

```
devuser.pem.pub
```

Example content:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7...
```

They can share it via:

* Email
* Slack
* Ticket
* Git (private repo)

⚠️ **They NEVER share**:

```
devuser.pem
```

---

## 🔒 Why private key is never shared

If someone has the private key:

* They can login as that user
* No password needed
* Full access

So:

```
Private key = identity
```

---

## 🖥️ Step 4: You (admin) add public key to EC2

You paste the public key into:

```
/home/devuser/.ssh/authorized_keys
```

Now the server trusts:

* Anyone who proves they own the matching private key

---

## 🧪 Step 5: How the user logs in

From their machine, the user runs:

```
ssh -i devuser.pem devuser@EC2-IP
```

Important points:

* Command runs on **their laptop**
* Uses **their private key**
* Logs in as **devuser**

---

## 🔍 Step 6: How SSH verifies identity (Simple explanation)

1. Server sends a challenge
2. User signs it with private key
3. Server checks public key
4. Match found ✔️
5. Login allowed 🎉

The private key is **never sent** to the server.

---

## ❌ Common beginner mistakes (VERY IMPORTANT)

❌ Admin generates key and shares PEM
❌ User sends private key via WhatsApp 😬
❌ Storing private keys on server
❌ One key used by multiple users

---

## 🧠 Simple analogy (remember this)

| Real world  | SSH                |
| ----------- | ------------------ |
| House key   | Private key (.pem) |
| Lock design | Public key (.pub)  |
| House owner | EC2 admin          |

---

## ✅ Final summary (Task 3)

> The other user generates their own SSH key pair on their own system using `ssh-keygen`. They keep the private key (`.pem`) securely with them and share only the public key (`.pub`) with the EC2 admin. The admin adds this public key to the user’s `authorized_keys` file, allowing secure SSH access without sharing secrets.

---
