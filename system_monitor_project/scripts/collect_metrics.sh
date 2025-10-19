#!/bin/bash
mkdir -p ../reports
timestamp=$(date +"%Y%m%d_%H%M")
outfile="../reports/metrics_${timestamp}.txt"
{
  echo "===== SYSTEM METRICS ====="
  echo "Timestamp: $(date)"
  echo ""
  echo "CPU Usage:"
  top -b -n1 | grep "Cpu(s)"
  echo ""
  echo "Memory Usage:"
  free -h
  echo ""
  echo "Disk Usage:"
  df -h
  echo ""
  echo "System Uptime:"
  uptime
  echo ""
  echo "Load Average:"
  cat /proc/loadavg
} > "$outfile"
