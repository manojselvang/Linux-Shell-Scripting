#!/bin/bash

# Usage and need of IFS (Internal Field Seperator) in Shell Scripting
# IFS status how input is split, into different variables (Similar to "sep" in Python)

# Example 1: Default IFS (space, tab, newline)
read name1 name2
echo "$name1"
echo "$name2"
 
# Input: Vijay Aniket      # Stdin from Keyboard
# output:
# Vijay
# Aniket


# Example 2: Change IFS to Comma
IFS=","
read name3 name4
echo "$name3"
echo "$name4"
 
# Input: Vijay,Aniket Shiva     # Stdin from Keyboard
# output:        
# Vijay
# Aniket Shiva        # Remaining text goes to last variable


# Example 3: IFS with string splitting
IFS=":"
str1="bat:ball:stadium"

for word in $str1; do
  echo "$word"
done

# output 3:
# bat
# ball
# stadium
