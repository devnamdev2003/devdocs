<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 🔹 What is `curl`?

`curl` stands for **Client URL**.

It is a **command-line tool** used to **send requests to URLs** and **get responses** from servers.

👉 In simple words:

> **curl is used to talk to servers from the terminal**

You can:

* Call APIs (REST APIs)
* Download files
* Upload files
* Send GET, POST, PUT, DELETE requests
* Send headers, tokens, cookies
* Test backend APIs (Django, Spring Boot, Node, etc.)

---

# 🔹 Where is `curl` used?

* Backend developers (API testing)
* DevOps (health checks, automation)
* Cloud engineers (AWS, servers)
* CI/CD pipelines
* Debugging production APIs

---

# 🔹 Is curl installed by default?

| OS          | Status               |
| ----------- | -------------------- |
| Linux       | ✅ Yes                |
| macOS       | ✅ Yes                |
| Windows 10+ | ✅ Yes (new versions) |

Check:

```bash
curl --version
```

---

# 🔹 Basic curl syntax

```bash
curl [options] URL
```

Example:

```bash
curl https://example.com
```

👉 This sends a **GET request** to the server.

---

# 🔹 HTTP Methods in curl

| Method | Purpose             |
| ------ | ------------------- |
| GET    | Fetch data          |
| POST   | Create data         |
| PUT    | Update full data    |
| PATCH  | Update partial data |
| DELETE | Remove data         |

---

# 🔹 GET Request (Most common)

```bash
curl https://api.example.com/users
```

With query params:

```bash
curl "https://api.example.com/users?id=10"
```

---

# 🔹 Show full response (headers + body)

```bash
curl -i https://example.com
```

---

# 🔹 Show only headers

```bash
curl -I https://example.com
```

---

# 🔹 Pretty print JSON response

```bash
curl https://api.example.com/users | jq
```

(`jq` is a JSON formatter tool)

---

# 🔹 POST Request (Send data)

### Send JSON data

```bash
curl -X POST https://api.example.com/users \
-H "Content-Type: application/json" \
-d '{"name":"Dev","age":22}'
```

### Explanation:

* `-X POST` → HTTP method
* `-H` → Header
* `-d` → Data (body)

---

# 🔹 PUT Request (Update)

```bash
curl -X PUT https://api.example.com/users/1 \
-H "Content-Type: application/json" \
-d '{"name":"Dev","age":23}'
```

---

# 🔹 PATCH Request (Partial update)

```bash
curl -X PATCH https://api.example.com/users/1 \
-H "Content-Type: application/json" \
-d '{"age":24}'
```

---

# 🔹 DELETE Request

```bash
curl -X DELETE https://api.example.com/users/1
```

---

# 🔹 Sending Headers (Auth tokens, etc.)

```bash
curl https://api.example.com/profile \
-H "Authorization: Bearer YOUR_TOKEN"
```

Multiple headers:

```bash
curl https://api.example.com \
-H "Accept: application/json" \
-H "User-Agent: curl-test"
```

---

# 🔹 Authentication with curl

### Basic Auth

```bash
curl -u username:password https://api.example.com
```

### Bearer Token

```bash
curl -H "Authorization: Bearer TOKEN" https://api.example.com
```

---

# 🔹 Upload file using curl

```bash
curl -X POST https://api.example.com/upload \
-F "file=@image.png"
```

---

# 🔹 Download file using curl

```bash
curl -O https://example.com/file.zip
```

Rename file:

```bash
curl -o myfile.zip https://example.com/file.zip
```

---

# 🔹 Follow redirects

```bash
curl -L https://short.url
```

---

# 🔹 Save response to file

```bash
curl https://api.example.com/data -o data.json
```

---

# 🔹 Timeout in curl

```bash
curl --max-time 10 https://example.com
```

---

# 🔹 Silent mode (no progress)

```bash
curl -s https://example.com
```

---

# 🔹 Verbose / Debug mode (VERY IMPORTANT)

```bash
curl -v https://example.com
```

👉 Shows:

* DNS lookup
* TLS handshake
* Request headers
* Response headers

---

# 🔹 Common curl options (Must know)

| Option | Meaning                 |
| ------ | ----------------------- |
| `-X`   | HTTP method             |
| `-H`   | Header                  |
| `-d`   | Data                    |
| `-i`   | Include headers         |
| `-I`   | Only headers            |
| `-v`   | Verbose                 |
| `-s`   | Silent                  |
| `-o`   | Output file             |
| `-O`   | Save with original name |
| `-L`   | Follow redirects        |
| `-u`   | Authentication          |

---

# 🔹 curl vs Postman

| curl            | Postman               |
| --------------- | --------------------- |
| CLI based       | GUI based             |
| Lightweight     | Heavy                 |
| Used in servers | Used in local testing |
| Automatable     | Manual                |

👉 **In real projects, both are used**

---

# 🔹 curl in Backend Development (Your case)

Since you work with **Django APIs & Angular**, curl is useful for:

* Testing API endpoints without frontend
* Checking auth headers
* Debugging POST/GET issues
* Server health checks on EC2

Example for Django:

```bash
curl http://127.0.0.1:8000/api/expenses/
```

---

# 🔹 Common curl mistakes ❌

1. Forgetting quotes around JSON
2. Missing `Content-Type`
3. Wrong HTTP method
4. Sending GET with `-d`
5. Forgetting `-L` for redirects

---

# 🔹 Interview-ready answer

**Q: What is curl?**

> curl is a command-line tool used to transfer data between a client and a server using protocols like HTTP, HTTPS, FTP, etc. It is commonly used for testing APIs, downloading/uploading files, and debugging network requests.

---

# 🔹 When should you use curl?

* When you don’t have frontend
* When debugging APIs on server
* When automating API calls
* When Postman is not available

---
