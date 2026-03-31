# Database Readiness Check Script (Bash)

## 📌 Overview

Checks whether a database is ready by looking for a **lock file**.

Retries a fixed number of times before failing.

---

## 🧠 Workflow

1. Define lock file path
2. Set retry limit
3. Loop until max retries reached
4. Check if file exists
5. Exit success if found
6. Otherwise retry
7. Exit with error if limit reached

---

## ⚙️ Full Script

```bash
#!/bin/bash

LOCK_FILE="/tmp/db_ready"
MAX_RETRIES=3
COUNT=0

while [ "$COUNT" -lt "$MAX_RETRIES" ]; do
    if [[ -f "$LOCK_FILE" ]]; then
        echo "Database connected."
        exit 0
    else
        echo "Waiting for database..."
        ((COUNT++))
    fi
done

echo "Error: Database timed out."
exit 1
```

---

## 🔑 Key Concepts

### File Existence Check

```bash
[[ -f "$LOCK_FILE" ]]
```

Checks whether the file exists.

---

### Loop Condition

```bash
while [ "$COUNT" -lt "$MAX_RETRIES" ]
```

Runs until retry limit is reached.

---

### Counter Increment

```bash
((COUNT++))
```

Increases retry count.

---

### Exit Codes

```bash
exit 0
exit 1
```

* `0` → success
* `1` → failure

---

## 🔍 Logic

```bash
if [[ -f "$LOCK_FILE" ]]; then
```

* File exists → database ready → exit
* File not found → retry

---

## 📊 Output Example

```bash
Waiting for database...
Waiting for database...
Database connected.
```

Failure case:

```bash
Waiting for database...
Waiting for database...
Waiting for database...
Error: Database timed out.
```

---

## ⚠️ Limitations

* No delay between retries
* Fixed retry count
* Only checks file existence

---

## 🚀 Improvements

### Add delay between retries

```bash
sleep 2
```

---

### Make retries configurable

```bash
MAX_RETRIES="${1:-3}"
```

---

### Add logging

```bash
echo "Waiting..." >> db_check.log
```

---

## ▶️ Usage

```bash
./db_check.sh
```

---

## 📌 Exit Codes

| Code | Meaning        |
| ---- | -------------- |
| 0    | Database ready |
| 1    | Timeout        |

---

## 🧠 Notes

* Uses a lock file as readiness indicator
* Loop stops immediately when condition is met
* Counter controls retry behavior

---
