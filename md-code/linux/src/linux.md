<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)


# 🐧 Topic 1: Linux Basics

## 1️⃣ What is Linux?

**Linux is an operating system**, just like:

* Windows
* macOS

But Linux is:

* **Free**
* **Open source**
* **Very powerful**
* **Mostly used on servers**

👉 **AWS uses Linux on most servers (EC2)**

So, when you use AWS, you are **actually using Linux machines**.

---

## 2️⃣ Why Linux is important for AWS?

In AWS:

* EC2 instances mostly run **Linux**
* Docker runs on Linux
* Kubernetes runs on Linux
* CI/CD servers run on Linux

💡 If you know Linux:

* You can manage EC2 easily
* You can debug issues faster
* You can deploy applications confidently

---

## 3️⃣ Linux Distributions (Very Important)

Linux has many versions. These are called **distributions (distros)**.

### Common Linux distros in AWS:

| Distribution     | Used where         |
| ---------------- | ------------------ |
| **Amazon Linux** | Default in AWS EC2 |
| **Ubuntu**       | Very popular       |
| **RHEL**         | Enterprise systems |
| **CentOS**       | Older AWS setups   |

👉 For AWS learning, focus on:

* **Amazon Linux**
* **Ubuntu**

---

## 4️⃣ Linux is Case-Sensitive ⚠

Linux treats:

```
File.txt ≠ file.txt
DEV ≠ dev
```

This is **very important in AWS**, especially:

* File names
* Paths
* Scripts

---

## 5️⃣ Linux Directory Structure (High-Level)

Linux files are organized like a **tree**.

### Important folders you must know:

| Directory | Purpose               |
| --------- | --------------------- |
| `/`       | Root (starting point) |
| `/home`   | User home folders     |
| `/etc`    | Configuration files   |
| `/var`    | Logs & variable data  |
| `/opt`    | Optional software     |
| `/bin`    | Basic commands        |
| `/usr`    | User programs         |

Example:

```
/home/ec2-user
/etc/nginx/nginx.conf
/var/log/messages
```

👉 In AWS, logs are often in `/var/log`

---

## 6️⃣ Root User vs Normal User

### Root user

* Full access
* Can do **anything**
* Very dangerous if misused

### Normal user (Recommended)

* Limited access
* Uses `sudo` for admin tasks

Example:

```bash
sudo yum install nginx
```

👉 On AWS EC2:

* Default user is **NOT root**
* Example users:

  * `ec2-user` (Amazon Linux)
  * `ubuntu` (Ubuntu)

---

## 7️⃣ Linux Shell & Terminal

### Shell

* A program that understands your commands

Common shell:

* **bash** (most common)

### Terminal

* The place where you type commands

In AWS:

* You connect to EC2
* You get a **terminal**
* You run **Linux commands**

---

## 8️⃣ Linux vs Windows (Simple Comparison)

| Linux            | Windows          |
| ---------------- | ---------------- |
| CLI focused      | GUI focused      |
| Lightweight      | Heavy            |
| Free             | Paid             |
| Best for servers | Best for desktop |

AWS = **Linux-first**

---

## 9️⃣ What you should remember from Topic 1

✅ Linux is the backbone of AWS
✅ AWS EC2 mostly runs Linux
✅ Linux is case-sensitive
✅ Know basic directories
✅ Root vs normal user concept

---

# 📁 Topic 2: File & Directory Management (Linux)

## 1️⃣ What is a File & Directory?

* **File** → Stores data
  Example:
  `app.js`, `config.yml`, `log.txt`

* **Directory (folder)** → Stores files and other folders
  Example:
  `/home/ec2-user`, `/var/log`

👉 On AWS EC2, everything you do is inside files & directories.

---

## 2️⃣ Current Working Directory

When you open a terminal, you are **inside a directory**.

Command:

```bash
pwd
```

📌 Shows **where you are now**

Example output:

```
/home/ec2-user
```

---

## 3️⃣ Listing Files & Folders

```bash
ls        # list files
ls -l     # detailed list
ls -a     # show hidden files
ls -la    # detailed + hidden
``` 

* `l` → **long listing format** (Shows detailed information about files)
* `a` → **all files**, including hidden files (those starting with `.`)

### Columns explanation (left to right)

Example line:

```
-rw-rw-r--. 1 ec2-user ec2-user 53142881 Jan  9 13:41 EWA-1.0.0.jar
```

---

#### 🔹 Column 1: File type + Permissions

```
-rw-rw-r--.
```

**Breakdown:**

| Part  | Meaning                                     |
| ----- | ------------------------------------------- |
| `-`   | File type                                   |
| `rw-` | Owner permissions                           |
| `rw-` | Group permissions                           |
| `r--` | Others permissions                          |
| `.`   | SELinux context (Amazon Linux uses SELinux) |

#### File type (first character)

| Symbol | Meaning       |
| ------ | ------------- |
| `-`    | Regular file  |
| `d`    | Directory     |
| `l`    | Symbolic link |

---

#### 🔹 Column 2: Number of links

```
1
```

* For **files** → usually `1`
* For **directories** → number of subdirectories + itself

---

#### 🔹 Column 3: Owner (User)

```
ec2-user
```

* The **user who owns the file**

---

#### 🔹 Column 4: Group

```
ec2-user
```

* The **group** that owns the file

---

#### 🔹 Column 5: File size (in bytes)

```
53142881
```

* Size is always in **bytes**
* Example: `53142881` bytes ≈ **50.7 MB**

---

#### 🔹 Column 6–8: Date & Time (Last Modified)

```
Jan  9 13:41
```
* This shows **last modification time**
* If the file is old, you’ll see **year** instead of time.

---

#### 🔹 Column 9: File / Directory name

```
EWA-1.0.0.jar
```

* Actual name of the file or directory
* Hidden files start with `.`

Example: .bashrc, .ssh

---

### Special entries in your output

#### 🔸 `.` (current directory)

```
drwx------. 3 ec2-user ec2-user 131 Jan  9 15:37 .
```

* Refers to **current directory**

---

#### 🔸 `..` (parent directory)

```
drwxr-xr-x. 3 root root 22 Jan  9 13:15 ..
```

* Refers to **parent directory**

---

## 4️⃣ Changing Directories

```bash
cd folder-name     # go inside folder
cd ..              # go back one level
cd ~               # go to home directory
cd /               # go to root
```

Example:

```bash
cd /var/log
```

---

## 5️⃣ Absolute vs Relative Paths (VERY IMPORTANT)

### Absolute Path

* Starts from `/`
* Works from anywhere

Example:

```
/home/ec2-user/app/config.yml
```

### Relative Path

* Based on current directory

Example:

```
config.yml
../logs/app.log
```

👉 In AWS scripts, **absolute paths are safer**.

---

## 6️⃣ Creating Files & Directories

```bash
touch file.txt         # create empty file
mkdir folder           # create folder
mkdir -p a/b/c         # create nested folders
```
* -p → Parents (Create parent directories as needed.)

---

## 7️⃣ Copying Files & Directories

```bash
cp file1 file2         # copy file
cp file folder/        # copy into folder
cp -r dir1 dir2        # copy directory
```

* First = OLD (source)
* Second = NEW (destination)

Example:

```bash
cp config.yml backup.yml
```

---

## 8️⃣ Moving & Renaming

```bash
mv oldname newname     # rename
mv file folder/        # move
```

Example:

```bash
mv app.log app-old.log
```

---

## 9️⃣ Deleting Files & Directories ⚠

```bash
rm file               # delete file
rm -r folder          # delete folder
rm -rf folder         # force delete (DANGEROUS)
```

* -r → Recursive (Remove the folder and everything inside it, recursively)
* -f → Force (Forcefully remove the folder and all its contents recursively, without asking for confirmation)

⚠ **Important warning**

* Linux has **NO recycle bin**
* `rm -rf /` can destroy the system

👉 Be extra careful on **production EC2 servers**.

---

## 🔟 Useful Shortcuts

```bash
cd .     # current directory
cd ..    # parent directory
cd ~     # home directory
cd /     # root directory
```

---

---

## 1️⃣1️⃣ What you must remember (Exam + Real AWS)

✅ Linux has **no GUI** on EC2
✅ You manage everything via **files & folders**
✅ Paths matter (case-sensitive)
✅ `rm -rf` is dangerous
✅ Absolute paths are safer in AWS scripts


---

# 📄 Topic 3: File Viewing & Editing (Linux)

## 1️⃣ Why this topic is important for AWS?

On AWS EC2, you will:

* Read **log files**
* Edit **configuration files**
* Check **application output**
* Debug errors

---

## 2️⃣ Viewing File Content (Basic)

### `cat` – show entire file

```bash
cat file.txt
```

Use when:

* File is small

⚠ Not good for large log files.

---

### `less` – best command (recommended)

```bash
less file.txt
```

Controls:

* `↑ ↓` → scroll
* `Space` → next page
* `/error` → search
* `q` → quit

---

### `more` – simple pager

```bash
more file.txt
```

Less powerful than `less`.

---

## 3️⃣ Viewing Part of a File

### `head` – beginning of file

```bash
head file.txt
head -n 20 file.txt
```
* -n → Number of lines (Show N number of lines, by defult 10).

### `tail` – end of file

```bash
tail file.txt
tail -n 50 file.txt
```

---

### 🔥 `tail -f` – LIVE log monitoring (VERY IMPORTANT)

```bash
tail -f /var/log/nginx/access.log
```

* -f → Follow (keep following the file and show new lines as they are added)

👉 Used to:

* Monitor running applications
* Debug live issues on EC2

Press `Ctrl + C` to stop.

---

## 4️⃣ Editing Files in Linux

On AWS EC2, you usually edit files using:

* `nano` (easy)
* `vi` / `vim` (powerful)

---

## 5️⃣ `nano` Editor (Beginner Friendly)

```bash
nano file.txt
```

Controls:

* Type → edit
* `Ctrl + O` → save
* `Enter` → confirm
* `Ctrl + X` → exit

👉 Recommended when you are starting AWS.

---

## 6️⃣ `vi` Editor (Basic Knowledge Enough)

Open file:

```bash
vi file.txt
```

### Modes in `vi`

* **Normal mode** → navigation
* **Insert mode** → editing
* **Command mode** → save/exit

### Important commands:

```text
i       → insert mode
Esc     → normal mode
:w      → save
:q      → quit
:wq     → save & quit
:q!     → quit without saving
```

---


## 8️⃣ What you must remember

✅ Use `less` for reading files
✅ Use `tail -f` for live logs
✅ Use `nano` for easy editing
✅ Know basic `vi` commands
✅ Use `sudo` for system files

---

Excellent 👍
Now we are at **Topic 4: File Permissions & Ownership**.
This topic is **CRITICAL for AWS**. Many EC2 issues happen **only because of permissions**.

I’ll explain **slowly**, **clearly**, and with **real AWS examples**.

---

# 🔐 Topic 4: File Permissions & Ownership (Linux)

## 1️⃣ Why permissions are important in AWS?

On AWS EC2:

* Applications fail to start ❌
* Scripts don’t run ❌
* Logs can’t be written ❌

Most of the time the reason is:
👉 **Wrong file permissions**

---

## 2️⃣ Understanding File Permissions

Run:

```bash
ls -l
```

Example output:

```
-rwxr-xr-- 1 ec2-user ec2-user  512 app.sh
```

Let’s break it down.

---

## 3️⃣ Permission Structure (Very Important)

```
-rwx r-x r--
  │    │   │
  │    │   └── Others
  │    └────── Group
  └────────── User (Owner)
```

### Permission letters:

* `r` → read
* `w` → write
* `x` → execute
* `-` → no permission

---

## 4️⃣ User, Group, Others

| Type   | Meaning       |
| ------ | ------------- |
| User   | File owner    |
| Group  | Group owner   |
| Others | Everyone else |

👉 Linux always checks permissions in this order:
**User → Group → Others**

---

## 5️⃣ File vs Directory Permissions

### File

* `r` → read file
* `w` → modify file
* `x` → run file (script)

### Directory

* `r` → list files
* `w` → create/delete files
* `x` → enter directory

👉 Without `x` on a directory, you **cannot cd into it**.

---

## 6️⃣ Changing Permissions `chmod` (change mode)

### Symbolic mode

```bash
chmod u+x file.sh              # add execute to user
chmod g-w file.txt             # remove write from group
chmod o+r file.txt             # add read to others
chmod u=rwx,g=rx,o=r file.txt  # set exact permissions
chmod a+x script.sh            # add execute to all
chmod a-r file.txt             # remove read from all
chmod a=r file.txt             # set read for all
chmod +x script.sh             # add execute to all
```

* `a` means all (user, group, others)
* `u` means user (owner)
* `g` means group
* `o` means others

### Numeric mode (VERY IMPORTANT)

| Number | Permission |
| ------ | ---------- |
| 4      | read       |
| 2      | write      |
| 1      | execute    |

Example:

```bash
chmod 755 app.sh
```

Meaning:

```
User   → 7 (rwx)
Group  → 5 (r-x)
Others → 5 (r-x)
```

---

## 7️⃣ Making a Script Executable (AWS COMMON)

If you see:

```
permission denied
```

Fix:

```bash
chmod +x script.sh
./script.sh
```

👉 Common in **user-data scripts**.

---

## 8️⃣ File Ownership `chown` (change owner)

Change owner:

```bash
chown user file.txt  # user → new owner (user)
```

Change owner & group:

```bash
chown user:group file.txt  # user → new owner, group → new group
```

Example (AWS):

```bash
sudo chown ec2-user:ec2-user app.log 
```

---

## 9️⃣ Why `sudo` is needed

System files are owned by **root**.

Example:

```bash
sudo chmod 644 /etc/nginx/nginx.conf
```

Without `sudo`:

```
Permission denied
```

---

## 🔟 Common AWS Permission Issues

❌ App cannot write logs
❌ Script not executing
❌ Nginx cannot access files
❌ Docker volume permission issues

---

## 1️⃣1️⃣ Real AWS Example

```bash
ls -l /var/www/html
sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 755 /var/www/html
```

* -R means recursive (apply the command to the folder AND everything inside it)

## 1️⃣2️⃣ What you MUST remember

- Permissions = User | Group | Others
- chmod controls access
- chown controls ownership
- 755 is very common in AWS
- sudo is required for system files

---

# 👤 Topic 5: User & Group Management (Linux)

## 1️⃣ Why this topic is important for AWS?

On AWS EC2:

* Multiple people may access one server
* Applications should not run as root
* Security is very important

👉 **Linux users & groups help control access**

---

## 2️⃣ What is a User?

A **user** is an account that can:

* Login to Linux
* Run commands
* Own files
* Run applications

---

## 3️⃣ Root User vs Normal User

### Root user

* Superuser
* Full access
* Can break the system

### Normal user (Recommended)

* Limited permissions
* Uses `sudo` for admin tasks

👉 On AWS:

* You login as **ec2-user** or **ubuntu**
* You use `sudo` when needed

---

## 4️⃣ What is a Group?

A **group** is a collection of users.

Why groups?

* Easier permission management
* Used by applications (nginx, docker, etc.)

---

## 5️⃣ Important User Commands

### Check current user

```bash
whoami
```

### User details

```bash
id
```

---

## 6️⃣ Creating a User (Admin Task)

```bash
sudo useradd devuser
sudo passwd devuser
```

---

## 7️⃣ Switching Users

```bash
su devuser
```

Switch to root:

```bash
sudo su -
```

⚠ Be careful with root.

---

## 8️⃣ Deleting a User

```bash
sudo userdel devuser
```

---

## 9️⃣ Group Management

### Create group

```bash
sudo groupadd devgroup
```

### Add user to group

```bash
sudo usermod -aG devgroup devuser
```

Example (AWS common):

```bash
sudo usermod -aG docker ec2-user
```

---

## 🔟 AWS Real-Life Examples

* Add user for SSH access
* Add user to docker group
* Restrict access to logs
* Avoid using root

---

# ⚙️ Topic 6: Process Management (Linux)

## 1️⃣ What is a Process?

A **process** is:
👉 A **running program** in Linux

Examples:

* Nginx running
* Java application running
* Node.js server running
* SSH session running

If a program is running → it has a **process ID (PID)**.

---

## 2️⃣ Process ID (PID)

Every process has a **unique number** called PID.

Example:

```
nginx → PID 1345
java  → PID 2098
```

👉 PID is used to **monitor or kill** a process.

---

## 3️⃣ Foreground vs Background Process

### Foreground Process

* Runs in terminal
* Blocks the terminal

Example:

```bash
sleep 30  # sleep for 30 seconds
```

Terminal is busy until process stops.

---

### Background Process

* Runs in background
* Terminal is free

Example:

```bash
sleep 30 &  # run in background
```

---

## 4️⃣ Sending Process to Background

If a process is running:

* Press `Ctrl + Z` → pause
* Then run:

```bash
bg
```

---

## 5️⃣ Process States (High-Level)

| State | Meaning  |
| ----- | -------- |
| R     | Running  |
| S     | Sleeping |
| D     | Waiting  |
| Z     | Zombie   |
| T     | Stopped  |

👉 Zombie processes = badly written apps.

---

## 6️⃣ Monitoring Processes

### `ps` – process snapshot

```bash
ps
output: 
    PID TTY          TIME CMD
  48615 pts/7    00:00:00 bash
  49301 pts/7    00:00:00 sleep
  49303 pts/7    00:00:00 ps
```
- PID (Process ID): Unique identifier for each running process.
- TTY (Terminal Type): The terminal associated with the process.
- TIME: The amount of CPU time the process has used.
- CMD (Command): The command that started the process.

```bash
ps aux
```

What this command means
* ps → show running processes
* a → processes for all users
* u → show user-oriented format (CPU, memory, etc.)
* x → include processes not attached to a terminal

Most common:

```bash
ps aux | less
```

```bash
ps -p PID # show specific process by PID
```

---

### `top` – live monitoring (VERY IMPORTANT)

```bash
top
```

Shows:

* CPU usage
* Memory usage
* Running processes

Press `q` to quit.

---

## 7️⃣ Finding a Specific Process

```bash
ps aux | grep nginx
ps aux | grep java
```

Used when:

* App is running but not responding

---

## 8️⃣ Killing Processes (IMPORTANT)

### Graceful stop

```bash
kill PID
```

### Force stop (DANGEROUS)

```bash
kill -9 PID
```

⚠ Use `-9` only if normal kill fails.

---

## 9️⃣ Kill by Name

```bash
pkill nginx
killall node
```

Useful when PID is unknown.

---

## 🔟 AWS Real-Life Examples

### Nginx consuming high CPU

```bash
top
ps aux | grep nginx
sudo kill PID
```

---

## 1️⃣1️⃣ Background Jobs

List jobs:

```bash
jobs
```

Bring to foreground:

```bash
fg  
```

The `fg` command is used in Linux/Unix shells to resume a stopped or background job and bring it to the foreground.

## 1️⃣3️⃣ Background Processes in AWS (nohup)

### What happens with & (background only)
* `&` runs the command in the background
Example:
```bash
java -jar EWA-1.0.0.jar > app.log 2>&1 &
```

✅ What this does:
- Runs the app in the background
- You can still use the same terminal
  
❌ What happens when you:
- Close SSH
- Network disconnects
- Session times out
  
👉 Process gets killed

### Why this happens (important)
Processes started with & still receive SIGHUP (hangup signal)
when the terminal closes.

Linux says:

> “Terminal gone → kill child processes”


### What `nohup` does
Example
nohup java -jar EWA-1.0.0.jar > app.log 2>&1 &


✅ What this does:

* Ignores SIGHUP
* Process keeps running after logout
* Fully detached from terminal

>That’s why nohup = NO HANG UP

| Feature               | `&`     | `nohup &`             |
| --------------------- | ------- | --------------------- |
| Runs in background    | ✅       | ✅                     |
| Survives SSH logout   | ❌       | ✅                     |
| Survives network drop | ❌       | ✅                     |
| Used on servers       | ❌ risky | ✅ common              |
| Creates `nohup.out`   | ❌       | ✅ (if not redirected) |

---

## 1️⃣2️⃣ What you MUST remember

- ✅ Process = running program
- ✅ Every process has PID
- ✅ `top` is your best friend
- ✅ `kill` stops processes
- ✅ Use `kill -9` carefully
- ✅ Background processes are common in AWS

---

# 🌐 Topic 7: Networking Basics (Linux)

## 1️⃣ IP Address & Hostname

### IP Address

An **IP address** uniquely identifies a machine on a network.

Example:

```
172.31.12.45
```

In AWS EC2:

* Private IP → inside VPC
* Public IP → access from internet

---

### Check IP Address

```bash
ip a   # show IP addresses
```

or

```bash
ifconfig  # older command
```

---

### Hostname

A **hostname** is the name of the machine.

Check hostname:

```bash
hostname
```

Set hostname:

```bash
sudo hostnamectl set-hostname my-ec2-server
```

---

## 2️⃣ Network Interfaces

A **network interface** connects your server to the network.

Example:

```
eth0
ens5
```

Check interfaces:

```bash
ip link
```

---

## 3️⃣ Ports & Services (VERY IMPORTANT)

### Port

A **port** is a communication endpoint.

Common ports:

| Port | Service    |
| ---- | ---------- |
| 22   | SSH        |
| 80   | HTTP       |
| 443  | HTTPS      |
| 3306 | MySQL      |
| 8080 | App server |

---

### Check Open Ports

```bash
netstat -tulnp  # Show all TCP ports that are currently listening, with process info.
or
ss -tulnp  # Modern replacement for netstat
```

| Option | Meaning                                       |
| ------ | --------------------------------------------- |
| `-t`   | Show **TCP** connections only                 |
| `-o`   | Show **timers** (retransmit / keepalive info) |
| `-n`   | Show **numeric** addresses (no DNS lookup)    |
| `-l`   | Show **listening (server)** ports             |
| `-p`   | Show **PID / program name** using the port    |


output:
```bash
State   Recv-Q  Send-Q  Local Address:Port  Peer Address:Port  Process
LISTEN  0       128           0.0.0.0:22         0.0.0.0:*
LISTEN  0       128              [::]:22            [::]:*
LISTEN  0       511                 *:80               *:*
LISTEN  0       100                 *:8080             *:*      users:(("java",pid=51635,fd=19))
```
| Column               | Explanation                   |
| -------------------- | ----------------------------- |
| **Proto**            | Protocol (`tcp`, `tcp6`)      |
| **Recv-Q**           | Data waiting to be read       |
| **Send-Q**           | Data waiting to be sent       |
| **Local Address**    | IP:Port on your server        |
| **Foreign Address**  | Client side (who can connect) |
| **State**            | Connection state              |
| **PID/Program name** | Process using the port        |
| **Timer**            | TCP timer info                |



---

## 4️⃣ Connectivity Testing

### `ping` – test network reachability

```bash
ping google.com
ping 8.8.8.8
```

Stop with `Ctrl + C`.

⚠ AWS Security Groups may block ping.

---

### `curl` – test web & APIs (VERY IMPORTANT)

```bash
curl http://localhost
curl http://public-ip
curl https://api.example.com
```

Used to:

* Test APIs
* Check if app is running

---

### `telnet` / `nc` – test port connectivity

```bash
telnet localhost 80
nc -zv localhost 8080
```

---

## 5️⃣ Downloading from Internet

### `wget`

```bash
wget https://example.com/file.zip
```

### `curl` download

```bash
curl -O https://example.com/file.zip
```

Used in:

* App setup
* User-data scripts
* CI/CD pipelines

---

## 6️⃣ AWS Real-Life Debugging Scenario

❌ App not accessible from browser

Steps:

```bash
ip a
ss -tulnp
curl localhost
```

If works locally but not from browser:
👉 Issue is **Security Group / NACL**, not Linux.

---

## 7️⃣ What you MUST remember

- ✅ IP identifies the server
- ✅ Ports expose services
- ✅ `ss -tulnp` shows listening ports
- ✅ `curl` is essential for AWS
- ✅ Download tools are used everywhere

---

# 💾 Topic 8: Disk & Storage Management (Linux)

## 🧱 What is Disk & Storage Management in Linux?

**Disk & Storage Management** means:

* Detecting disks
* Creating partitions
* Formatting filesystems
* Mounting disks
* Managing space
* Monitoring disk usage
* Handling permissions & performance

👉 In simple words:

> **It is how Linux stores, organizes, and accesses your data on disks**

---

## 🖴 Types of Storage Devices in Linux

| Device                  | Example        |
| ----------------------- | -------------- |
| Hard Disk (HDD)         | `/dev/sda`     |
| Solid State Drive (SSD) | `/dev/nvme0n1` |
| USB Drive               | `/dev/sdb`     |
| Virtual Disk (VM / EC2) | `/dev/xvda`    |

---

## 🧭 Disk Naming in Linux

Linux treats **everything as a file**.

| Name             | Meaning         |
| ---------------- | --------------- |
| `/dev/sda`       | First disk      |
| `/dev/sda1`      | First partition |
| `/dev/sdb`       | Second disk     |
| `/dev/nvme0n1p1` | NVMe partition  |

Check disks:

```bash
lsblk
```

---

## 📦 Partitions (Why needed?)

A **partition** divides a disk into logical sections.

Example:

* Disk: 1 TB
* Partition 1: OS
* Partition 2: Home
* Partition 3: Backup

View partitions:

```bash
lsblk
fdisk -l
```

---

## 🛠 Partitioning Tools

| Tool     | Use               |
| -------- | ----------------- |
| `fdisk`  | MBR partitions    |
| `cfdisk` | Menu based        |
| `parted` | GPT partitions    |
| `lsblk`  | Display structure |

Create partition (example):

```bash
sudo fdisk /dev/sdb
```

Common fdisk commands:

* `n` → new partition
* `p` → print table
* `w` → write changes

---

## 🧬 Filesystem (VERY IMPORTANT)

A **filesystem** defines **how data is stored & retrieved**.

| Filesystem | Use              |
| ---------- | ---------------- |
| ext4       | Default Linux    |
| xfs        | High performance |
| ntfs       | Windows          |
| vfat       | USB drives       |

Format partition:

```bash
sudo mkfs.ext4 /dev/sdb1
```

---

## 📌 Mounting (Make storage usable)

Linux needs to **mount** a disk to access it.

### Temporary Mount

```bash
sudo mount /dev/sdb1 /mnt/data
```

Check mounts:

```bash
df -h
mount
```

Unmount:

```bash
sudo umount /mnt/data
```

---

## 📌 Permanent Mount (fstab)

File:

```bash
/etc/fstab
```

Example entry:

```text
/dev/sdb1  /data  ext4  defaults  0  2
```

Apply:

```bash
sudo mount -a
```

⚠️ Wrong fstab = system boot failure

---

## 📊 Disk Usage Monitoring

### Check disk space

```bash
df -h
```

### Check folder size

```bash
du -sh /var/log
```

### Find large files

```bash
find / -size +1G
```

---

## 📂 Inodes (Often ignored but important)

Each file uses an **inode**.

Check inode usage:

```bash
df -i
```

Problem:

> Disk shows free space but still “No space left”

Cause:

> Inodes exhausted

---

## 🔐 Permissions & Ownership

Check:

```bash
ls -l
```

Format:

```text
-rwxr-xr--
```

Change owner:

```bash
sudo chown user:group file
```

Change permission:

```bash
chmod 755 file
```

---

## 🔥 Logical Volume Management (LVM)

LVM allows:

* Resize disks
* Combine multiple disks
* Snapshot backups

### LVM Components

| Component | Meaning         |
| --------- | --------------- |
| PV        | Physical Volume |
| VG        | Volume Group    |
| LV        | Logical Volume  |

Commands:

```bash
pvcreate /dev/sdb
vgcreate vg_data /dev/sdb
lvcreate -L 10G -n lv_data vg_data
```

Format & mount:

```bash
mkfs.ext4 /dev/vg_data/lv_data
mount /dev/vg_data/lv_data /data
```

---

## ☁️ Disk Management in Cloud (AWS EC2)

### List disks:

```bash
lsblk
```

### Extend EBS volume:

```bash
growpart /dev/xvda 1
resize2fs /dev/xvda1
```

---

## 🧯 Disk Errors & Health

Check filesystem:

```bash
fsck /dev/sdb1
```

SMART health:

```bash
smartctl -a /dev/sda
```

---

## 🚨 Common Disk Problems

| Issue        | Reason          |
| ------------ | --------------- |
| Disk full    | Logs, backups   |
| Boot failure | Wrong fstab     |
| Slow IO      | HDD / high load |
| Read-only FS | Disk error      |

---

## 🧠 Important Linux Directories

| Path    | Purpose    |
| ------- | ---------- |
| `/`     | Root       |
| `/home` | User data  |
| `/var`  | Logs       |
| `/tmp`  | Temporary  |
| `/boot` | Boot files |

---

## 🧪 Real-World Example

> **Production server is down due to disk full**

Steps:

```bash
df -h
du -sh /var/*
rm -rf /var/log/*.gz
```

---

## 🎯 Interview-Ready Questions

### Q: What is the difference between partition & filesystem?

* Partition divides disk
* Filesystem organizes data

### Q: What is LVM?

* Logical Volume Manager used to resize and manage disks dynamically

### Q: What happens if fstab is wrong?

* System may fail to boot

---

## 🧾 Must-Know Commands (Cheat Sheet)

```bash
lsblk
df -h
du -sh
mount
umount
fdisk
mkfs
fsck
chmod
chown
```

---

# 📦 Topic 9: Package Management (Linux)

## 📦 What is Package Management?

**Package Management** is the system used to:

* Install software
* Update software
* Remove software
* Manage dependencies
* Keep software secure and up to date

👉 In simple words:

> **It is how Linux installs and manages software safely**

---

## 🧠 What is a Package?

A **package** is:

* A compiled application
* With configuration files
* With dependency information
* With version details

---

## 🏗 Why Package Management Exists

Without package management:

* Manual downloads
* Dependency hell
* Broken systems

With package management:

* Automatic dependency resolution
* Central repositories
* Security updates

---

## 🗂 Package Management Components

| Component       | Purpose                 |
| --------------- | ----------------------- |
| Package         | Software unit           |
| Repository      | Software source         |
| Package Manager | Tool to manage packages |
| Dependency      | Required packages       |

---

## 🧰 Common Linux Package Managers
| Package Manager | Linux Distribution         |
| --------------- | -------------------------- |
| `yum` / `dnf`   | Amazon Linux, RHEL, CentOS |
| `apt`           | Ubuntu, Debian             |
| `pacman`        | Arch Linux                 |
| `zypper`        | SUSE                       |

---
👉 **Amazon Linux is most common in AWS**, so focus mainly on **`yum` / `dnf`**, but **know `apt` basics**.

---

## 1️⃣ `yum` – (Amazon Linux, RHEL, CentOS)

### 🔹 What is `yum`?

`yum` = **Yellowdog Updater Modified**
It downloads software from **repositories**, resolves dependencies, and installs packages.

---

### 🔹 Update package list

```bash
sudo yum check-update
```

**What it does:**

* Checks for available updates
* Does NOT install anything

📌 Use before upgrading servers in AWS.

---

### 🔹 Install a package

```bash
sudo yum install nginx
```

**Meaning:**

* `install` → install software
* `nginx` → package name

AWS examples:

```bash
sudo yum install httpd      # Apache web server
sudo yum install docker    # Docker
sudo yum install git       # Git
```

---

### 🔹 Install without confirmation

```bash
sudo yum install nginx -y
```

`-y` = **yes automatically**

📌 Very common in **EC2 user-data scripts**

---

### 🔹 Remove a package

```bash
sudo yum remove nginx
```
Remove unused deps

```bash
sudo yum autoremove
```

Removes software (not always config files).

---

### 🔹 Update all packages

```bash
sudo yum update
```

or

```bash
sudo yum update -y
```

📌 Used during **EC2 patching & security updates**.

---

### 🔹 Search for a package

```bash
yum search docker
```

Finds package names from repositories.

---

### 🔹 Show package info

```bash
yum info nginx
```

Shows:

* Version
* Size
* Repository
* Description

---

### 🔹 List installed packages

```bash
yum list installed 
```

To check what you installed recently:

```bash
yum history
```

---

### 🔹 Check if a package is installed

```bash
yum list installed nginx
```

---

### 🔹 Clean cache

```bash
sudo yum clean all
```

Clears downloaded package cache.

📌 Used when `yum` behaves incorrectly.

---

## 2️⃣ `dnf` – (Amazon Linux 2023)

### 🔹 What is `dnf`?

`dnf` = **Dandified YUM**
It is the **modern replacement for yum**.

👉 Commands are almost the same.

```bash
sudo dnf install nginx
sudo dnf remove nginx
sudo dnf update -y
dnf search docker
dnf info nginx
```

📌 If AWS exam mentions **Amazon Linux 2023 → think `dnf`**.

---

## 3️⃣ `apt` – (Ubuntu on EC2)

### 🔹 Update package index (VERY IMPORTANT)

```bash
sudo apt update
```

📌 Always run this **before installing anything**.

---

### 🔹 Install a package

```bash
sudo apt install nginx
```

---

### 🔹 Install with auto yes

```bash
sudo apt install nginx -y
```

---

### 🔹 Remove a package

```bash
sudo apt remove nginx
```

Remove + config:

```bash
sudo apt purge nginx
```

---

### 🔹 Upgrade installed packages

```bash
sudo apt upgrade
```

or

```bash
sudo apt upgrade -y
```

---

### 🔹 Full upgrade (handles dependencies)

```bash
sudo apt full-upgrade
```

---

### 🔹 Search package

```bash
apt search docker
```

---

### 🔹 Show package info

```bash
apt show nginx
```

---

### 🔹 List installed packages

```bash
apt list --installed
```

---

## 4️⃣ Repository Management (AWS Important)

### 🔹 What is a repository?

A **repo** is a server that stores packages.

AWS examples:

* Amazon Linux repos
* EPEL (Extra Packages for Enterprise Linux)

---

### 🔹 List yum repositories

```bash
yum repolist
```

or

```bash
dnf repolist
```

---

### 🔹 Enable Amazon Linux extras

```bash
sudo amazon-linux-extras list
```

Install from extras:

```bash
sudo amazon-linux-extras install docker
```

📌 **VERY important for AWS EC2**

---

## 5️⃣ Package Files (`rpm` & `dpkg`)

### 🔹 RPM (Amazon Linux / RHEL)

```bash
rpm -qa
```

List all installed rpm packages.

```bash
rpm -q nginx
```

Check if nginx installed.

---

### 🔹 DPKG (Ubuntu)

```bash
dpkg -l
```

```bash
dpkg -l nginx
```

---

## 6️⃣ Real AWS EC2 Examples 🔥

### 🔹 Install web server on EC2 (Amazon Linux)

```bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

### 🔹 Install Docker on EC2

```bash
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
```

---

### 🔹 EC2 User-Data Script Example

```bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
```

📌 Package commands are **heavily used in user-data**.

---

## 7️⃣ AWS Exam Focus (Remember This)

* ✅ Know **which OS uses which package manager**
* ✅ Understand `install`, `remove`, `update`, `search`
* ✅ Know `-y` flag
* ✅ Know `amazon-linux-extras`
* ✅ Know difference between `yum` / `dnf` / `apt`

---

### 🧠 Simple Rule to Remember

> **Amazon Linux → yum / dnf**
> **Ubuntu → apt**

---

## 🎯 Interview-Ready Questions

### Q: What is a package manager?

> A tool that installs, updates, removes, and manages software along with its dependencies.

### Q: Difference between apt & yum?

* apt → Debian based
* yum/dnf → RHEL based

### Q: What is a repository?

> A centralized storage location for packages.
---

## 🏁 Final Summary

> Package management in Linux ensures **safe, fast, and dependency-aware software installation and maintenance**, making Linux systems stable and secure.

---

# 🧩 Topic 10: Service Management (systemd)

## 🔧 What is Service Management?

**Service Management** means:

* Starting services (like nginx, mysql, ssh)
* Stopping services
* Restarting services
* Enabling services at boot
* Checking service health

👉 In simple words:

> **It is how Linux runs and controls background programs (services/daemons)**

---

## 🧠 What is `systemd`?

`systemd` is the **service manager** in Linux.

* The **init system** of modern Linux
* The **first process** started by the kernel
* Runs with **PID 1**
  
It:
* Starts services
* Stops services
* Restarts services
* Starts services automatically at boot
Check:

```bash
ps -p 1
```

Output:

```
systemd
```
---

## 🔹 Main command: `systemctl`

`systemctl` = **system control**

This is the **only command you need to manage services**.

---

## 🔄 What is a Service / Daemon?

A **service (daemon)** is a program that:

* Runs in background
* Starts at boot (optional)
* Provides functionality

Examples:

* `ssh` → Remote login
* `nginx` → Web server
* `docker` → Container engine
* `mysql` → Database

---

## 🗂 systemd Unit Types

systemd manages **units**.

| Unit Type | Extension  | Purpose             |
| --------- | ---------- | ------------------- |
| Service   | `.service` | Background services |
| Socket    | `.socket`  | Socket activation   |
| Target    | `.target`  | Group of units      |
| Mount     | `.mount`   | Mount points        |
| Timer     | `.timer`   | Scheduled jobs      |

---

## 1️⃣ Start a Service

```bash
sudo systemctl start httpd
```

#### Meaning:

* `start` → start the service **now**
* `httpd` → service name

📌 After starting, service runs **until reboot** (unless enabled).

---

## 2️⃣ Stop a Service

```bash
sudo systemctl stop httpd
```

Stops the service immediately.

📌 Website goes down if web server stops.

---

## 3️⃣ Restart a Service (VERY COMMON)

```bash
sudo systemctl restart httpd
```

Used when:

* Config file changes
* App update
* Debugging issues

📌 Most used command in real AWS work.

---

## 4️⃣ Reload a Service

```bash
sudo systemctl reload httpd
```

#### Difference:

| restart                | reload              |
| ---------------------- | ------------------- |
| Stops & starts service | Reloads config only |
| Causes short downtime  | No downtime         |

📌 Not all services support reload.

---

## 5️⃣ Check Service Status ⭐ (MOST IMPORTANT)

```bash
systemctl status httpd
```

Shows:

* Is service running?
* Error messages
* Logs (last lines)
* PID

📌 **First command to run when something breaks**

---

## 6️⃣ Enable Service at Boot (AWS CRITICAL)

```bash
sudo systemctl enable httpd
```

#### Meaning:

* Service **starts automatically when EC2 reboots**

📌 Without this:

* After EC2 restart → website DOWN ❌

---

## 7️⃣ Disable Service at Boot

```bash
sudo systemctl disable httpd
```

Service will **NOT start on reboot**.

---

## 8️⃣ Start + Enable Together

```bash
sudo systemctl enable --now httpd
```

Meaning:

* Start service now
* Enable it for boot

📌 Clean & professional command.

---

## 9️⃣ List All Services

#### 🔹 All running services

```bash
systemctl list-units --type=service
```

---

#### 🔹 All services (enabled + disabled)

```bash
systemctl list-unit-files --type=service
```

---

## 🔟 Check if Service is Enabled

```bash
systemctl is-enabled httpd
```

Output:

* `enabled`
* `disabled`

---

## 1️⃣1️⃣ Check if Service is Active

```bash
systemctl is-active httpd
```

Output:

* `active`
* `inactive`
* `failed`

---

## 1️⃣2️⃣ View Service Logs (AWS Debugging)

```bash
journalctl -u httpd
```

#### Last logs only:

```bash
journalctl -u httpd -n 20
```

#### Live logs:

```bash
journalctl -u httpd -f
```

📌 Used when:

* Service fails to start
* Port issues
* Permission issues

---

## 1️⃣3️⃣ Common AWS Services & Names

| Service | Name     |
| ------- | -------- |
| Apache  | `httpd`  |
| Nginx   | `nginx`  |
| Docker  | `docker` |
| SSH     | `sshd`   |
| Cron    | `crond`  |

📌 Service name ≠ package name sometimes.

---

## 1️⃣4️⃣ Real AWS EC2 Examples 🔥

### ✅ Install & run Apache (Amazon Linux)

```bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

### ✅ After config change

```bash
sudo vi /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd
```

---

### ✅ Debug service failure

```bash
systemctl status httpd
journalctl -u httpd
```

---

### 1️⃣5️⃣ User-Data Script Example (AWS)

```bash
#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
```

📌 **systemctl works perfectly in user-data**

---

## 1️⃣6️⃣ systemd Files (High Level – Exam Only)

Service files location:

```bash
/etc/systemd/system/
/usr/lib/systemd/system/
```

Example file:

```bash
httpd.service
```

You usually **DON’T edit these in AWS**, just manage them.

---

## 1️⃣7️⃣ systemd vs init (Interview / Exam)

| init               | systemd          |
| ------------------ | ---------------- |
| Old                | Modern           |
| Slow               | Fast             |
| No dependency mgmt | Dependency aware |

---

### 🧠 One-line Rule

> **Install → Start → Enable → Check Status**


## 🧩 Service States

| State            | Meaning            |
| ---------------- | ------------------ |
| active (running) | Service is running |
| inactive         | Not running        |
| failed           | Crashed            |
| enabled          | Starts at boot     |
| disabled         | Manual start       |

---

## ⚙️ Anatomy of a Service File

Location:

```bash
/lib/systemd/system/
```

or

```bash
/etc/systemd/system/
```

Example: `myapp.service`

```ini
[Unit]
Description=My Custom App
After=network.target

[Service]
ExecStart=/usr/bin/python3 /app/main.py
Restart=always
User=ec2-user

[Install]
WantedBy=multi-user.target
```

---

## 🧠 Key Sections Explained

### [Unit]

* Dependencies
* Startup order

### [Service]

* Command to run
* Restart policy
* User/group

### [Install]

* Boot target

---

## 🔁 Reload systemd (IMPORTANT)

After editing service file:

```bash
sudo systemctl daemon-reload
sudo systemctl restart myapp
```

---

## ⏱ systemd Timers (cron replacement)

### Timer example

```ini
[Timer]
OnBootSec=5min
OnUnitActiveSec=1h
```

Enable timer:

```bash
sudo systemctl enable backup.timer
sudo systemctl start backup.timer
```

---

## 🧯 Common systemd Problems

| Problem                | Cause           |
| ---------------------- | --------------- |
| Service fails to start | Wrong path      |
| Permission denied      | Wrong User      |
| Starts then stops      | ExecStart exits |
| Not starting at boot   | Not enabled     |

Debug:

```bash
journalctl -xe
```

---

## 🧪 Common Admin Commands

```bash
systemctl reboot
systemctl poweroff
systemctl daemon-reexec
```

---

## 🎯 Interview-Ready Q&A

### Q: What is systemd?

> systemd is a system and service manager used in modern Linux distributions that initializes the system and manages services.

### Q: What is PID 1?

> The first process started by the kernel, responsible for starting all other services.

### Q: Difference between reload & restart?

* Reload: re-read config
* Restart: stop and start

---

## 🧾 Must-Know Commands Cheat Sheet

```bash
systemctl status
systemctl start
systemctl stop
systemctl restart
systemctl enable
systemctl disable
journalctl
```

---

## 🏁 Final Summary

> `systemd` is the backbone of modern Linux service management, controlling how services start, stop, restart, log, and behave during system boot and runtime.

---


# 🌱 Topic 11: Environment Variables & Shell

## 1️⃣ What are Environment Variables?

**Environment variables** are:
👉 **Key–value pairs** used by the system and applications.

Example:

```
JAVA_HOME=/usr/lib/jvm/java-17
PORT=8080
DB_HOST=localhost
```

👉 In AWS, **environment variables are used everywhere**.

---

## 2️⃣ Why Environment Variables are Important in AWS?

Used for:

* App configuration
* Database credentials
* Ports
* AWS SDK settings
* CI/CD pipelines

👉 Avoid hard-coding values in code.

---

## 3️⃣ Viewing Environment Variables

### View all

```bash
env
```

or

```bash
printenv
```

### View specific variable

```bash
echo $HOME
echo $PATH
```

---

## 4️⃣ PATH Variable (VERY IMPORTANT)

`PATH` tells Linux **where to find commands**.

Check PATH:

```bash
echo $PATH
```

Example output:

```
/usr/local/bin:/usr/bin:/bin
```

👉 If a command is not in PATH → “command not found”.

---

## 5️⃣ Setting Environment Variables (Temporary)

```bash
export APP_ENV=prod
export PORT=8080
```

Valid only:

* For current session
* Until terminal is closed

---

## 6️⃣ Setting Environment Variables (Permanent)

### For current user

Edit:

```bash
nano ~/.bashrc
```

Add:

```bash
export APP_ENV=prod
export JAVA_HOME=/usr/lib/jvm/java-17
```

Apply changes:

```bash
source ~/.bashrc
```

---

### System-wide (All users)

Edit:

```bash
sudo nano /etc/environment
```

Example:

```
APP_ENV=prod
```

---

## 7️⃣ Shell Configuration Files

Important shell files:

| File               | Purpose           |
| ------------------ | ----------------- |
| `~/.bashrc`        | User shell config |
| `~/.bash_profile`  | Login shell       |
| `/etc/profile`     | System-wide       |
| `/etc/environment` | Global variables  |

👉 AWS EC2 user config is usually in `.bashrc`.

---

## 8️⃣ Using Environment Variables in Apps

Example:

```bash
echo $DB_HOST
```

In shell script:

```bash
echo "Running in $APP_ENV mode"
```

---

## 9️⃣ AWS Real-Life Example

### Java App on EC2

```bash
export DB_URL=jdbc:mysql://localhost:3306/appdb
export DB_USER=admin
export DB_PASS=secret
```

App reads these values at runtime.

---

## 🔟 Common AWS Problems

❌ App not picking config
✔ Check env variable
✔ Check `.bashrc`
✔ Restart service

---

## 1️⃣1️⃣ What you MUST remember

✅ Environment variables store config
✅ `PATH` controls command access
✅ `export` sets variables
✅ `.bashrc` is very important
✅ Restart shell or service to apply changes

---

# 🔍 Topic 1️2: Searching & Text Processing (Linux)

## 🔍 What is Searching & Text Processing?

**Searching & Text Processing** means:

* Finding files
* Searching text inside files
* Filtering output
* Modifying text streams
* Analyzing logs & data

👉 In simple words:

> **It is how Linux reads, searches, filters, and transforms text efficiently**

Linux treats almost everything as **text** (logs, configs, outputs).

---

## 🧱 Core Philosophy (VERY IMPORTANT)

Linux tools follow:

> **Do one thing and do it well**

Then you **combine tools using pipes (`|`)**

Example:

```bash
cat log.txt | grep ERROR | sort | uniq -c
```

---

## 📁 Searching Files (find & locate)

### 🔹 `find` – Real-time search

```bash
find /var/log -name "*.log"
```

By size:

```bash
find / -size +100M
```

By modified time:

```bash
find /home -mtime -1
```

Delete files:

```bash
find /tmp -type f -name "*.tmp" -delete
```

---

### 🔹 `locate` – Fast index-based search

```bash
locate nginx.conf
```

Update index:

```bash
sudo updatedb
```

⚠️ May not find newly created files until index updates

---

## 📄 Searching Text Inside Files (`grep`)

### Basic search

```bash
grep "error" app.log
```

Case-insensitive:

```bash
grep -i error app.log
```

Recursive:

```bash
grep -R "password" /etc
```

Line numbers:

```bash
grep -n "failed" auth.log
```

Invert match:

```bash
grep -v "INFO" app.log
```

---

## 🔁 Regular Expressions (Regex Basics)

```bash
grep "^ERROR" app.log   ## line starts with ERROR
grep "failed$" app.log  ## line ends with failed
grep "[0-9]\{3\}" file  ## 3 digits
```

---

## 🧪 Filtering & Transforming Text

### 🔹 `cut` – Column extraction

```bash
cut -d: -f1 /etc/passwd
```

---

### 🔹 `awk` – Powerful text processing

```bash
awk '{print $1, $3}' file.txt
```

Condition:

```bash
awk '$3 > 100 {print $1}' data.txt
```

Sum column:

```bash
awk '{sum+=$2} END {print sum}' sales.txt
```

---

### 🔹 `sed` – Stream editor (modify text)

Replace:

```bash
sed 's/error/ERROR/g' app.log
```

Edit file:

```bash
sed -i 's/8080/9090/g' server.conf
```

Delete lines:

```bash
sed '5d' file.txt
```

---

## 📊 Sorting & Counting

### 🔹 `sort`

```bash
sort file.txt
sort -n numbers.txt
sort -r file.txt
```

---

### 🔹 `uniq`

```bash
uniq file.txt
sort file.txt | uniq
sort file.txt | uniq -c
```

---

### 🔹 `wc` – Word count

```bash
wc file.txt
wc -l file.txt
```

---

## 🔗 Pipes (`|`) – Power of Linux

```bash
grep ERROR app.log | wc -l
```

```bash
ps aux | grep nginx
```

---

## 📂 File Content Viewing

| Command | Use              |
| ------- | ---------------- |
| `cat`   | Show entire file |
| `less`  | Scrollable view  |
| `head`  | First lines      |
| `tail`  | Last lines       |

Live logs:

```bash
tail -f app.log
```

---

## 🧯 Real-World Use Cases

### 🔥 Find errors in logs

```bash
grep -i error /var/log/syslog
```

### 🔥 Top IPs hitting server

```bash
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head
```

### 🔥 Kill process using port

```bash
netstat -tulpn | grep 8080
```

---

## 🧠 Common Mistakes

| Mistake                      | Fix               |
| ---------------------------- | ----------------- |
| Using cat unnecessarily      | Use grep directly |
| Not sorting before uniq      | Always sort       |
| Forgetting quotes            | Quote patterns    |
| Using locate for live search | Use find          |

---

## 🎯 Interview-Ready Questions

### Q: Difference between grep & find?

* grep → search text
* find → search files

### Q: Why awk is powerful?

* It processes structured text & columns

### Q: What is a pipe?

* Connects output of one command to input of another

---

## 🧾 Must-Know Commands Cheat Sheet

```bash
find
locate
grep
awk
sed
cut
sort
uniq
wc
head
tail
```

---

## 🏁 Final Summary

> Searching & text processing tools allow Linux users to **quickly find information, analyze logs, filter outputs, and automate data handling** using simple yet powerful commands.

---

# 🗜️ Topic 13: Compression & Archiving (Linux)

## 1️⃣ What is Archiving vs Compression?

### Archiving

* Combines **multiple files into one**
* Example: `.tar`

### Compression

* Reduces file size
* Example: `.gz`, `.zip`

👉 Very often used together:

```
.tar.gz
```

---

## 2️⃣ `tar` – Archiving Tool (MOST IMPORTANT)

### Create archive

```bash
tar -cvf backup.tar folder/
```

Options:

* `c` → create
* `v` → verbose
* `f` → file name

---

### Extract archive

```bash
tar -xvf backup.tar
```

---

## 3️⃣ Compressed Archives (`tar.gz`)

### Create compressed archive

```bash
tar -czvf backup.tar.gz folder/
```

### Extract compressed archive

```bash
tar -xzvf backup.tar.gz
```

---

## 4️⃣ `gzip` & `gunzip`

### Compress file

```bash
gzip file.log
```

Creates:

```
file.log.gz
```

### Decompress

```bash
gunzip file.log.gz
```

---

## 5️⃣ `zip` & `unzip`

### Create zip

```bash
zip -r backup.zip folder/
```

### Extract zip

```bash
unzip backup.zip
```

👉 `zip` is useful when sharing files with Windows users.

---

## 6️⃣ Backup Basics (AWS Context)

Common backup targets:

* Application files
* Logs
* Database dumps

Example:

```bash
tar -czvf app-backup.tar.gz /opt/app
```

Upload to S3:

```bash
aws s3 cp app-backup.tar.gz s3://my-bucket/
```

---

## 7️⃣ AWS Real-Life Example

### Before EC2 termination

```bash
tar -czvf logs-backup.tar.gz /var/log
```

---

## 8️⃣ Common Mistakes

❌ Forgetting `f` option
❌ Extracting in wrong directory
❌ Overwriting files

---

## 9️⃣ What you MUST remember

✅ `tar` is most important
✅ `.tar.gz` is very common
✅ `zip` for cross-platform
✅ Backups are essential in AWS
✅ Always verify archive

---

# 🔐 Topic 14: SSH & Remote Access

## 🔐 What is SSH?

**SSH (Secure Shell)** is a protocol used to:

* Connect to remote servers securely
* Execute commands remotely
* Transfer files safely
* Manage servers over the network

👉 In simple words:

> **SSH lets you control another computer securely from your terminal**

---

## 🌍 Why SSH is Important

Without SSH:

* Passwords sent in plain text
* Easy hacking

With SSH:

* Encrypted communication
* Secure authentication
* Industry standard for server access

---

## 🧠 How SSH Works (Concept)

1. Client sends connection request
2. Server responds with public key
3. Client verifies server
4. Authentication happens (password or key)
5. Encrypted session starts

---

## 🖥 SSH Basic Command

```bash
ssh user@server_ip
```

Example:

```bash
ssh ec2-user@13.233.45.10
```

---

## 🔑 SSH Authentication Methods

### 1️⃣ Password Authentication

```bash
ssh user@server
```

❌ Less secure

---

### 2️⃣ Key-Based Authentication (BEST PRACTICE)

#### Generate key

```bash
ssh-keygen
```

#### Copy key to server

```bash
ssh-copy-id user@server_ip
```

Or manually:

```bash
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

---

## 🔐 SSH Key Files

| File              | Purpose                   |
| ----------------- | ------------------------- |
| `id_rsa`          | Private key (never share) |
| `id_rsa.pub`      | Public key                |
| `authorized_keys` | Allowed keys              |
| `known_hosts`     | Trusted servers           |

---

## 🔒 File Permissions (VERY IMPORTANT)

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Wrong permissions = SSH login fails ❌

---

## 🚪 SSH Port & Config

Default port: `22`

Config file:

```bash
/etc/ssh/sshd_config
```

Common settings:

```text
PermitRootLogin no
PasswordAuthentication no
Port 2222
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

---

## 📁 File Transfer with SSH

### 🔹 SCP

```bash
scp file.txt user@server:/path
```

Download:

```bash
scp user@server:/path/file.txt .
```

---

### 🔹 RSYNC (Preferred)

```bash
rsync -avz file.txt user@server:/path
```

---

## 🔄 SSH Tunneling & Port Forwarding

#### Local Port Forwarding

```bash
ssh -L 8080:localhost:80 user@server
```

Access remote port locally

---

#### Remote Command Execution

```bash
ssh user@server "df -h"
```

---

## 🧯 Common SSH Errors & Fixes

| Error              | Fix                     |
| ------------------ | ----------------------- |
| Permission denied  | Check key & permissions |
| Connection refused | SSH not running         |
| Host key changed   | Remove from known_hosts |
| Timeout            | Firewall / port blocked |

Fix host key:

```bash
ssh-keygen -R server_ip
```

---

## ☁️ SSH in AWS EC2 (Real-World)

#### Connect:

```bash
ssh -i mykey.pem ec2-user@ec2-ip
```

#### Permissions:

```bash
chmod 400 mykey.pem
```

---

## 🔐 SSH Security Best Practices

✔ Use key-based auth
✔ Disable root login
✔ Change default port
✔ Use firewall
✔ Use fail2ban

---

## 🧪 Advanced SSH Options

```bash
ssh -v user@server
```

```bash
ssh -i key.pem user@server
```

```bash
ssh -o StrictHostKeyChecking=no user@server
```

---

## 🔁 SSH Config File (Client Side)

```bash
~/.ssh/config
```

Example:

```text
Host myserver
  HostName 13.233.45.10
  User ec2-user
  IdentityFile ~/.ssh/mykey.pem
```

Connect:

```bash
ssh myserver
```

---

## 🎯 Interview-Ready Q&A

#### Q: What is SSH?

> SSH is a secure protocol used for remote access and command execution over encrypted connections.

#### Q: Password vs Key authentication?

* Password → weaker
* Key → stronger & secure

#### Q: What is known_hosts?

> Stores server public keys to prevent MITM attacks

---

## 🧾 Must-Know Commands Cheat Sheet

```bash
ssh
ssh-keygen
ssh-copy-id
scp
rsync
chmod
```

---

## 🏁 Final Summary

> SSH is the backbone of secure remote server management, enabling encrypted access, file transfers, and automation across Linux and cloud systems.

---

# 🧠 Topic 15: Bash Scripting Basics

## 🐚 What is Bash?

**Bash (Bourne Again Shell)** is:

* A **command-line shell**
* A **scripting language**
* The default shell on most Linux systems

👉 In simple words:

> **Bash lets you automate tasks by writing commands in a file**

---

## 📜 What is a Bash Script?

A **Bash script** is:

* A text file
* Contains Linux commands
* Executed line by line

File extension:

```text
.sh
```

Example:

```bash
backup.sh
```

---

## 🧱 Structure of a Bash Script

### 1️⃣ Shebang (VERY IMPORTANT)

```bash
#!/bin/bash
```

Tells system which interpreter to use

---

### 2️⃣ Commands

```bash
echo "Hello World"
```

---

## ▶️ Running a Bash Script

### Make executable

```bash
chmod +x script.sh
```

### Run

```bash
./script.sh
```

OR

```bash
bash script.sh
```

---

## 🔣 Variables in Bash

### Declare variable

```bash
name="Dev"
```

### Use variable

```bash
echo "Hello $name"
```

⚠️ No space around `=`

---

## 📥 User Input

```bash
read -p "Enter name: " name
echo "Hello $name"
```

---

## 🔁 Conditional Statements

### if-else

```bash
if [ $age -gt 18 ]; then
  echo "Adult"
else
  echo "Minor"
fi
```

Common operators:

* `-eq` → equal
* `-ne` → not equal
* `-gt` → greater than
* `-lt` → less than

---

## 🔄 Loops

### for loop

```bash
for i in 1 2 3
do
  echo $i
done
```

### while loop

```bash
while true
do
  echo "Running..."
  sleep 1
done
```

---

## 🧠 Functions

```bash
greet() {
  echo "Hello $1"
}

greet Dev
```

---

## 📁 File & Directory Checks

```bash
if [ -f file.txt ]; then
  echo "File exists"
fi
```

```bash
if [ -d /var/log ]; then
  echo "Directory exists"
fi
```

---

## 🔎 Command Line Arguments

```bash
echo "Script name: $0"
echo "First arg: $1"
echo "All args: $@"
```

Run:

```bash
./script.sh arg1 arg2
```

---

## 🔄 Exit Status

```bash
ls /tmp
echo $?
```

`0` → success
Non-zero → error

---

## 🔗 Pipes & Redirection

### Redirect output

```bash
ls > file.txt
```

### Append

```bash
ls >> file.txt
```

### Redirect error

```bash
ls invalid 2> error.txt
```

---

## 🧪 Debugging Bash Scripts

```bash
bash -x script.sh
```

Inside script:

```bash
set -x
```

Stop on error:

```bash
set -e
```

---

## 🧯 Common Mistakes

| Mistake            | Fix               |
| ------------------ | ----------------- |
| Missing shebang    | Add `#!/bin/bash` |
| Spaces in variable | `var=value`       |
| Forget chmod       | `chmod +x`        |
| Using wrong quotes | Use `"`           |

---

## ☁️ Real-World Use Case

### Backup Script Example

```bash
#!/bin/bash
tar -czf backup.tar.gz /home/dev
echo "Backup completed"
```

---

## 🎯 Interview-Ready Questions

### Q: What is Bash?

> Bash is a Unix shell and scripting language used to automate system tasks.

### Q: Difference between `$@` and `$*`?

* `$@` → separate arguments
* `$*` → single string

### Q: What is shebang?

> It specifies the interpreter for the script.

---

## 🧾 Must-Know Bash Commands

```bash
echo
read
if
for
while
case
function
```

---

## 🏁 Final Summary

> Bash scripting allows you to **automate repetitive Linux tasks**, manage servers efficiently, and build powerful command-line tools using simple scripts.

---


# 🔒 Topic 16: Linux Security Basics

## 1️⃣ Firewall Basics

A **firewall** controls:
👉 Which traffic is allowed or blocked.

### Linux firewalls:

* `iptables` (low-level)
* `firewalld`
* `ufw` (Ubuntu)

---

### Check firewall status

Ubuntu:

```bash
sudo ufw status
```

Amazon Linux:

```bash
sudo systemctl status firewalld
```

👉 In AWS, **Security Groups act as the main firewall**, but Linux firewall still matters.

---

## 2️⃣ File Permission Security

Permissions prevent:

* Unauthorized access
* Accidental deletion
* Data leaks

Best practices:

* No `777` permissions
* Use `755` for folders
* Use `644` for files

Example:

```bash
chmod 600 id_rsa
```

---

## 3️⃣ SSH Security (VERY IMPORTANT)

### Best practices:

* Use **key-based authentication**
* Disable password login
* Avoid root login

SSH config file:

```bash
/etc/ssh/sshd_config
```

Important settings:

```
PermitRootLogin no
PasswordAuthentication no
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

---

## 4️⃣ Running Services Securely

### Never run apps as root ❌

Run as:

* `nginx`
* `appuser`
* `docker`

Check service user:

```bash
ps aux | grep nginx
```

---

## 5️⃣ Principle of Least Privilege

Give:

* Only required access
* Only required permissions

Example:

* App user → app folder only
* Log user → logs only

---

## 6️⃣ AWS Security Context

| Layer | Security                      |
| ----- | ----------------------------- |
| AWS   | Security Groups, IAM          |
| Linux | Users, permissions, firewall  |
| App   | Authentication, authorization |

👉 All layers matter.

---

## 7️⃣ Common AWS Security Mistakes

❌ SSH open to `0.0.0.0/0`
❌ Root login enabled
❌ World-writable files
❌ Hard-coded secrets

---

## 8️⃣ AWS Real-Life Example

Secure SSH:

```bash
chmod 400 mykey.pem
sudo nano /etc/ssh/sshd_config
sudo systemctl restart sshd
```

---

## 9️⃣ What you MUST remember

✅ Security is layered
✅ Use key-based SSH
✅ Restrict file permissions
✅ Don’t run apps as root
✅ AWS + Linux security together

---

# 🪵 Topic 17: Logs & Troubleshooting (Linux)

## 1️⃣ What are Logs?

**Logs** are files that record:

* System activity
* Errors
* Application events

👉 Logs tell you **what went wrong and why**.

---

## 2️⃣ System Logs

System logs show:

* Boot issues
* Service failures
* OS-level errors

Common locations:

| Log                 | Purpose                      |
| ------------------- | ---------------------------- |
| `/var/log/messages` | System events (Amazon Linux) |
| `/var/log/syslog`   | System logs (Ubuntu)         |
| `/var/log/dmesg`    | Kernel messages              |
| `/var/log/secure`   | Security & SSH logs          |

View logs:

```bash
less /var/log/messages
```

---

## 3️⃣ Application Logs

Each application has its own logs.

Examples:

* Nginx:

  ```
  /var/log/nginx/access.log
  /var/log/nginx/error.log
  ```
* Docker:

  ```bash
  docker logs container_id
  ```
* Java App:

  ```
  app.log
  ```

---

## 4️⃣ Reading Error Logs (MOST IMPORTANT)

### View last errors

```bash
tail -n 50 error.log
```

### Live error tracking

```bash
tail -f error.log
```

### Search errors

```bash
grep "ERROR" error.log
```

---

## 5️⃣ Service Logs (systemd)

```bash
journalctl -u nginx
journalctl -u nginx -f
```

👉 Used when service fails to start.

---

## 6️⃣ Basic Troubleshooting Flow (VERY IMPORTANT)

When something breaks:

### Step 1: Check service

```bash
systemctl status nginx
```

---

### Step 2: Check logs

```bash
journalctl -u nginx
```

---

### Step 3: Check port

```bash
ss -tulnp
```

---

### Step 4: Test locally

```bash
curl localhost
```

---

### Step 5: Check permissions

```bash
ls -l
```

---

### Step 6: Check disk

```bash
df -h
```

---

## 7️⃣ AWS Real-Life Example

❌ Website not loading

Checklist:

* Is service running?
* Is port open?
* Is app listening?
* Are logs showing errors?
* Is Security Group correct?

---

## 8️⃣ Common AWS Errors & Logs

| Error              | Check            |
| ------------------ | ---------------- |
| 403 Forbidden      | File permissions |
| 502 Bad Gateway    | App crash        |
| Connection refused | Service down     |
| Disk full          | `df -h`          |

---

## 9️⃣ What you MUST remember

✅ Logs explain failures
✅ Always check logs first
✅ `tail -f` for live issues
✅ Follow troubleshooting steps
✅ AWS issues = Linux + AWS configs

---

# ☁️ Topic 18: Linux for Cloud (AWS Context)

## ☁️ What Does “Linux for Cloud (AWS)” Mean?

It means:

> **Using Linux to run, manage, secure, and scale cloud resources on AWS**

In AWS:

* Most servers (**EC2**) run **Linux**
* Most services assume **Linux knowledge**
* Cloud automation = **Linux + scripting**

👉 If you know Linux well, **AWS becomes easy**

---

## 🧠 Why Linux Is So Important in AWS?

| Reason         | Explanation                |
| -------------- | -------------------------- |
| EC2 runs Linux | Amazon Linux, Ubuntu, RHEL |
| Cost           | Linux is free / cheaper    |
| Automation     | Bash, cron, systemd        |
| Security       | SSH, permissions, firewall |
| Performance    | Lightweight & stable       |

---

## 🖥 Linux in AWS = EC2

### EC2 = Virtual Linux Server

Popular Linux AMIs:

* Amazon Linux 2 / Amazon Linux 2023
* Ubuntu 20.04 / 22.04
* RHEL
* CentOS (legacy)

---

## 🔑 Accessing Linux EC2 (SSH)

```bash
ssh -i key.pem ec2-user@EC2_PUBLIC_IP
```

Permissions:

```bash
chmod 400 key.pem
```

Default users:

| OS           | User       |
| ------------ | ---------- |
| Amazon Linux | `ec2-user` |
| Ubuntu       | `ubuntu`   |
| RHEL         | `ec2-user` |

---

## 📁 Linux Filesystem in Cloud Servers

Important directories:

| Path             | Use          |
| ---------------- | ------------ |
| `/`              | Root         |
| `/home/ec2-user` | User data    |
| `/var/log`       | Logs         |
| `/etc`           | Config files |
| `/opt`           | Custom apps  |

Cloud admins live inside `/var` and `/etc`

---

## 📦 Package Management (Cloud Must-Know)

Amazon Linux:

```bash
sudo yum install nginx
```

Ubuntu:

```bash
sudo apt install nginx
```

Update system:

```bash
sudo yum update -y
```

---

## 🔧 Service Management (Production Critical)

AWS apps run as **services**

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

Logs:

```bash
journalctl -u nginx
```

---

## 📊 Monitoring & Logs (Very Important in Cloud)

Check system usage:

```bash
top
htop
free -m
df -h
```

View logs:

```bash
tail -f /var/log/messages
tail -f /var/log/syslog
```

AWS CloudWatch often reads these logs.

---

## 💾 Storage in AWS (Linux View)

AWS Storage → Linux Disk

| AWS            | Linux                       |
| -------------- | --------------------------- |
| EBS Volume     | `/dev/xvda`, `/dev/nvme0n1` |
| S3             | Mounted via tools           |
| Instance Store | Temporary disk              |

Check disks:

```bash
lsblk
df -h
```

Mount EBS:

```bash
mount /dev/xvdf /data
```

---

## 🔐 Linux Security in AWS

### 🔹 SSH Security

* Key-based auth
* Disable root login
* Change SSH port

### 🔹 Permissions

```bash
chmod 600 key.pem
chown ec2-user file
```

### 🔹 Firewall

* Security Groups (AWS)
* iptables / firewalld (Linux)

---

## 🌐 Networking (Linux + AWS)

Check IP:

```bash
ip a
```

Check ports:

```bash
ss -tuln
```

Test connectivity:

```bash
curl localhost
ping google.com
```

AWS Networking concepts mapped to Linux:

| AWS            | Linux             |
| -------------- | ----------------- |
| Security Group | Firewall rules    |
| ENI            | Network interface |
| ALB            | Reverse proxy     |

---

## 🧪 Automation with Bash (Cloud Core Skill)

Example startup script:

```bash
#!/bin/bash
yum install -y nginx
systemctl start nginx
systemctl enable nginx
```

Used in:

* EC2 User Data
* CI/CD pipelines
* Auto Scaling

---

## 🔄 Scaling & Linux

In Auto Scaling:

* Linux boots
* User-data runs
* App starts automatically

Your Linux setup must be:

* Idempotent
* Fast
* Error-free

---

## ☁️ Linux + AWS Services Mapping

| AWS Service | Linux Role          |
| ----------- | ------------------- |
| EC2         | OS & apps           |
| ECS/EKS     | Containers on Linux |
| Lambda      | Linux runtime       |
| CloudWatch  | Linux logs          |
| CodeDeploy  | Linux deployments   |

---

## 🧯 Common Cloud Linux Problems

| Problem           | Cause           |
| ----------------- | --------------- |
| SSH timeout       | SG / NACL       |
| Disk full         | Logs            |
| App stopped       | systemd         |
| Permission denied | chmod/chown     |
| High CPU          | runaway process |

---

## 🎯 Interview-Ready Q&A

### Q: Why Linux is preferred in AWS?

> Linux is lightweight, secure, open-source, and well suited for cloud scalability and automation.

### Q: How do you secure EC2?

* SSH keys
* Security Groups
* OS hardening
* Patch updates

### Q: What is user-data?

> A script executed at first boot to configure the Linux instance.

---

## 🧾 Must-Know Linux Commands for AWS

```bash
ssh
lsblk
df -h
top
systemctl
journalctl
curl
chmod
chown
```

---

## 🏁 Final Summary (Very Important)

> **Linux is the backbone of AWS cloud computing.**
> Mastering Linux means you can deploy, secure, scale, and troubleshoot cloud infrastructure confidently.

---
