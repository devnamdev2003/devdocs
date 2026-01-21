<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)

# 🔑 Big Picture: EC2 Access + Linux Users (ONE CLEAR MODEL)

When you create an **EC2 instance**, there are **two separate systems** involved:

## 1️⃣ AWS level (IAM & Key Pair)

Controls:

* **Who can connect to the EC2**
* Uses **SSH keys (.pem)**

## 2️⃣ Linux level (Users & Groups)

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
When you log in, you are a normal user
Root access is **temporary** and **controlled**.

---

## 👥 Giving EC2 access to another person (CORRECT WAY)

You **do NOT** share your PEM file.

## Correct process:

1. **Other person generates their own SSH key**
2. They send you **only the public key**
3. You create a **Linux user** on EC2
4. You add their public key to that user
5. You set **permissions** for what they can access

---

## Why AWS does NOT log you in as root

AWS **disables direct root login by default**.

## Reasons:

1. **Security**

   * Root can delete OS, disks, users
2. **Accidental damage**

   * One wrong command can destroy server
3. **Industry best practice**

   * Least privilege principle

So AWS says:

> “Login as a normal user, become root only when needed.”

---

## 🔐 Then how can `ec2-user` do admin work?

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

## 🚀 How to access root (IMPORTANT)

There are **two correct and safe ways**.

---

## ✅ Method 1: Run a single command as root

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

## ✅ Method 2: Switch to full root shell

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

## ⚠️ Mental model (VERY IMPORTANT)

Think like this:

* **PEM file** → proves who you are
* **Linux user** → decides what you can do
* **sudo** → temporary root power

```
PEM file ≠ root
```

---

## 📌 One-command summary

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

