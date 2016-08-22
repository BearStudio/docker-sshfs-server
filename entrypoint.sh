#!/bin/bash
# Fix bug with folder /var/run/sshd/ on run service ssh
mkdir /var/run/sshd/

# Create .ssh folder
mkdir /home/datashared/.ssh/

# Insert public keys
echo $SSH_KEYS > /home/datashared/.ssh/authorized_keys

/usr/sbin/sshd -D
