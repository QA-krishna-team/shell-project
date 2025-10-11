#!/bin/bash
read -p "Enter number of rows: " n

i=1
while [ $i -le $n ]
do
  j=1
  while [ $j -le $i ]
  do
    echo -n "$j "
    ((j++))
  done
  echo
  ((i++))
done

