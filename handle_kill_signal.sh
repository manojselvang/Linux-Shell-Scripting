# Below script shows a simle example of handling kill signals using Trap command

#!/bin/bash

$$              # Fetch PID of current Shell

cleanup() {
  echo "deleting temp files"
  rm -f /temp/temp_file.txt
  echo "Cleanup Complete"
}

# Run cleanup when SIGTERM or SIGINT signal is received
trap 'echo "kill signal received, cleaning up.."; cleanup; exit 1; TERM INT

echo "Starting long running process"
touch /temp/temp_file.txt            # Create temp file

# Simple long running task
while true; do
  date >> .tep/temp_file.txt        # Simulate long running task by writing timestamp into file
  echo "Task Running..."
  sleep 2
done

cleanup
