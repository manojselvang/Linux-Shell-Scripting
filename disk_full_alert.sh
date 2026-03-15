# Disk Usage Monitoring Script
# This script checks the disk usage of a specific partition
# and alerts if the usage exceeds a defined threshold.

#!/bin/bash

THRESHOLD=80            # Maximum allowed disk usage
PARTITION="/"           # Partition to monitor

# Get disk usage percentage
USAGE=$(df -P "$PARTITION" | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Checking disk usage for partition: $PARTITION"
echo "Current Usage: $USAGE"
echo "Threshold: $THRESHOLD"

# Check if usage exceeds threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Alert: Disk usage is High"
fi

# Example Output

> Checking disk usage for partition: /
> Current Usage: 85
> Threshold: 80
> Alert: Disk usage is High
