# 🐚 Bash Script: Job Execution with Local Scope

## 📌 Script

```bash
#!/bin/bash

STATUS="Idle"
JOB_ID=0

execute_job() {

        local STATUS="Running: $1"
        ((JOB_ID++))
        echo "Job Status: $STATUS"

}

execute_job "Database-Backup"
echo "Final Global Status: $STATUS"
echo "Total Jobs: $JOB_ID"
```

---

## 🧠 Explanation

### 🔹 Global Variables

* `STATUS="Idle"`
  → Global variable representing overall job state.

* `JOB_ID=0`
  → Global counter for number of jobs executed.

---

### 🔹 Function: `execute_job()`

#### 📥 Input

* `$1` → Job name (e.g., `Database-Backup`)

#### 🔧 Inside Function

* `local STATUS="Running: $1"`
  → Creates a **local variable** named `STATUS` (does NOT affect global `STATUS`)

* `((JOB_ID++))`
  → Increments global `JOB_ID` by 1

* `echo "Job Status: $STATUS"`
  → Prints the **local STATUS**

---

### 🔹 Function Call

```bash
execute_job "Database-Backup"
```

* Passes `"Database-Backup"` as argument
* Output inside function:

  ```
  Job Status: Running: Database-Backup
  ```

---

### 🔹 After Function Execution

* `echo "Final Global Status: $STATUS"`
  → Still prints **Idle** (global variable unchanged)

* `echo "Total Jobs: $JOB_ID"`
  → Prints `1` (global variable updated)

---

## ⚠️ Key Concept: Local vs Global Scope

| Variable | Scope  | Value Inside Function    | Value Outside Function |
| -------- | ------ | ------------------------ | ---------------------- |
| STATUS   | Local  | Running: Database-Backup | Idle                   |
| JOB_ID   | Global | Incremented              | 1                      |

---

## 📊 Output

```
Job Status: Running: Database-Backup
Final Global Status: Idle
Total Jobs: 1
```

---

## 🚀 Key Takeaways

* `local` keyword restricts variable scope to the function
* Global variables can still be modified inside functions unless declared local
* Useful for avoiding unintended variable overwrites

---
