# Usage and need of IFS (Internal Fiel Seperator) in Shell Scripting
#IFS is used to seperate input, to different variables based on the seperator set

# Example 1:
read name1 name2
echo "$name1"
echo "$name2"
 
# > Vijay Aniket      # Stdin from Keyboard

# output 1:
> Vijay
> Aniket

# Example 2:
IFS=","      # Default seperator changed from Whitespaces to Comma
read name3,name4
 
# > Vijay,Aniket Shiva     # Stdin from Keyboard

# output 2:        
> Vijay
> Aniket Shiva        # Here IFS changed to "," so anything after IFS is considered one string

