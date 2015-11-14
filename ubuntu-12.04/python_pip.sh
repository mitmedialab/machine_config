#!/bin/bash
#
# Install all our python pacakges to default version
#

if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./update.sh"
    exit 1
fi

PROG_PATH=$(dirname $0)
pip install -r ${PROG_PATH}/python-pip-requirements.txt


