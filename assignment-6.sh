#!/bin/bash
read -p "Enter a string: " str
len=${#str}
rev=""
while [ $len -gt 0 ]; do
    rev="$rev${str:len-1:1}"
    ((len--))
done
echo "$rev"

