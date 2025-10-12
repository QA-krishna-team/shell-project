#!/bin/bash
# Script to generate number triangle pattern
# Read number of rows from the user
read -p "Enter number of rows: " n
num=1  # Initialize the starting number
# Loop through rows
for ((i=1; i<=n; i++))
do
    # Print numbers in the current row
    for ((j=1; j<=i; j++))
    do
        echo -n "$num "   # Print number without newline
        ((num++))         # Increment number
    done
    echo   # Move to next line after each row
done

