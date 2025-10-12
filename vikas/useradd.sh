#!/bin/bash

while read user
do
    [ -z "$user" ] && continue
    echo "Creating User - $user"
    sudo useradd -s /bin/bash -d /home/$user $user
    echo "Granting sudo access to: $user"
    usermod -aG sudo "$user"
done < $1
