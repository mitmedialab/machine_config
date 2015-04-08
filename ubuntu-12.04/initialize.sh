#!/bin/bash
#
# Script to bring up an ubuntu-12.04 machine to prg standard
# @palash
#

if [ "$(id -u)" != "0" ]
then
    echo ""
    echo "run as root. eg. sudo ./initialize.sh"
    exit 1
fi

# switch to MIT mirrors for faster install
cp /etc/apt/sources.list /etc/apt/sources.list.backup
sed 's@http://us\.archive\.ubuntu\.com/@http://mirrors.mit.edu/@' -i /etc/apt/sources.list


# ROS setup
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | apt-key add -

# refresh cache
apt-get -y update
apt-get -y install ros-hydro-desktop-full
rosdep init


PROG_PATH=$(dirname $0)
${PROG_PATH}/update.sh
