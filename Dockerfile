FROM horasun/ros-gui
LABEL maintainer="He Zhanxin" 
    
# Install tools required
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends\
# Install openCV 
    libopencv-dev python-opencv \
# Install PCL
    libpcl-dev && \
    sudo rm -rf /var/lib/apt/lists/* 

# Install OpenRave
RUN mkdir -p ${HOME}/git && cd ${HOME}/git && \
    git clone https://github.com/crigroup/openrave-installation.git && \
    cd openrave-installation && \
    ./install-dependencies.sh && \
    ./install-osg.sh && \
    ./install-fcl.sh && \
    ./install-openrave.sh

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

RUN sudo chown -R $user:$group ${HOME}/catkin_ws && \
    rosdep update

COPY scripts-container ${HOME}
CMD bash