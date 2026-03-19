#!/bin/bash

# simple script to go through app logs and pull out some useful info
# mainly for practice - using grep/awk/sed/uniq on microservice logs
# logs path  : /home/user/app_logs/
# output path: /home/user/output/


# get all occurances of CRITICAL in a directory
grep "CRITICAL" /home/user/app_logs/* > /home/user/output/output1.txt


# Count of failed logins
grep "login failed" /home/user/app_logs/* | wc -l > /home/user/output/output2.txt


# list unique IPs involved in failed logins
grep "login failed" /home/user/app_logs/* | awk '{print $10}' | sort -u > /home/user/output/output3.txt


# transactions above 500 dollars -> fetch only Transaction IDs
grep "Transaction" /home/user/app_logs/* | sed 's/\$//g' | awk '$8 > 500 {print $6}' > /home/user/output/output4.txt


# payment-service logs occured between 14:00–15:00
grep -r "2025-09-22 14:" /home/user/app_logs/ | grep "payment-service" > /home/user/output/output5.txt


# Sample Logs (For referance)
2025-09-22 13:54:00 INFO [auth-service] Transaction tx2001 completed $676        # normal transaction (>500)
2025-09-22 13:55:00 CRITICAL [order-service] Transaction tx2002 failed $469      # CRITICAL log
2025-09-22 13:57:00 WARN [order-service] User 202 login failed from 10.0.0.5     # failed login + IP
2025-09-22 13:59:00 INFO [payment-service] Transaction tx4001 completed $539     # payment-service + >500
2025-09-22 14:00:00 WARN [order-service] User 105 login failed from 10.0.0.5     # failed login (duplicate IP)
2025-09-22 14:01:00 CRITICAL [payment-service] Transaction tx1004 failed $709    # CRITICAL + >500
2025-09-22 14:04:00 WARN [payment-service] User 104 login failed from 10.0.0.5   # failed login
2025-09-22 14:08:00 WARN [auth-service] User 201 login failed from 192.168.10.3  # failed login + new IP
2025-09-22 14:10:00 CRITICAL [shipping-service] Transaction tx1003 failed $634   # CRITICAL + >500
2025-09-22 14:18:00 INFO [auth-service] Transaction tx2002 completed $567        # >500 transaction
2025-09-22 14:20:00 INFO [payment-service] Transaction tx2001 completed $776     # payment-service + >500
2025-09-22 14:23:00 CRITICAL [notification-service] Transaction tx2002 failed $208  # CRITICAL log
2025-09-22 14:30:00 ERROR [payment-service] Timeout while processing request from 192.168.10.2  # error + IP
2025-09-22 14:36:00 INFO [payment-service] Transaction tx1001 completed $751     # payment-service + >500
2025-09-22 14:03:00 ERROR [payment-service] Timeout while processing request from 10.0.0.8  # error case
