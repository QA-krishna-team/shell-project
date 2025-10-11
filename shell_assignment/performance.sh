#!/bin/bash

THRESHOLD_DISK=10
THRESHOLD_RAM=10
EMAIL="tejaswiniteju317@gmail.com"
HOSTNAME=$(hostname)
DATE=$(date '+%Y-%m-%d %H:%M%S')

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.0f",$3/$2*100)}')
MESSAGE="System Performance Report - $DATE on $HOSTNAME
Disk Usage: ${DISK_USAGE}% 
RAM Usage: ${MEMORY_USAGE}% "
 
if [ "$DISK_USAGE" -gt "$THRESHOLD_DISK" ]; then 
  MESSAGE+="\nWARNING: Disk usage is above ${THRESHOLD_DISK}%!" 
fi
 
if [ "$MEMORY_USAGE" -gt "$THRESHOLD_RAM" ]; then 
  MESSAGE+="\nWARNING: RAM usage is above ${THRESHOLD_RAM}%!" 
fi

echo -e "$MESSAGE" | mail -s "System Report: $HOSTNAME" "$EMAIL"  

