#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>
#
# Description:
#     Initialize ros workspace

source /opt/ros/kinetic/setup.bash

# Build workspace
cd ~/catkin_ws && catkin_make install
source ~/.bashrc
