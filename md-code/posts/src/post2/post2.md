<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../)


# Can I run Apache and Nginx on the same AWS EC2 instance?

![image1](https://devnamdev2003.github.io/devdocs/static/img/posts/post2/post2_m.png)

Yes ✅ **you can install another web server like Nginx**,
but there is **one important rule** you must understand first.
---

## 1️⃣ Can multiple web servers be installed?

### ✔ YES — installed

### ❌ NO — running on the same port (by default)

You can **install**:

* `httpd` (Apache)
* `nginx`

at the **same time**.

But you **cannot run both on port 80 at the same time**.

---

## 2️⃣ Why port 80 is the problem

By default:

* Apache (`httpd`) → listens on **port 80**
* Nginx → listens on **port 80**

Only **one process** can bind to a port.

So:

* One will start ✅
* The other will fail ❌

---

## 3️⃣ Check if Apache is currently running

```bash
sudo systemctl status httpd
```

If you see:

```text
Active: active (running)
```

👉 Apache is running on port 80.

---

## 4️⃣ You can safely install Nginx now

Installing does **not affect Apache**.

```bash
sudo yum install nginx -y
```

This only:

* Downloads packages
* Installs files
* Does NOT start nginx automatically

---

## 5️⃣ What happens if you start Nginx now?

If Apache is running:

```bash
sudo systemctl start nginx
```

You’ll likely see:

```text
Failed to start nginx.service: Address already in use
```

This is **normal**, not an error in installation.

---

## 6️⃣ Two safe ways to use both web servers

### ✅ Option 1: Stop Apache, use Nginx

```bash
sudo systemctl stop httpd
sudo systemctl disable httpd
```

Then:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

👉 Now Nginx uses port 80.

---

### ✅ Option 2: Run both using different ports (Learning setup)

Change Nginx port to **8080**.

```bash
sudo vi /etc/nginx/nginx.conf
```

Change:

```nginx
listen       80;
```

To:

```nginx
listen       8080;
```

Then:

```bash
sudo systemctl start nginx
```

Access:

```text
http://<EC2-IP>:8080
```

---

## 7️⃣ Check which service is using port 80

Very important command:

```bash
sudo ss -tulnp | grep :80
```

or

```bash
sudo lsof -i :80
```

This tells you **exactly which process** is using the port.

---

## 8️⃣ Why would someone install both?

Common real-world reasons:

* Learning & comparison
* Migrating from Apache → Nginx
* Apache for legacy apps, Nginx as reverse proxy
* Load balancing setup

---

## 9️⃣ AWS EC2 security group reminder ⚠️

Make sure:

* Port **80** is allowed (HTTP)
* Port **8080** is allowed (if used)

Security Group → Inbound rules

---

## ✅ Final Answer (Simple)

✔ You **can install** Nginx even if Apache exists
✔ You **cannot run both on port 80**
✔ Stop one OR change port
✔ This is normal Linux behavior

---
