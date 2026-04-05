# Disk Usage Monitoring Script (Bash)

## 📌 Overview

This script monitors disk usage of a specified partition and alerts if it exceeds a defined threshold.

It is useful for:

* Preventing disk space exhaustion
* Monitoring system health
* Basic alerting in scripts or cron jobs

---

## 🧠 Workflow

1. Accept threshold (optional)
2. Accept partition (optional)
3. Fetch disk usage using `df`
4. Extract usage percentage
5. Compare with threshold
6. Print alert or normal status

---

## 📜 Script

```bash
./disk_full_alert.sh <threshold> <partition>
```

---

## ▶️ Usage

```bash
bash disk_full_alert.sh
bash disk_full_alert.sh 90 /
bash disk_full_alert.sh 75 /home
```

---

## 📤 Example Output

```
Checking disk usage for partition: /
Current Usage: 85%
Threshold: 80%
Alert: Disk usage is HIGH
```

---

## 🔑 Key Concepts Used

| Concept         | Explanation                         |
| --------------- | ----------------------------------- |
| Command check   | `command -v` to verify availability |
| Disk usage      | `df` command                        |
| Text processing | `awk`, `tr`                         |
| Conditionals    | `if-else` logic                     |
| Input arguments | `$1`, `$2`                          |

---

## ⚙️ Script Logic Breakdown

### 1. Input Handling

* `$1` → Threshold (default: 80)
* `$2` → Partition (default: `/`)

### 2. Disk Usage Extraction

* Uses `df -P` for consistent output
* Extracts usage percentage using `awk`

### 3. Data Cleaning

* Removes `%` symbol using `tr`

### 4. Validation

* Ensures values are numeric before comparison

### 5. Threshold Comparison

* Alerts if usage exceeds threshold
* Otherwise prints normal status

---

## ⚠️ Notes

* Requires `df` command (available on most Linux systems)
* Threshold must be numeric
* Works on standard Linux filesystems

---

## 📁 Folder Structure

```bash
monitoring/
  disk-alert/
    disk_full_alert.sh
    README.md
```
