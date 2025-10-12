#!/bin/bash
# ==========================
# CONFIGURATION
# ==========================
TO="shravankumarbangari23@gmail.com"
GMAIL_USER="shravankumarbangari23@gmail.com"
GMAIL_PASS="whgqkgroogramlmh"  # 16-char App Password

# Thresholds
RAM_THRESHOLD=10
DISK_THRESHOLD=10

# System usage
RAM_USAGE=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

# Check thresholds
WARN_MSG=""
if (( RAM_USAGE >= RAM_THRESHOLD )); then
    WARN_MSG+="WARNING: RAM usage is high: $RAM_USAGE%\n"
fi
if (( DISK_USAGE >= DISK_THRESHOLD )); then
    WARN_MSG+="WARNING: Disk usage is high: $DISK_USAGE%\n"
fi

# Send email if needed
if [[ -n "$WARN_MSG" ]]; then
    SUBJECT="System Performance Warning on $(hostname)"
    echo -e "$WARN_MSG" | mailx -s "$SUBJECT" \
        -r "$GMAIL_USER" \
        -S smtp="smtp.gmail.com:587" \
        -S smtp-use-starttls \
        -S smtp-auth=login \
        -S "smtp-auth-user=$GMAIL_USER" \
        -S "smtp-auth-password=$GMAIL_PASS" \
        "$TO"
fi
