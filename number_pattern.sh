#!/bin/bash

# Read the number of rows
read -p "Enter n: " n

# Outer loop for rows
for ((i=1; i<=n; i++))
do
    # Inner loop to print numbers in a row
    for ((j=1; j<=i; j++))
    do
        echo -n "$j "
    done
    echo ""  # Move to next line
done

