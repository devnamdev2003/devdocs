# 🐧 Linux Basics You MUST Know Before AWS

Think of Linux commands in **8 core groups**.

---

## 1️⃣ File & Directory Commands (MOST USED)

### 📂 `pwd`

```bash
pwd
```

Shows **current directory**

📌 Used when navigating EC2.

---

### 📂 `ls`

```bash
ls
ls -l
ls -la
```

| Option | Meaning           |
| ------ | ----------------- |
| `-l`   | long listing      |
| `-a`   | show hidden files |

📌 Used all the time.

---

### 📂 `cd`

```bash
cd /var/log
cd ~
cd ..
```

📌 Move between directories.

---

### 📄 `touch`

```bash
touch file.txt
```

Creates empty file.

---

### 📄 `cat`

```bash
cat file.txt
```

Show file content.

---

### 📄 `less` (IMPORTANT)

```bash
less file.txt
```

Scroll large files (logs).

Keys:

* `q` → quit
* `/` → search

---

### 📄 `head` / `tail`

```bash
head file.txt
tail file.txt
tail -f /var/log/messages
```

📌 `tail -f` = live logs (AWS debugging).

---

### 📂 `mkdir`

```bash
mkdir logs
mkdir -p app/data
```

---

### 📂 `rm`

```bash
rm file.txt
rm -r folder
rm -rf folder
```

⚠ Dangerous:

* `-r` → recursive
* `-f` → force

---

### 📂 `cp`

```bash
cp file1 file2
cp -r dir1 dir2
```

---

### 📂 `mv`

```bash
mv old.txt new.txt
mv file.txt /tmp/
```

Rename OR move.

---

## 2️⃣ File Permissions & Ownership (AWS CRITICAL)

### 🔐 `chmod`

```bash
chmod +x script.sh
chmod 755 script.sh
```

📌 Used for:

* Scripts
* User-data
* Deployments

---

### 👤 `chown`

```bash
sudo chown ec2-user:ec2-user file.txt
```

📌 Fix permission errors in EC2.

---

### 👀 `whoami`

```bash
whoami
```

Shows current user.

---

### 👀 `id`

```bash
id
```

Shows UID, GID.

---

## 3️⃣ User & Privilege Commands

### 🔑 `sudo`

```bash
sudo yum install nginx
```

📌 Required for:

* Installing packages
* Starting services
* Editing system files

---

### 👥 `su`

```bash
su -
```

Switch to root (not recommended often).

---

## 4️⃣ Package Management (Already Covered – Quick List)

### Amazon Linux

```bash
yum install
yum remove
yum update
dnf install
```

### Ubuntu

```bash
apt update
apt install
apt remove
```

📌 Used in **user-data scripts**.

---

## 5️⃣ Service Management (systemd)

### 🔧 `systemctl`

```bash
systemctl start httpd
systemctl stop httpd
systemctl restart httpd
systemctl enable httpd
systemctl status httpd
```

📌 AWS = services must survive reboot.

---

### 📜 `journalctl`

```bash
journalctl -u httpd
journalctl -u httpd -f
```

📌 Debug EC2 issues.

---

## 6️⃣ Networking Commands (AWS IMPORTANT)

### 🌐 `ip`

```bash
ip a
```

Shows IP address.

---

### 🌐 `ss`

```bash
ss -tuln
```

Shows listening ports.

---

### 🌐 `curl`

```bash
curl http://localhost
```

📌 Test web server.

---

### 🌐 `ping`

```bash
ping google.com
```

📌 Check connectivity.

---

### 🌐 `netstat` (older)

```bash
netstat -tuln
```

---

## 7️⃣ Process Management

### ⚙ `ps`

```bash
ps aux
```

---

### ⚙ `top`

```bash
top
```

📌 Monitor CPU & memory.

---

### ⚙ `kill`

```bash
kill PID
kill -9 PID
```

📌 Stop stuck processes.

---

## 8️⃣ Disk & Memory Commands

### 💾 `df` — Disk Free (EBS usage)

```bash
df -h
```
What df means

- df → Disk Free
- shows disk space per filesystem

-h flag

- -h → human-readable
- Shows sizes in GB / MB instead of bytes


### 💾 `du` — Directory size

```bash
du -sh /var/log # shows size of /var/log
```

What du means
- du → Disk Usage
- Shows how much space files/directories consume

Flags explained
- -s → summary only (not every file)
- -h → human-readable


### 💾 `free` — RAM usage

```bash
free -m 
```

- Shows memory (RAM) usage
- `-m` flag:Displays values in MB

---

### 💾 `lsblk` — List block devices (EBS volumes)

```bash
lsblk   # lists all block devices
```

📌 Used when attaching EBS volume.

---

## 9️⃣ Search & Text Processing (Logs)

### 🔍 `grep`

```bash
grep error app.log
grep -i error app.log
```

📌 MOST used for logs.

---

### 🔍 `find`

```bash
find / -name app.log
```

---

## 🔟 SSH & Remote Access

### 🔐 `ssh`

```bash
ssh -i key.pem ec2-user@IP
```

---

### 🔐 `scp`

```bash
scp file.txt ec2-user@IP:/home/ec2-user/
```

---

## 1️⃣1️⃣ Environment & Shell Basics

### 🌱 `env`

```bash
env
```

---

### 🌱 `export`

```bash
export APP_ENV=prod
```

📌 Used in deployments.

---

### 🌱 `echo`

```bash
echo $APP_ENV
```

---

## 1️⃣2️⃣ AWS User-Data Script Essentials

```bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
```

📌 Requires:

* `chmod +x`
* Correct commands

---