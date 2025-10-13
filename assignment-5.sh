#!/bin/bash

# Prompt the user to enter the filename
echo "Enter the filename: "
read file

# Check if the file exists
if [[ ! -f $file ]]; then
    echo "File does not exist"
    exit 1
fi

# Get the total number of lines in the file
lines=$(wc -l < "$file")

# Loop from last line to first line
for (( i=lines; i>=1; i-- ))
do
    sed -n "${i}p" "$file"
done



