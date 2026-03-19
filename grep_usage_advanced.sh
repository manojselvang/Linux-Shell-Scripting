#!/bin/bash

# analyzing application logs from a simulated microservices environment.

# This exercise will help you practice basic to advanced grep commands, pattern matching, and extracting meaningful information from large log files.

# Instructions
# The application logs are stored in: /home/user/app_logs/. You are to perform the below tasks.


Find CRITICAL entries:

Locate all lines containing the keyword CRITICAL in the log directory.

Redirect the result to: output/output1.txt

grep "CRITICAL" /home/user/app_logs/* > /home/user/output/output1.txt
Count failed logins:

Count how many failed login attempts occurred by searching for lines containing login failed.

Redirect the count to: output/output2.txt

grep "login failed" /home/user/app_logs/* | wc -l > /home/user/output/output2.txt


Extract unique IP addresses:

Extract all unique IP addresses from failed login attempts and sort them in ascending order.

Redirect the result to: output/output3.txt

grep "login failed" /home/user/app_logs/* | awk '{print $10}' | sort -h | uniq > /home/user/output/output3.txt


Transactions over $500

Find all transactions over $500 and output only the transaction IDs. (Note: The transaction amounts in the logs go up to $900, so any amount above $500 should be included)

Redirect the result to: output/output4.txt

grep "Transaction" /home/user/app_logs/* | sed 's/\$//g' | awk '$8 > 500' | awk '{print $6}' > /home/user//output/output4.txt
Payment-service logs in a time window

Identify all log entries between 2025-09-22 14:00 and 2025-09-22 15:00 for the payment-service.

Redirect the result to: output/output5.txt

grep -r "2025-09-22 14:" /home/user/app_logs/ | grep "payment-service" | sort -u > /home/user/output/output5.txt
