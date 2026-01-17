<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 🐧 Linux Topics to Know Before AWS

## [🐧 Linux Basics](./linux.html#-topic-1-linux-basics)
  - [1️⃣ What is Linux?](./linux.html#1️⃣-what-is-linux)
  - [2️⃣ Why Linux is important for AWS?](./linux.html#2️⃣-why-linux-is-important-for-aws)
  - [3️⃣ Linux Distributions (Very Important)](./linux.html#3️⃣-linux-distributions-very-important)
  - [4️⃣ Linux is Case-Sensitive ⚠](./linux.html#4️⃣-linux-is-case-sensitive-)
  - [5️⃣ Linux Directory Structure (High-Level)](./linux.html#5️⃣-linux-directory-structure-high-level)
  - [6️⃣ Root User vs Normal User](./linux.html#6️⃣-root-user-vs-normal-user)
  - [7️⃣ Linux Shell \& Terminal](./linux.html#7️⃣-linux-shell--terminal)
  - [8️⃣ Linux vs Windows (Simple Comparison)](./linux.html#8️⃣-linux-vs-windows-simple-comparison)
  - [9️⃣ What you should remember from Topic 1](./linux.html#9️⃣-what-you-should-remember-from-topic-1)

## [📁 File \& Directory Management (Linux)](./linux.html#-topic-2-file--directory-management-linux)
  - [1️⃣ What is a File \& Directory?](./linux.html#1️⃣-what-is-a-file--directory)
  - [2️⃣ Current Working Directory](./linux.html#2️⃣-current-working-directory)
  - [3️⃣ Listing Files \& Folders](./linux.html#3️⃣-listing-files--folders)
  - [4️⃣ Changing Directories](./linux.html#4️⃣-changing-directories)
  - [5️⃣ Absolute vs Relative Paths (VERY IMPORTANT)](./linux.html#5️⃣-absolute-vs-relative-paths-very-important)
  - [6️⃣ Creating Files \& Directories](./linux.html#6️⃣-creating-files--directories)
  - [7️⃣ Copying Files \& Directories](./linux.html#7️⃣-copying-files--directories)
  - [8️⃣ Moving \& Renaming](./linux.html#8️⃣-moving--renaming)
  - [9️⃣ Deleting Files \& Directories ⚠](./linux.html#9️⃣-deleting-files--directories-)
  - [🔟 Useful Shortcuts](./linux.html#-useful-shortcuts)
  - [1️⃣1️⃣ What you must remember (Exam + Real AWS)](./linux.html#1️⃣1️⃣-what-you-must-remember-exam--real-aws)

## [📄 File Viewing \& Editing (Linux)](./linux.html#-topic-3-file-viewing--editing-linux)
  - [1️⃣ Why this topic is important for AWS?](./linux.html#1️⃣-why-this-topic-is-important-for-aws)
  - [2️⃣ Viewing File Content (Basic)](./linux.html#2️⃣-viewing-file-content-basic)
  - [3️⃣ Viewing Part of a File](./linux.html#3️⃣-viewing-part-of-a-file)
  - [4️⃣ Editing Files in Linux](./linux.html#4️⃣-editing-files-in-linux)
  - [5️⃣ `nano` Editor (Beginner Friendly)](./linux.html#5️⃣-nano-editor-beginner-friendly)
  - [6️⃣ `vi` Editor (Basic Knowledge Enough)](./linux.html#6️⃣-vi-editor-basic-knowledge-enough)
  - [8️⃣ What you must remember](./linux.html#8️⃣-what-you-must-remember)

## [🔐 File Permissions \& Ownership (Linux)](./linux.html#-topic-4-file-permissions--ownership-linux)
  - [1️⃣ Why permissions are important in AWS?](./linux.html#1️⃣-why-permissions-are-important-in-aws)
  - [2️⃣ Understanding File Permissions](./linux.html#2️⃣-understanding-file-permissions)
  - [3️⃣ Permission Structure (Very Important)](./linux.html#3️⃣-permission-structure-very-important)
  - [4️⃣ User, Group, Others](./linux.html#4️⃣-user-group-others)
  - [5️⃣ File vs Directory Permissions](./linux.html#5️⃣-file-vs-directory-permissions)
  - [6️⃣ Changing Permissions `chmod` (change mode)](./linux.html#6️⃣-changing-permissions-chmod-change-mode)
  - [7️⃣ Making a Script Executable (AWS COMMON)](./linux.html#7️⃣-making-a-script-executable-aws-common)
  - [8️⃣ File Ownership `chown` (change owner)](./linux.html#8️⃣-file-ownership-chown-change-owner)
  - [9️⃣ Why `sudo` is needed](./linux.html#9️⃣-why-sudo-is-needed)
  - [🔟 Common AWS Permission Issues](./linux.html#-common-aws-permission-issues)
  - [1️⃣1️⃣ Real AWS Example](./linux.html#1️⃣1️⃣-real-aws-example)
  - [1️⃣2️⃣ What you MUST remember](./linux.html#1️⃣2️⃣-what-you-must-remember)

## [👤 User \& Group Management (Linux)](./linux.html#-topic-5-user--group-management-linux)
  - [1️⃣ Why this topic is important for AWS?](./linux.html#1️⃣-why-this-topic-is-important-for-aws-1)
  - [2️⃣ What is a User?](./linux.html#2️⃣-what-is-a-user)
  - [3️⃣ Root User vs Normal User](./linux.html#3️⃣-root-user-vs-normal-user)
  - [4️⃣ What is a Group?](./linux.html#4️⃣-what-is-a-group)
  - [5️⃣ Important User Commands](./linux.html#5️⃣-important-user-commands)
  - [6️⃣ Creating a User (Admin Task)](./linux.html#6️⃣-creating-a-user-admin-task)
  - [7️⃣ Switching Users](./linux.html#7️⃣-switching-users)
  - [8️⃣ Deleting a User](./linux.html#8️⃣-deleting-a-user)
  - [9️⃣ Group Management](./linux.html#9️⃣-group-management)
  - [🔟 AWS Real-Life Examples](./linux.html#-aws-real-life-examples)


## 6️⃣ Process Management

* What is a process
* Foreground vs background process
* Process states
* Monitoring processes
* Killing processes

---

## 7️⃣ Networking Basics

* IP address & hostname
* Network interfaces
* Ports & services
* Connectivity testing
* Downloading from internet

---

## 8️⃣ Disk & Storage Management

* File systems
* Disk usage
* Mounting & unmounting disks
* Block devices
* Storage basics (important for EBS)

---

## 9️⃣ Package Management

* Package managers (yum / apt)
* Installing software
* Updating packages
* Removing packages
* Repositories

---

## 🔟 Service Management (systemd)

* What is a service
* Starting & stopping services
* Restarting services
* Enabling services on boot
* Checking service status

---

## 1️⃣1️⃣ Environment Variables & Shell

* Environment variables
* PATH variable
* Setting variables
* Shell configuration files

---

## 1️⃣2️⃣ Searching & Text Processing

* Searching text in files
* Finding files
* Filtering output
* Basic text processing concepts

---

## 1️⃣3️⃣ Compression & Archiving

* Archive files
* Compress & extract files
* Backup basics

---

## 1️⃣4️⃣ SSH & Remote Access

* What is SSH
* SSH keys
* Remote login
* Copying files over SSH

---

## 1️⃣5️⃣ Bash Scripting Basics

* What is a shell script
* Script structure
* Variables
* Conditions
* Loops

---

## 1️⃣6️⃣ Linux Security Basics

* Firewall basics
* File permission security
* SSH security
* Running services securely

---

## 1️⃣7️⃣ Logs & Troubleshooting

* System logs
* Application logs
* Reading error logs
* Basic troubleshooting flow

---

## 1️⃣8️⃣ Linux for Cloud (AWS Context)

* Linux on EC2
* User-data scripts
* AMI basics
* Linux boot process (high-level)