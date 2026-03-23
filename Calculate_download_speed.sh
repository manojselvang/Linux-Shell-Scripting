#!/bin/bash

# Measuring of Download Speed of network using curl/wget command
# Download a sample file and measure time taken to download

START=$(date +%s)
curl -s -o "$TEMP_FILE" "$URL"     # or
wget "$TEMP_FILE" "$URL"
END=$(date +%s)

# Calculating Speed
if [[ -f "$TEMP_FILE" ]]; then            # if file exists
    SIZE=$(stat -c %s "$TEMP_FILE")
    DURATION=$((END-START))
    if [[ "$DURATION" -gt 0]]; then
        SPEED=$((SIZE/DURATION/1024))    # KB/S
        echo "Size: $((SIZE/1024/1024))    # MB
        echo "Time: ${DURATION}s"
        echo "Speed: ${SPEED} KB/s"
    fi
    # Cleanup
    rm -f "$TEMP_FILE"
else
    echo "Download failed"
    exit 1
fi
