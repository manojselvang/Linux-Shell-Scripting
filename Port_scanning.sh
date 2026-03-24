#!/bin/bash


TARGET="192.168.1.10"

for port in {1..1024}
do
  nc -zvw1 $TARGET $port 2>/dev/null && echo "Port $port OPEN"
done