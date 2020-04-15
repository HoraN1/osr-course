#! /bin/bash

# Install OpenRave
mkdir -p ${HOME}/git && cd ${HOME}/git && \
git clone https://github.com/crigroup/openrave-installation.git && \
cd openrave-installation && \
./install-dependencies.sh && \
./install-osg.sh && \
./install-fcl.sh && \
./install-openrave.sh &&

# Install OpenCV
pip install opencv-python

# Install PCL
add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl && \
apt-get update && \
apt-get install libpcl-all