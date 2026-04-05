# Simple Backup Script (Bash)

## 📌 Overview

This script performs a basic backup of a database file with multiple validation steps.

It ensures:

* Backup directory exists (or creates it)
* Sufficient disk space is available
* Source file exists
* Backup is successfully created
* Backup file is verified

---

## 🧠 Workflow

1. Accept database file as input (optional)
2. Create backup directory based on current date
3. Check available disk space
4. Validate source file existence
5. Copy file to backup location
6. Classify file size (large/small)
7. Verify backup file creation

---

## 📜 Script

```bash
./simple_backup.sh <database_file>
```

---

## ▶️ Usage

```bash
bash simple_backup.sh
bash simple_backup.sh mydb.txt
```

---

## 📤 Example Output

```
Checking if /home/ubuntu/backup/date_20260405 directory exists
Creating backup directory: /home/ubuntu/backup/date_20260405

Checking available disk space
Sufficient disk space available

Database found, starting backup
Small file detected

Backup complete
Backup file exists
```

---

## 🔑 Key Concepts Used

| Concept          | Explanation                        |
| ---------------- | ---------------------------------- |
| Directory check  | `-d` to verify folder existence    |
| File check       | `-f` for file validation           |
| Disk space check | `df` command                       |
| File copy        | `cp`                               |
| File size        | `stat`                             |
| Conditionals     | `if-else` logic                    |
| Variables        | Dynamic values like date and paths |

---

## ⚙️ Script Logic Breakdown

### 1. Directory Handling

* Checks if backup directory exists
* Creates it using `mkdir -p` if missing

### 2. Disk Space Validation

* Uses `df /` to check available space
* Compares against a minimum threshold

### 3. File Validation

* Uses `-f` to ensure the database file exists
* Stops execution if not found

### 4. Backup Operation

* Uses `cp` to create a backup file
* Stores it in a date-based directory

### 5. File Size Classification

* Uses `stat` to get file size
* Compares with threshold (`LARGE_FILE`)
* Labels file as **Large** or **Small**

### 6. Verification Step

* Ensures backup file was successfully created

---

## ⚠️ Notes

* Disk space is measured in **KB**
* File size threshold is in **bytes**
* Backup is a simple copy (not compressed)
* Path `/home/ubuntu` may need modification depending on your system
* This is a **basic simulation**, not a production-grade backup

---

## 📁 Folder Structure

```bash
backup/
  simple-backup/
    simple_backup.sh
    README.md
```
