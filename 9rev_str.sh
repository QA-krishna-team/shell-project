#!/bin/bash
# Script to reverse a string using while loop
# Read string from the user
read -p "Enter a string: " str

# Initialize variables
length=${#str}    # Length of the string
reverse=""        # To store the reversed string
index=$((length - 1))  # Start from last character

# Loop to reverse the string
while [ $index -ge 0 ]
do
    reverse="$reverse${str:$index:1}"  # Append character at position $index
    ((index--))                        # Move to previous character
done
# Print the reversed string
echo "Reversed string: $reverse"

