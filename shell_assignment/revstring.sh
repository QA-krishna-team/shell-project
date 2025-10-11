#!/bin/bash

read -p "Enter a string: " str
len=${#str}
rev=""

while [ $len -gt 0 ]
do
  char=${str:len-1:1}
  rev="$rev$char"
  ((len--))
done

echo "Reversed string: $rev"

