<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# Batch Scripting (Windows CMD) – Complete Guide

This guide covers **everything you need to know about Batch scripting**, from absolute basics to advanced concepts. It is structured step‑by‑step so you can learn, practice, and apply it in real projects.

---

## 1️⃣ What is Batch Scripting?

Batch scripting is a way to **automate tasks in Windows** using `.bat` or `.cmd` files.

### Why Batch Scripts are used

* Automate repetitive tasks
* System administration
* File & folder management
* Application startup automation
* Basic DevOps & CI tasks (Windows servers)

### Batch File Extensions

* `.bat` – Traditional batch file
* `.cmd` – Modern version (recommended)

---

## 2️⃣ Creating & Running a Batch File

### Create a batch file

1. Open Notepad
2. Write commands
3. Save as `script.bat`

### Run a batch file

* Double‑click
* Run from Command Prompt

---

## 3️⃣ Basic Commands

| Command     | Purpose                |
| ----------- | ---------------------- |
| `echo`      | Print text             |
| `@echo off` | Hide command execution |
| `pause`     | Wait for user input    |
| `cls`       | Clear screen           |
| `exit`      | Exit script            |
| `rem`       | Comment                |

---

## 4️⃣ Variables in Batch

### Define a variable

```
set name=Dev
```

### Access variable

```
%name%
```

### Enable delayed expansion

```
setlocal enabledelayedexpansion
!variable!
```

### Environment variables

```
%USERNAME%
%OS%
%DATE%
```

---

## 5️⃣ User Input

```
set /p name=Enter your name:
```

---

## 6️⃣ Conditional Statements (IF)

### Basic IF

```
if %a%==10 echo Equal
```

### IF ELSE

```
if %a%==10 (
  echo Yes
) else (
  echo No
)
```

### IF EXIST

```
if exist file.txt echo Found
```

### Comparison Operators

* EQU – Equal
* NEQ – Not equal
* GTR – Greater than
* LSS – Less than

---

## 7️⃣ Loops in Batch

### FOR loop (files)

```
for %%f in (*.txt) do echo %%f
```

### FOR loop (numbers)

```
for /L %%i in (1,1,5) do echo %%i
```

### FOR /F (command output)

```
for /f "tokens=1" %%a in ('date /t') do echo %%a
```

---

## 8️⃣ GOTO & Labels

```
:START
echo Hello
goto END
:END
echo Done
```

⚠ Avoid excessive `goto` – makes scripts messy

---

## 9️⃣ Functions (CALL)

```
call :myFunc
exit /b

:myFunc
echo Function called
exit /b
```

---

## 🔟 Error Handling

### ERRORLEVEL

```
command
if %errorlevel% neq 0 echo Error occurred
```

### Exit codes

```
exit /b 1
```

---

## 1️⃣1️⃣ File & Folder Operations

| Command    | Purpose       |
| ---------- | ------------- |
| `dir`      | List files    |
| `copy`     | Copy files    |
| `move`     | Move files    |
| `del`      | Delete files  |
| `mkdir`    | Create folder |
| `rmdir`    | Delete folder |
| `xcopy`    | Advanced copy |
| `robocopy` | Reliable copy |

---

## 1️⃣2️⃣ Working with Paths

```
%~dp0   → Script directory
%~nx0   → Script name
```

---

## 1️⃣3️⃣ Command Line Arguments

```
script.bat arg1 arg2
```

```
%1 %2 %3
```

---

## 1️⃣4️⃣ Date & Time Handling

```
%DATE%
%TIME%
```

Custom format using FOR loop

---

## 1️⃣5️⃣ String Operations

* Substring

```
%var:~0,4%
```

* Replace

```
%var:old=new%
```

---

## 1️⃣6️⃣ Arithmetic Operations

```
set /a sum=5+3
```

Supported:

* * − * / %

---

## 1️⃣7️⃣ Delayed Expansion (Important)

Used inside loops

```
setlocal enabledelayedexpansion
```

---

## 1️⃣8️⃣ Logging Output

```
script.bat > output.log
script.bat >> output.log
```

---

## 1️⃣9️⃣ Calling Other Scripts

```
call another.bat
```

---

## 2️⃣0️⃣ Scheduled Tasks

Run batch files using:

* Task Scheduler
* Startup folder

---

## 2️⃣1️⃣ Registry Operations

```
reg add
reg delete
reg query
```

⚠ Use carefully

---

## 2️⃣2️⃣ Networking Commands

| Command    | Use            |
| ---------- | -------------- |
| `ping`     | Connectivity   |
| `ipconfig` | IP info        |
| `net use`  | Network drives |
| `netstat`  | Network stats  |

---

## 2️⃣3️⃣ System Commands

| Command      | Purpose           |
| ------------ | ----------------- |
| `tasklist`   | Running processes |
| `taskkill`   | Kill process      |
| `shutdown`   | Shutdown/restart  |
| `systeminfo` | System details    |

---

## 2️⃣4️⃣ Best Practices

* Always use `@echo off`
* Use comments
* Validate inputs
* Handle errors
* Avoid hard‑coded paths
* Use functions

---

## 2️⃣5️⃣ Real‑World Use Cases

* Backup scripts
* Log cleanup
* App startup automation
* Build pipelines (Windows)
* Server maintenance

---

## 2️⃣6️⃣ Batch vs PowerShell

| Batch   | PowerShell |
| ------- | ---------- |
| Old     | Modern     |
| Limited | Powerful   |
| Simple  | Advanced   |

Batch is still useful for **legacy systems & simple automation**.

---