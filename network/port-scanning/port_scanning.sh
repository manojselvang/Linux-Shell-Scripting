#!/bin/bash

# Simple port scanner using nc (Netcat)
# Scans ports 1–1024 on a target IP

TARGET="${1:-10.0.0.5}"   # Default target if not provided

# Check if nc is installed
if ! command -v nc >/dev/null 2>&1; then
    echo "Error: netcat (nc) is not installed"
    exit 1
fi

echo "Scanning target: $TARGET"
echo "--------------------------------"

for port in {1..1024}; do
    if nc -zvw1 "$TARGET" "$port" 2>/dev/null; then
        echo "[OPEN]   Port $port"
    else
        echo "[CLOSED] Port $port"
    fi
done

echo "--------------------------------"
echo "Scan complete"
