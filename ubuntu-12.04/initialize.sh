#!/bin/bash
#
if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./initialize.sh"
    exit 1
fi

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | apt-key add -
apt-get -y update
apt-get -y install ros-hydro-desktop-full
rosdep init


PROG_PATH=$(dirname $0)
${PROG_PATH}/update.sh
