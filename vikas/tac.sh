#!/bin/bash

file="$1"

mapfile -t lines < "$file"

for ((i=${#lines[@]}-1; i>=1; i--))
do
	echo "${lines[i]}"
done < "$file"

