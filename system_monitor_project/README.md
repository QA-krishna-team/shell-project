# System Metrics Collection

Scripts to capture CPU, Memory, Disk usage, system uptime, and load average.  
Reports are collected every 15 mins and archived daily.

## Scripts
- collect_metrics.sh → capture metrics
- archive_metrics.sh → archive daily

## Cron Jobs
- Every 15 mins: collect_metrics.sh
- Daily at midnight: archive_metrics.sh
