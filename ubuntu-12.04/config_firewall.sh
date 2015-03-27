#!/bin/bash
#
# Script to config firewall so only MIT networks are allowed in
# @palash
#

if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./config_firewall.sh"
    exit 1
fi

ufw enable
ufw logging on
ufw default allow incoming
ufw allow ssh
ufw allow from 18.85.0.0/16
ufw allow from 192.168.0.0/16
ufw allow from 10.0.0.0/8
ufw deny from any
