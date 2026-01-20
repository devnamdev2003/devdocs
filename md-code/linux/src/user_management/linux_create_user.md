<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../../src)


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

When you create a user with `useradd`, **no password is set**.

### Set password:

```bash
sudo passwd devuser
```

Enter a new password → done ✅

To **list all users in Linux**, use:

```bash
cat /etc/passwd
```

If you want **only usernames (clean list)**:

```bash
cut -d: -f1 /etc/passwd
```

To see **currently logged-in users**:

```bash
who
```
To **switch to another user in Linux**:

```bash
su - username
```

OR no password needed, using sudo (recommended):

```bash
sudo su - username
```

To go back to your previous user:

```bash
exit
```

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

## 🖥️ Step 4: How the user logs in

From their machine, the user runs:

```
ssh -i devuser.pem devuser@EC2-IP
```

Important points:

* Command runs on **their laptop**
* Uses **their private key**
* Logs in as **devuser**

---

## 🔍 Step 5: How SSH verifies identity (Simple explanation)

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


