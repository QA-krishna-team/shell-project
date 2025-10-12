#!/bin/bash

echo "Enter a string"
read str

len="${#str}"

rev=""

while [ $len -gt 0 ]; do
	rev=$rev${str:len-1:1}
	((len--))
done
	echo "Reversed string: $rev"

