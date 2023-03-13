#! /bin/bash
# Run this script to help automate the proccess
# Variables
DOMAIN=github.com
SSH_PORT=9255
BACK_DIR=/opt/backup/file_$NOW

if [-z BACK_DIR]; then
    echo "File Exists"
else 
    mkdir -p $BACK_DIR
fi


apt update && apt upgrade -y

apt install curl vim fail2ban

# disable and mask ufw
systemctl stop ufw
systemctl disable ufw
systemctl mask ufw


# ssh port
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sed -i 's/ssh port/ ssh port=''$SSH_PORT/g' /etc/fail2ban/fail2ban.local

systemctl restart fail2ban
systemctl enable fail2ban
fail2ban-client status