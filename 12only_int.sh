#!/bin/bash
# Script to print only integer arguments
echo "The integer arguments are:"

for arg in "$@"
do
    # Check if the argument is an integer using regex
    if [[ "$arg" =~ ^[0-9]+$ ]]; then
        echo "$arg"
    fi
done

