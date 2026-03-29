# System Status Check Script (Bash)

## 📌 Overview

This script checks basic system conditions based on user input.

It supports two modes:

- **CPU Check** → evaluates current CPU load
- **Log Check** → verifies if a system log file exists

---

## 🧠 Workflow

1. Read user input (`$1`)
2. Check if input is `cpu` or `log`
3. Perform condition-based evaluation
4. Print result
5. Handle invalid input

---

## 📜 Script

```bash
#!/bin/bash

CURRENT_LOAD=85

if [[ "$1" == "cpu" ]]; then
        if [[ "$CURRENT_LOAD" -gt 80 ]]; then
                echo "Result: CPU Critical"
        elif [[ "$CURRENT_LOAD" -gt 60 ]]; then
                echo "Result: CPU Elevated"
        else
                echo "Result: CPU Normal"
        fi

elif [[ "$1" == "log" ]]; then
        if [[ -f "/var/log/syslog" ]]; then
                echo "Result: Log Active"
        else
                echo "Result: Log Missing"
        fi

else
        echo "Error: Invalid selection"
fi
````

---

## 🔍 Script Explanation

### 1. Shebang

```bash
#!/bin/bash
```

✔ Specifies Bash as the interpreter

---

### 2. Variable Initialization

```bash
CURRENT_LOAD=85
```

✔ Stores a simulated CPU load value
✔ Used for comparison

---

### 3. Input Handling

```bash
if [[ "$1" == "cpu" ]]; then
```

✔ `$1` → first command-line argument
✔ Determines execution path

---

### 4. CPU Status Logic

```bash
if [[ "$CURRENT_LOAD" -gt 80 ]]; then
        echo "Result: CPU Critical"
elif [[ "$CURRENT_LOAD" -gt 60 ]]; then
        echo "Result: CPU Elevated"
else
        echo "Result: CPU Normal"
fi
```

✔ `-gt` → numeric comparison

| Condition | Output       |
| --------- | ------------ |
| > 80      | CPU Critical |
| > 60      | CPU Elevated |
| ≤ 60      | CPU Normal   |

---

### 5. Log Mode Selection

```bash
elif [[ "$1" == "log" ]]; then
```

✔ Executes log check mode

---

### 6. Log File Validation

```bash
if [[ -f "/var/log/syslog" ]]; then
        echo "Result: Log Active"
else
        echo "Result: Log Missing"
fi
```

✔ `-f` → checks if file exists

| Condition | Output      |
| --------- | ----------- |
| Exists    | Log Active  |
| Missing   | Log Missing |

---

### 7. Invalid Input Handling

```bash
else
        echo "Error: Invalid selection"
fi
```

✔ Handles incorrect input

---

## ▶️ Usage

```bash
bash script.sh cpu
bash script.sh log
```

---

## 📤 Example Output

### CPU Mode

```
Result: CPU Critical
```

### Log Mode

```
Result: Log Active
```

### Invalid Input

```
Error: Invalid selection
```

---

## 🔑 Key Bash Concepts Used

| Concept          | Explanation         |
| ---------------- | ------------------- |
| Positional Param | `$1` (user input)   |
| Conditional Test | `[[ ... ]]`         |
| String Compare   | `==`                |
| Numeric Compare  | `-gt`               |
| File Check       | `-f`                |
| If-Else Logic    | branching execution |

---

## ⚠️ Notes

* CPU load is hardcoded (`85`) for demonstration
* Replace with real CPU metrics for production use
* `/var/log/syslog` may not exist on all Linux distributions

---

```


