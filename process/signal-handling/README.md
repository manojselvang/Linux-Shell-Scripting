# Signal Handling Script (Bash)

## 📌 Overview

This script demonstrates how to handle system signals (`SIGINT`, `SIGTERM`) using the `trap` command in Bash.

It ensures that cleanup operations are performed before the script exits.

---

## 🧠 Workflow

1. Print process ID (PID)
2. Define cleanup function
3. Set trap for signals
4. Start a long-running process
5. On receiving signal → execute cleanup

---

## 📜 Script

```bash
./handle_kill_signal.sh
```

---

## ▶️ Usage

```bash
bash handle_kill_signal.sh
```

To test signal handling:

```bash
kill -TERM <PID>
```

Or press:

```bash
Ctrl + C
```

---

## 📤 Example Output

```
Process ID: 12345
Starting long running process
Task running...
Task running...
Kill signal received
Cleaning up...
Cleanup complete
```

---

## 🔑 Key Concepts Used

| Concept       | Explanation                    |
| ------------- | ------------------------------ |
| trap          | Captures signals               |
| SIGINT        | Interrupt signal (Ctrl + C)    |
| SIGTERM       | Termination signal             |
| $$            | Current process ID             |
| infinite loop | Simulates long-running process |

---

## ⚙️ Script Logic Breakdown

### 1. Process Identification

* Uses `$$` to print the current script PID

### 2. Cleanup Function

* Deletes temporary file
* Ensures safe shutdown

### 3. Signal Handling

* `trap` listens for `SIGINT` and `SIGTERM`
* Executes cleanup before exit

### 4. Long Running Process

* Infinite loop (`while true`)
* Writes timestamps to file

---

## ⚠️ Notes

* `/tmp` is used for temporary storage
* Script runs indefinitely until interrupted
* Cleanup ensures no leftover files

---

## 📁 Folder Structure

```bash
process/
  signal-handling/
    handle_kill_signal.sh
    README.md
```
