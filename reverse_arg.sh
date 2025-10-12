#!/bin/bash
# Get the total number of arguments
count=$#
# Loop from last argument to first
for (( i=$count; i>=1; i-- ))
do
  echo -n "${!i} "  # Print the ith argument
done
echo  # Newline at the end

