<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# 📝 Nano Editor (Beginner Friendly)

## What is Nano?

**Nano** is a **terminal-based text editor** in Linux.

📌 Think of Nano like:

* **Notepad**, but inside the terminal
* Very easy compared to `vi` / `vim`

---

## How to open Nano

### Open a file (or create if not exists)

```
nano file.txt
```

* If `file.txt` exists → it opens
* If not → Nano creates it

---

## Nano screen layout

When Nano opens, you’ll see:

* **Top** → File name
* **Middle** → Text area (where you type)
* **Bottom** → Shortcut keys

Example at bottom:

```
^G Get Help   ^O Write Out   ^X Exit
```

👉 `^` means **CTRL**

So:

* `^X` = `CTRL + X`
* `^O` = `CTRL + O`

---

## MOST IMPORTANT Nano commands ⭐

### 1️⃣ Save file

```
CTRL + O
```

* Write Out (save)
* Press **Enter** to confirm file name

---

### 2️⃣ Exit Nano

```
CTRL + X
```

If file is not saved:

* Nano will ask → **Save? (Y/N)**

---

### 3️⃣ Cut a line

```
CTRL + K
```

* Cuts (removes) the current line
* Works like **cut**, not copy

---

### 4️⃣ Paste a line

```
CTRL + U
```

* Pastes the last cut line

---

### 5️⃣ Search text

```
CTRL + W
```

* Search for a word in the file

---

### 6️⃣ Replace text

```
CTRL + \
```

* Search and replace

---

## Navigation commands 🧭

| Command    | Action        |
| ---------- | ------------- |
| Arrow keys | Move cursor   |
| `CTRL + A` | Start of line |
| `CTRL + E` | End of line   |
| `CTRL + Y` | Page up       |
| `CTRL + V` | Page down     |

---

## Selecting text (Mark mode)

### Start selection

```
CTRL + ^
```

(or `CTRL + SHIFT + 6`)

* Move cursor to select text

### Cut selected text

```
CTRL + K
```

---

## Undo / Redo

| Action | Command   |
| ------ | --------- |
| Undo   | `ALT + U` |
| Redo   | `ALT + E` |

---

## Show line numbers (very useful)

Inside Nano:

```
ALT + N
```

Or open with line numbers:

```
nano -l file.txt
```

---

## Help inside Nano 🆘

```
CTRL + G
```

Shows:

* All commands
* Key combinations

---

## Real-world usage examples (VERY COMMON)

### Edit config file

```
nano /etc/nginx/nginx.conf
```

### Edit app config

```
nano application.properties
```

### Edit crontab file

```
crontab -e
```

(Default editor is often Nano)

---

## Why Nano is beginner-friendly ❤️

✔ No modes (unlike vim)
✔ Commands always visible
✔ Easy save & exit
✔ Simple shortcuts

---

## Quick cheat sheet 📌

| Task      | Command         |
| --------- | --------------- |
| Open file | `nano file.txt` |
| Save      | `CTRL + O`      |
| Exit      | `CTRL + X`      |
| Cut line  | `CTRL + K`      |
| Paste     | `CTRL + U`      |
| Search    | `CTRL + W`      |
| Replace   | `CTRL + \`      |
| Help      | `CTRL + G`      |

---