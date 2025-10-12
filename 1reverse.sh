#!/bin/bash
# Script to print arguments in reverse order
# $# → total number of arguments
# Loop from last argument ($#) down to 1
for (( i=$#; i>0; i-- ))
do
    # Print each argument by position
    echo "${!i}"
done

