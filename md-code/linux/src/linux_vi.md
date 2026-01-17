<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 📝 VI Editor (Powerful but Confusing at First)

## What is `vi`?

`vi` is a **terminal-based text editor** in Linux/Unix systems.

* Old
* Extremely powerful
* Available on **almost every Linux server**
* Default editor on many servers (EC2, production machines)

📌 Important:

> Even if Nano is easier, **you MUST know vi**
> Because sometimes **Nano is not installed**, but `vi` always is.

---

## Why `vi` feels difficult for beginners 😵

Because **vi has MODES**.

Nano → type directly
Vi → depends on **which mode you are in**

👉 This is the **most important concept**.

---

# 🔁 VI MODES (MOST IMPORTANT PART)

`vi` works in **three main modes**:

| Mode             | Purpose               |
| ---------------- | --------------------- |
| **Normal mode**  | Navigation + commands |
| **Insert mode**  | Typing text           |
| **Command mode** | Save, quit, search    |

When you open `vi`, you are **NOT in typing mode**.

You start in **Normal mode** ❗

---

## 1️⃣ Normal Mode (Default mode)

This is the **command mode for movement and actions**.

* You **cannot type text**
* Every key is treated as a **command**

Examples:

* `dd` → delete line
* `yy` → copy line
* `p` → paste
* `gg` → go to top

📌 If something weird happens →
You are probably in **Normal mode** 😄

---

## 2️⃣ Insert Mode (Typing mode)

This is where you can **type text normally**.

To enter Insert mode, press:

| Key | Meaning              |
| --- | -------------------- |
| `i` | Insert before cursor |
| `a` | Append after cursor  |
| `o` | New line below       |
| `O` | New line above       |

When Insert mode is active:

* Bottom shows: `-- INSERT --`

To **exit Insert mode**:

```
ESC
```

👉 ESC is your **best friend** in vi.

---

## 3️⃣ Command Mode (Colon `:` mode)

Used for:

* Save
* Quit
* Search
* Replace
* Line numbers

You enter command mode by typing:

```
:
```

(while in Normal mode)

Example:

```
:w
:q
:wq
```

---

# 🚀 Opening a file in vi

```
vi file.txt
```

If file doesn’t exist:

* It will be created when you save

---

# ✍️ BASIC WORKFLOW (VERY IMPORTANT)

This is how **90% of people use vi**:

1. Open file
2. Press `i`
3. Type text
4. Press `ESC`
5. Save and quit

Let’s see commands.

---

# 💾 Save and Exit Commands (MUST KNOW)

| Command | Meaning                     |
| ------- | --------------------------- |
| `:w`    | Save (write)                |
| `:q`    | Quit                        |
| `:wq`   | Save and quit               |
| `:x`    | Save and quit               |
| `:q!`   | Quit without saving (force) |
| `:w!`   | Force save                  |

📌 Examples:

Save only:

```
:w
```

Save and exit:

```
:wq
```

Exit without saving:

```
:q!
```

---

# 🧭 MOVEMENT (Navigation) – Core vi skill

You can use arrow keys, BUT real vi users use:

| Key | Action |
| --- | ------ |
| `h` | Left   |
| `l` | Right  |
| `j` | Down   |
| `k` | Up     |

Why?

* Faster
* Hands stay on keyboard

---

### Line & file movement

| Command | Meaning       |
| ------- | ------------- |
| `0`     | Start of line |
| `$`     | End of line   |
| `gg`    | Go to top     |
| `G`     | Go to bottom  |
| `:10`   | Go to line 10 |

---

# ✂️ DELETE, COPY, PASTE (VERY IMPORTANT)

## Delete

| Command | Action                  |
| ------- | ----------------------- |
| `dd`    | Delete current line     |
| `dw`    | Delete word             |
| `d$`    | Delete till end of line |
| `x`     | Delete one character    |

📌 Delete = cut (stored in buffer)

---

## Copy (Yank)

| Command | Action            |
| ------- | ----------------- |
| `yy`    | Copy current line |
| `yw`    | Copy word         |
| `y$`    | Copy till end     |

---

## Paste

| Command | Action             |
| ------- | ------------------ |
| `p`     | Paste below cursor |
| `P`     | Paste above cursor |

---

# 🔁 Undo and Redo

| Action | Command    |
| ------ | ---------- |
| Undo   | `u`        |
| Redo   | `CTRL + R` |

📌 Undo is **life saver**.

---

# 🔍 SEARCHING (Very useful)

### Search forward

```
/word
```

### Search backward

```
?word
```

Press:

* `n` → next match
* `N` → previous match

---

# 🔄 SEARCH & REPLACE (POWER FEATURE)

Format:

```
:s/old/new/
```

Examples:

Replace first match in line:

```
:s/java/spring/
```

Replace all in line:

```
:s/java/spring/g
```

Replace in entire file:

```
:%s/java/spring/g
```

Replace with confirmation:

```
:%s/java/spring/gc
```

---

# 🔢 Line Numbers (VERY IMPORTANT IN DEBUGGING)

Show line numbers:

```
:set number
```

Hide line numbers:

```
:set nonumber
```

Shortcut:

```
:set nu
```

---

# 📌 VISUAL MODE (Text selection)

Enter Visual mode:

```
v
```

* Move cursor to select text

Commands after selection:

* `d` → delete
* `y` → copy

Visual line mode:

```
V
```

---

# ⚙️ REAL PRODUCTION USAGE EXAMPLES

### Edit config file on EC2

```
vi /etc/nginx/nginx.conf
```

### Edit environment variables

```
vi ~/.bashrc
```

### Edit application properties

```
vi application.properties
```

---

# ⚠️ COMMON BEGINNER MISTAKES

❌ Typing without entering Insert mode
❌ Forgetting to press ESC
❌ Not knowing how to quit
❌ Panic when screen freezes

✅ Solution:

```
ESC
:q!
```

Always works 😄

---

# 🧠 MENTAL MODEL (IMPORTANT)

Think like this:

* **Normal mode** → THINK
* **Insert mode** → TYPE
* **Command mode** → CONTROL

---

# 🆚 VI vs NANO (Quick Comparison)

| Feature            | Nano | Vi          |
| ------------------ | ---- | ----------- |
| Beginner friendly  | ✅    | ❌           |
| Always installed   | ❌    | ✅           |
| Powerful editing   | ❌    | ✅           |
| Used in production | Rare | Very common |

---

# 🧾 MUST-MEMORIZE COMMANDS (Cheat Sheet)

```
i        → insert
ESC      → normal mode
:w       → save
:q       → quit
:wq      → save & quit
:q!      → quit force
dd       → delete line
yy       → copy line
p        → paste
u        → undo
/word    → search
:set nu  → line numbers
```

---

## Final Advice ❤️

Don’t try to **memorize everything at once**.

Start with:

1. `i`
2. `ESC`
3. `:wq`
4. `dd`
5. `/search`

That’s enough for **real-world server work**.

---
