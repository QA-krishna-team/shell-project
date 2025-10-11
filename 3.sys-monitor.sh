#!/bin/bash

EMAIL="yogeshakn1k95@gmail.com"
HOSTNAME=$(hostname)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
DISK_USAGE=$(df -h | grep "/$" | awk -F " " '{print$(NF-1)}' | sed 's/%/ /g')
MEMORY_USAGE=$(free -h | awk 'NR==2{print $3}' | sed 's/Mi//g')

if [ $DISK_USAGE -gt 30 ]; then
    echo "Disk Usage has crossed 30% on $HOSTNAME at $TIMESTAMP" > disk.txt
    echo "Current Disk Usage is $DISK_USAGE" >> disk.txt
    mail -s "DISK FULL on $HOSTNAME" $EMAIL < disk.txt
    rm disk.txt
fi

if [ $MEMORY_USAGE -gt 300 ]; then
    echo "Memory Usage has crossed 300MB on $HOSTNAME at $TIMESTAMP" > disk.txt
    echo "Current Memory Usage is $MEMORY_USAGE" >> disk.txt
    mail -s "Memory Usage on $HOSTNAME" $EMAIL < disk.txt
    rm disk.txt
fi

