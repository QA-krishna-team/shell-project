#!/bin/bash

echo "Enter the string"
read str

n=`echo ${#str}`

while [ $n -ne 0 ]
do
        rev=$rev`echo $str | cut -c $n`
        ((n--))
done

echo "The reverse string is  $rev"

