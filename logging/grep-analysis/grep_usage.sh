#!/bin/bash

# Log Analysis Script using grep, awk, sed
# Extracts useful insights from application logs

LOG_DIR="/home/user/app_logs"
OUTPUT_DIR="/home/user/output"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Validate log directory
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory not found"
    exit 1
fi

echo "Processing logs from: $LOG_DIR"
echo "Saving results to: $OUTPUT_DIR"
echo "--------------------------------------"

# 1. Get all CRITICAL logs
grep "CRITICAL" "$LOG_DIR"/* > "$OUTPUT_DIR/output1.txt"

# 2. Count failed logins
grep "login failed" "$LOG_DIR"/* | wc -l > "$OUTPUT_DIR/output2.txt"

# 3. List unique IPs from failed logins
grep "login failed" "$LOG_DIR"/* | awk '{print $NF}' | sort -u > "$OUTPUT_DIR/output3.txt"

# 4. Transactions > $500 → extract Transaction IDs
grep "Transaction" "$LOG_DIR"/* | sed 's/\$//g' | awk '$NF > 500 {print $6}' > "$OUTPUT_DIR/output4.txt"

# 5. payment-service logs between 14:00–15:00
grep -r "2025-09-22 14:" "$LOG_DIR"/ | grep "payment-service" > "$OUTPUT_DIR/output5.txt"

echo "--------------------------------------"
echo "Log analysis completed"
