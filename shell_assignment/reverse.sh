#!/bin/bash

if [ -z "$1" ]; then
   echo "Usage: $0 <filename>"
   exit 1
fi

if [ ! -f "$1" ]; then
   echo "File not found!"
   exit 1
fi

total_lines=$(wc -l < "$1")

for (( i=total_lines; i>=1; i-- ))
do
  sed -n "${i}p" "$1"
done


