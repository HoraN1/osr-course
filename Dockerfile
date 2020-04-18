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
RUN mkdir -p ~/git && cd ~/git && \
    git clone https://github.com/crigroup/openrave-installation.git && \
    cd openrave-installation && \
    ./install-dependencies.sh && \
    ./install-osg.sh && \
    ./install-fcl.sh && \
    ./install-openrave.sh && \
    sudo rm -rf ~/git/*

# Configure .bashrc
RUN echo "# Configure your .bashrc" >> ~/.bashrc && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
    
COPY ./scripts-container $HOME
CMD bash