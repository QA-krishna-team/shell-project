#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <userlist-file>"
    exit 1
fi

userfile="$1"

# Check if file exists
if [ ! -f "$userfile" ]; then
    echo "Error: File '$userfile' not found!"
    exit 1
fi

# Create a temporary sudoers file for testing
tempfile="/tmp/sudoers_test"
cp /etc/sudoers "$tempfile"

while read -r user; do
    # Skip empty lines or lines starting with #
    [[ -z "$user" || "$user" == \#* ]] && continue

    echo "Granting sudo access to user: $user"
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> "$tempfile"
done < "$userfile"

# Test the syntax before applying
echo
echo "Checking sudoers syntax..."
if visudo -c -f "$tempfile"; then
    echo " Syntax OK!"
    echo
    echo "If satisfied, apply it using:"
    echo "sudo cp $tempfile /etc/sudoers"
else
    echo "Syntax error! Please check $tempfile before applying."
fi

