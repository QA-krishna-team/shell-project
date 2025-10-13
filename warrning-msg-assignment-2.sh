#!/bin/bash
# system_health.sh

# Create a temporary report file
REPORT_FILE="/tmp/system_health_$(date +%F).txt"

echo "System Health Report - $(date)" > $REPORT_FILE
echo "=================================" >> $REPORT_FILE

# CPU Usage
echo -e "\nCPU Usage:" >> $REPORT_FILE
top -bn1 | head -n 5 >> $REPORT_FILE

# Memory Usage
echo -e "\nMemory Usage:" >> $REPORT_FILE
free -h >> $REPORT_FILE

# Disk Usage
echo -e "\nDisk Usage:" >> $REPORT_FILE
df -h >> $REPORT_FILE

# System Load
echo -e "\nSystem Load:" >> $REPORT_FILE
uptime >> $REPORT_FILE

# Send email with report
cat $REPORT_FILE | mail -s "Daily System Health Report - $(hostname)" \
-a $REPORT_FILE \
ullasmathod@gmail.com

# Cleanup
rm $REPORT_FILE
