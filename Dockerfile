FROM ros:kinetic-ros-base-xenial
LABEL maintainer="He Zhanxin" 
    
# Install tools required
RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils build-essential \
    software-properties-common \
    ipython python-dev python-numpy python-pip python-scipy \
    vim wget curl lsb-release sudo && \
    rm -rf /var/lib/apt/lists/* 

# User and permissions
ARG user=cri_osr
ARG group=cri_osr
ENV HOME=/home/${user}
RUN export uid=1000 gid=1000 && \
    mkdir -p /etc/sudoers.d && \
    groupadd -g ${gid} ${group} && \
    useradd -d ${HOME} -u ${uid} -g ${gid} -m -s /bin/bash ${user} && \
    echo "${user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sudoers_${user} && \
    sudo usermod -a -G video ${user}
USER ${user}
WORKDIR ${HOME}/catkin_ws/src

# Modify here to install extra packages.

# # Install OpenRave
# RUN mkdir -p ${HOME}/git && cd ${HOME}/git && \
#     git clone https://github.com/crigroup/openrave-installation.git && \
#     cd openrave-installation && \
#     ./install-dependencies.sh && \
#     ./install-osg.sh && \
#     ./install-fcl.sh && \
#     ./install-openrave.sh &&

# # Install OpenCV
# RUN pip install opencv-python

# # Install PCL
# RUN add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl && \
#     apt-get update && \
#     apt-get install libpcl-all
ADD ./test-gui.sh WORKDIR
CMD bash