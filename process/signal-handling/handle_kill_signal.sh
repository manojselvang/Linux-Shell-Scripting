#!/bin/bash

# Script demonstrating handling of SIGINT and SIGTERM using trap

TEMP_FILE="/tmp/temp_file.txt"

echo "Process ID: $$"

cleanup() {
    echo "Cleaning up..."
    rm -f "$TEMP_FILE"
    echo "Cleanup complete"
}

# Trap signals
trap 'echo "Kill signal received"; cleanup; exit 1' SIGINT SIGTERM

echo "Starting long running process"

# Create temp file
touch "$TEMP_FILE"

# Simulate long running process
while true; do
    date >> "$TEMP_FILE"
    echo "Task running..."
    sleep 2
done

# This line will never be reached under normal conditions
cleanup
