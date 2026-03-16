
#!/bin/bash

$$              # Fetch PID of current Shell

cleanup() {
  eco "deleting temp files"
  rm -f /temp/temp_file.txt
  echo "Cleanup Complete"
}

trap 'echo "kill signal received, cleaning up.."; cleanup; exit 1; TERM INT
echo "some long running process"
tough /temp/temp_file.txt

# long running task
while true; do
  echo "Some long running task"
  sleep 2
done
cleanup
