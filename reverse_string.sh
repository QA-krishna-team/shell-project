#!/bin/bash

read -p "Enter a string: " str

len=${#str}
rev=""

while [ $len -gt 0 ]; do
    rev="$rev${str:len-1:1}"
    len=$((len-1))
done

echo "Reversed string: $rev"

