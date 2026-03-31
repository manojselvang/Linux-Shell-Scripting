# Traffic Check Script (Bash)

## 📌 Overview

Checks whether incoming traffic is within limits using a function.

Returns a status based on:

* Normal traffic
* Limit exceeded
* Invalid input

---

## 🧠 Workflow

1. Define function
2. Pass request count and limit
3. Function evaluates condition
4. Return status code
5. Capture return value
6. Print corresponding message

---

## ⚙️ Full Script

```bash
#!/bin/bash

check_traffic() {
    if [[ "$1" -lt 0 ]]; then
        return 2
    elif [[ "$1" -gt "$2" ]]; then
        return 1
    else
        return 0
    fi
}

REQUESTS=150
LIMIT=100

check_traffic "$REQUESTS" "$LIMIT"
RESULT=$?

if [[ "$RESULT" -eq 0 ]]; then
    echo "Status: Traffic Normal"
elif [[ "$RESULT" -eq 1 ]]; then
    echo "Status: Limit Exceeded"
else
    echo "Status: System Error"
fi
```

---

## 🔑 Key Concepts

### Function Definition

```bash
check_traffic() {
    # logic
}
```

Defines reusable logic.

---

### Function Arguments

```bash
"$1" "$2"
```

* `$1` → requests
* `$2` → limit

---

### Return Codes

```bash
return 0
return 1
return 2
```

* `0` → normal
* `1` → limit exceeded
* `2` → invalid input

---

### Capture Exit Status

```bash
RESULT=$?
```

Stores last command result.

---

## 🔍 Logic

```bash
if [[ "$1" -lt 0 ]]; then
```

* Negative value → system error

```bash
elif [[ "$1" -gt "$2" ]]; then
```

* Requests exceed limit → alert

```bash
else
```

* Within limit → normal

---

## 📊 Output Example

```bash
Status: Limit Exceeded
```

Other cases:

```bash
Status: Traffic Normal
```

```bash
Status: System Error
```

---

## ⚠️ Limitations

* No input validation (non-numeric values)
* Static values for requests and limit
* No logging

---

## 🚀 Improvements

### Validate numeric input

```bash
[[ "$1" =~ ^[0-9]+$ ]] || return 2
```

---

### Accept user input

```bash
REQUESTS="$1"
LIMIT="$2"
```

---

### Add logging

```bash
echo "Traffic checked: $REQUESTS" >> traffic.log
```

---

## ▶️ Usage

```bash
./traffic_check.sh
```

---

## 📌 Exit Codes

| Code | Meaning        |
| ---- | -------------- |
| 0    | Traffic Normal |
| 1    | Limit Exceeded |
| 2    | System Error   |

---

## 🧠 Notes

* Functions return status codes, not values
* `$?` captures last execution result
* Logic separated for reuse

---
