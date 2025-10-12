#!/bin/bash

email="vikas.a.s.2426@gmail.com"

usage=$(df -h / | grep "/$" | awk '{print$(NF-1)}' | sed 's/%//g')
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", 100 - $8}')
mem=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

warning=""

[ $usage -gt 10 ] && warning+="Disk usage crirical: $usage%\n"
[ $cpu -gt 10 ] && warning+="Cpu usage critical: $cpu%\n"
[ $mem -gt 10 ] && warning+="Memory usage critical: $mem%\n"

if [ -n "$warning" ]; then
	echo -e "$warning" | mail -s "System resource alert" $email
fi

