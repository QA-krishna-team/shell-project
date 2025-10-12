#!/bin/bash
read -p "Enter number of rows: " n

# Loop through each row
for ((i=1; i<=n; i++))
do
    # Print numbers from 1 to i
    for ((j=1; j<=i; j++))
    do
        echo -n "$j "   # Print number without newline
    done
    echo                # Newline after each row
done

