# Log Analysis Script using grep (Bash)

## 📌 Overview

This script processes application logs and extracts useful insights using standard Linux tools like `grep`, `awk`, `sed`, and `sort`.

It performs:

* Critical log extraction
* Failed login analysis
* Unique IP identification
* High-value transaction filtering
* Time-based log filtering

---

## 🧠 Workflow

1. Validate log directory
2. Create output directory if missing
3. Process logs using multiple commands
4. Store results in separate output files

---

## 📜 Script

```bash
./grep_usage.sh
```

---

## ▶️ Usage

```bash
bash grep_usage.sh
```

---

## 📤 Output Files

| File Name   | Description                               |
| ----------- | ----------------------------------------- |
| output1.txt | All CRITICAL logs                         |
| output2.txt | Count of failed login attempts            |
| output3.txt | Unique IPs from failed logins             |
| output4.txt | Transaction IDs > $500                    |
| output5.txt | payment-service logs (14:00–15:00 window) |

---

## 🔑 Key Concepts Used

| Concept | Explanation                    |
| ------- | ------------------------------ |
| grep    | Pattern search in logs         |
| awk     | Field extraction and filtering |
| sed     | Text substitution              |
| sort -u | Unique value extraction        |
| wc -l   | Counting lines                 |
| $NF     | Last field in a line           |

---

## ⚙️ Script Logic Breakdown

### 1. Critical Log Extraction

* Finds all logs containing `CRITICAL`
* Saves to `output1.txt`

### 2. Failed Login Count

* Counts occurrences of `"login failed"`
* Saves total count

### 3. Unique IP Extraction

* Extracts last field (IP address)
* Removes duplicates using `sort -u`

### 4. High-Value Transactions

* Removes `$` symbol
* Filters transactions greater than 500
* Extracts transaction IDs

### 5. Time-Based Filtering

* Filters logs for specific time window (`14:` hour)
* Further filters for `payment-service`

---

## ⚠️ Notes

* Assumes log format is consistent
* IP address should be the last field
* Adjust paths (`/home/user/...`) as needed
* Time filter is hardcoded for demonstration

---

## 📁 Folder Structure

```bash
logging/
  grep-analysis/
    grep_usage.sh
    README.md
```
