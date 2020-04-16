#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>
#
# Description:
#     Initialize ros workspace

source /opt/ros/kinetic/setup.bash
# Create catkin workspace
cd ~/catkin_ws/src && catkin_init_workspace
# Build workspace
cd ~/catkin_ws && catkin_make
source ~/catkin_ws/devel/setup.bash
# Configure .bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
