<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

---

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

