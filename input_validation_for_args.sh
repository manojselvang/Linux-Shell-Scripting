#!/bin/bash

# This script is used to create a config file for a service.
# It takes service name and port as input and writes them into a .conf file. 
# (e.g., service name: web-app or database and port: 8080 or 3306)

# Validate number of arguments
if [ $# -ne 2 ]; then
    echo "Error: Missing arguments"
    exit 1
fi

# Assign inputs
service_name=$1                
port=$2

# Create config file with required content
{
    echo "[service]"
    echo "name=$service_name"
    echo "port=$port"
} > "$service_name.conf"

# Print success message
echo "Config generated for $service_name"
