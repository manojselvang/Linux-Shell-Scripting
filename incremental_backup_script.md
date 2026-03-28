# Incremental Backup Script (Bash)

## 📌 Overview

This script performs an **incremental backup** of a directory by copying only **new or modified files**.

It uses a **manifest file** to track previous file states (based on `mtime` and `size`).

---

## 🧠 Workflow

1. Validate inputs
2. Load manifest file (if exists)
3. Scan source directory
4. Compare file metadata
5. Copy changed/new files
6. Update manifest
7. Print summary

---

## 📂 Manifest Format

Each entry in the manifest:

```
relative/path/to/file|mtime:size
```

Example:

```
dir1/file.txt|1700000000:2048
```

* **Key** → relative file path
* **Value** → last modified time + file size

---

## ⚙️ Script Breakdown

### 1. Input Validation

```bash
[[ $# -ne 2 ]] && { echo "Usage: $0 <source> <dest>"; exit 1; }
[[ ! -d "$1" ]] && { echo "Source not found"; exit 1; }
[[ ! -d "$2" ]] && { echo "Dest not found"; exit 1; }
```

---

### 2. Convert to Absolute Paths

```bash
SRC="$(cd "$1" && pwd)"
DST="$(cd "$2" && pwd)"
```

---

### 3. Initialize Variables

```bash
set -euo pipefail

MANIFEST=".backup_manifest"

declare -i copied=0 skipped=0 errors=0
declare -A manifest
```

---

### 4. Load Manifest File

```bash
if [[ -f "$MANIFEST_FILE" ]]; then
    while IFS='|' read -r path meta; do
        manifest["$path"]="$meta"
    done < "$MANIFEST_FILE"
fi
```

✔ `IFS='|'` applies only to `read`
✔ associative array stores file state

---

### 5. Scan Files Safely

```bash
while IFS= read -r -d '' file; do
```

Used with:

```bash
find "$SRC" -type f -print0
```

✔ Handles spaces, special characters
✔ Avoids subshell issue using:

```bash
done < <(find ...)
```

---

### 6. Get File Metadata

```bash
mtime=$(stat -c %Y "$file" 2>/dev/null || echo "0")
size=$(stat -c %s "$file" 2>/dev/null || echo "0")
```

✔ `2>/dev/null` → suppress errors
✔ fallback ensures script doesn't fail

---

### 7. Compute Relative Path

```bash
rel="${file#$SRC/}"
```

---

### 8. Change Detection Logic

```bash
if [[ ! -v manifest["$rel"] ]] || \
   [[ "${manifest[$rel]}" != "$mtime:$size" ]]; then
```

#### Cases:

* **New file** → key not present
* **Modified file** → metadata mismatch
* Otherwise → skip

---

### 9. Copy Files

```bash
dst_file="$DST/$rel"
mkdir -p "$(dirname "$dst_file")"

if cp -p "$file" "$dst_file" 2>/dev/null; then
    manifest["$rel"]="$mtime:$size"
    ((copied++))
else
    ((errors++))
fi
```

✔ `mkdir -p` → create directory structure
✔ `cp -p` → preserve metadata

---

### 10. Skip Unchanged Files

```bash
((skipped++))
```

---

### 11. Save Manifest (Atomic Write)

```bash
tmp="$MANIFEST_FILE.tmp"
> "$tmp"
```

✔ Creates or clears file

```bash
for path in "${!manifest[@]}"; do
    echo "$path|${manifest[$path]}" >> "$tmp"
done

mv "$tmp" "$MANIFEST_FILE"
```

✔ Prevents corruption

---

### 12. Report Summary

```bash
echo "Copied: $copied, Skipped: $skipped, Errors: $errors"

[[ $errors -gt 0 ]] && exit 2
exit 0
```

---

## 🔑 Key Bash Concepts Used

| Concept              | Explanation                  |
| -------------------- | ---------------------------- |
| Associative Array    | `declare -A manifest`        |
| Process Substitution | `< <(...)` avoids subshell   |
| Parameter Expansion  | `${file#$SRC/}`              |
| Arithmetic           | `((copied++))`               |
| Redirection          | `2>/dev/null`                |
| IFS                  | Custom delimiter for parsing |

---
