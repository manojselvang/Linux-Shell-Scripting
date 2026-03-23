#!/bin/bash

# Measuring of Download Speed of network using curl/wget command
# Download a sample file and measure time taken to download

# Sample file URL
URL="http://speedtest.tele2.net/10MB.zip"

# Temporary file
TEMP_FILE="/tmp/test_download_file"

START=$(date +%s)

# download using curl or wget
curl -s -o "$TEMP_FILE" "$URL"     # or
wget -q -0 "$TEMP_FILE" "$URL"

END=$(date +%s)

# Calculating Speed
if [[ -f "$TEMP_FILE" ]]; then            # if file exists
    SIZE=$(stat -c %s "$TEMP_FILE")
    DURATION=$((END-START))
    if [[ "$DURATION" -gt 0 ]]; then
        SPEED=$((SIZE/DURATION/1024/1024))        # MB/S
        echo "Size: $((SIZE/1024/1024)) MB"    
        echo "Time: ${DURATION}s"
        echo "Speed: ${SPEED} MB/s"
    fi
    # Cleanup
    rm -f "$TEMP_FILE"
else
    echo "Download failed"
    exit 1
fi
