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

echo "switched to mit mirrors"
# ROS setup
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# refresh cache
apt-get -y update
apt-get -y install ros-indigo-desktop-full
rosdep init


PROG_PATH=$(dirname $0)
${PROG_PATH}/update.sh

echo Enabling firewall...
${PROG_PATH}/config_firewall.sh

echo All done
