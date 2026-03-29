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

## ⚙️ Script Breakdown

### 1. Shebang

```bash
#!/bin/bash
