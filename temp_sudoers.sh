#!/bin/bash
while read user
do
  echo "$user ALL=(ALL) NOPASSWD:ALL" >> temp_sudoers
done < users.txt

