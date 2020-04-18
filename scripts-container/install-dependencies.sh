#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>
#
# Description:
#     Install missing dependencies reqiured for the course.

# Packages from Ubuntu repositories
sudo apt-get install -y python-termcolor blender openscad python-rtree \
    ros-kinetic-joint-state-publisher-gui
# Python modules
sudo pip install control trimesh --user
sudo rm -rf /var/lib/apt/lists/*

# use the wstool to install required packages from source repositories
cd ~/catkin_ws/src && wstool init .
wstool merge osr_course_pkgs/dependencies.rosinstall
wstool update

# Install any missing dependencies using rosdep
sudo apt-get update
rosdep update
rosdep install --from-paths ~/catkin_ws/src --ignore-src --rosdistro=kinetic -r -y

