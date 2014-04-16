#!/bin/bash
#
# Script to install packages to our development VMs so that
# we all have roughly the same platform
#
# Usage: run this with sudo:
# $ sudo ./update.sh
#
# 
# If you are adding anything to the script make sure that
# operation is idempotent
#
# based off SilverWav's cleanstart
#
# palash@media.mit.edu 
# 16 April 2014
#

PACKAGES_FILENAME='packages.list'

if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./update.sh"
    exit 1
fi

PROG_PATH=$(dirname $0)
PACKAGES_FILE=${PROG_PATH}/${PACKAGES_FILENAME}

if [ ! -f $PACKAGES_FILE ]
then
    echo ""
    echo "update packages file missing: ${PACKAGES_FILE}"
    exit 1
fi

PACKAGE_NAME_LIST=$(cat ${PACKAGES_FILE} | grep -v -e "^#" | cut -f1 -d' ')

# to get grub to shut up
export DEBIAN_FRONTEND=noninteractive

if [ $# -gt 0 ]
then
    apt-get --dry-run install -y $PACKAGE_NAME_LIST
else
    apt-get install -y $PACKAGE_NAME_LIST
fi
