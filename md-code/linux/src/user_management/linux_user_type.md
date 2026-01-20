<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../../src)

# Linux has **three types of users**:

### 🔹 1. System users

Created automatically by Linux **during OS installation**.

Examples from your list:

```
root
bin
daemon
adm
mail
sshd
systemd-network
chrony
apache
```

✅ These users:

* Are used by the **OS and services**
* **Cannot log in**
* Usually have `/sbin/nologin` as their shell

Example:

```
sshd:x:74:74:Privilege-separated SSH:/usr/share/empty.sshd:/sbin/nologin
```

➡ SSH service runs as `sshd` user
➡ No human login allowed

---

### 🔹 2. Service / Application users

Created when software is installed.

Examples:

```
apache
dbus
rpc
tcpdump
ec2-instance-connect
```

Why they exist:

* For **security**
* Each service runs with **limited permissions**

Example:

```
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
```

➡ Apache web server runs as `apache` user

---

### 🔹 3. Normal (human) users 👤

These are **real login users**.

From your system:

```
ec2-user
devuser
```

✔ These users:

* Have `/bin/bash`
* Have home directories
* Can log in

Example:

```
devuser:x:1002:1002::/home/devuser:/bin/bash
```

---

## 2️⃣ You created only these users 👇

You said:

> *i create only two user devuser, rijuldev*

That is **correct** ✅

These are the users **you created**:

```
rijuldev
devuser
```

Additionally:

```
ec2-user
```

➡ Created **automatically by AWS EC2**

---

### 🔍 `who` means:

> "Show users **currently logged in**"

Right now:

* Only **you** are connected
* Probably via **one SSH session**
* No other users are logged in

So `who` output is empty or minimal
👉 **This is normal**

Try this:

```bash
whoami
```

You’ll see:

```
ec2-user
```

---

## 4️⃣ How to list only real login users?

### 🔹 Show users with `/bin/bash`

```bash
grep "/bin/bash" /etc/passwd
```

Output will be something like:

```
root
ec2-user
rijuldev
devuser
```

✔ These are **actual login users**

---

## 5️⃣ Summary (easy to remember 🧠)

| Type         | Example                           | Can login? |
| ------------ | --------------------------------- | ---------- |
| System user  | `sshd`, `systemd-*`               | ❌ No       |
| Service user | `apache`, `dbus`                  | ❌ No       |
| Human user   | `devuser`, `rijuldev`, `ec2-user` | ✅ Yes      |

---