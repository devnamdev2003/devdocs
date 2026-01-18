<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 🗑️ How to Safely Delete a User in Linux

When you need to delete a user from your Linux server, follow these steps to ensure it's done safely and completely.

## 1️⃣ Login as a sudo user (NOT the user you want to delete)

```bash
whoami
```

Make sure this is **not** the user you’re deleting.

---

## 2️⃣ Check if the user is currently logged in (recommended)

```bash
who
```

or

```bash
ps -u username
```

If they’re logged in, you can kill their session:

```bash
sudo pkill -u username
```

---

## 3️⃣ Delete the user account

### 🔹 Delete user **and their home directory** (recommended)

```bash
sudo userdel -r username
```

✔ Removes:

* User account
* Home directory (`/home/username`)
* `.ssh/authorized_keys` (SSH access)
* `-r` stands for remove the user’s files.

---

### 🔹 Delete user **without removing home directory**

```bash
sudo userdel username
```

(Not recommended unless you want to keep files)

---

## 4️⃣ (Important) Remove from sudo group if added earlier

If you added the user to sudo:

```bash
sudo deluser username sudo
```

or

```bash
sudo gpasswd -d username sudo
```

---

## 5️⃣ Verify user is deleted

```bash
id username
```

You should see:

```
id: ‘username’: no such user
```

---

## 6️⃣ Double-check SSH access is gone

```bash
ls /home/username
```

You should get:

```
No such file or directory
```

---

## ⚠️ Extra Security Check (Very Important on EC2)

If this was an **AWS EC2 server**, also check:

### 🔹 `authorized_keys` manually (just in case)

```bash
sudo find /home -name authorized_keys
```

🔍 What this command does (in simple words)

- 👉 It searches for all SSH public key files named authorized_keys
- 👉 inside /home directory
- 👉 for every user
- 👉 using admin (sudo) permission

### 🔹 `/etc/ssh/sshd_config`

Make sure no forced user is configured:

```bash
AllowUsers
AllowGroups
```

Restart SSH if you changed anything:

```bash
sudo systemctl restart sshd
```

---

