#!/bin/bash
TO_MAIL="sp.shreya3242@gmail.com@gmail.com"
SUBJECT=" System Resource Warning"

RAM_THRESHOLD=80
DISK_THRESHOLD=80

LOG_FILE="/home/ec2-user/system_monitor.log"

ram_total=$(free -m | awk 'NR==2 {print $2}')
ram_used=$(free -m | awk 'NR==2 {print $3}')
ram_percent=$((ram_used * 100 / ram_total))

disk_usage=$(df -h| awk 'NR==2 {print $5}' | sed 's/%//')

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
alert_msg=""

if [ $ram_percent -gt $RAM_THRESHOLD ]; then
    alert_msg+="High RAM usage detected: ${ram_percent}%\n"
fi

if [ $disk_usage -gt $DISK_THRESHOLD ]; then
    alert_msg+="High Disk usage detected: ${disk_usage}%\n"
fi

if [ -n "$alert_msg" ]; then
    echo -e "System Performance Warning - $timestamp\n\n$alert_msg" | \
        mail -s "$SUBJECT" "$TO_MAIL"
    echo "$timestamp ALERT: $alert_msg" >> "$LOG_FILE"
    echo " Warning sent to $TO_MAIL and logged."
else
    echo "$timestamp OK: RAM=${ram_percent}% DISK=${disk_usage}%" >> "$LOG_FILE"
    echo "System healthy. RAM=${ram_percent}%, DISK=${disk_usage}%"
fi

