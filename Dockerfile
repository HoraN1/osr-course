FROM ros:kinetic-ros-base
LABEL maintainer="He Zhanxin" \
      version="V0.1"
    
# Install basic packages and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    ubuntu-drivers-common \
    ipython python-dev python-numpy python-pip python-scipy \
    gedit

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# INstall Openrave Dependencies
RUN sudo apt install libqt4-dev qt4-dev-tools libxml2-dev libode-dev \
    libsoqt4-dev libcoin80-dev libcollada-dom2.4-dp-dev\
    && pip install --upgrade --user sympy==0.7.1 \
    && cd \
    && mkdir -p repos && cd repos \
    && git clone --branch v0.9.0 https://github.com/rdiankov/openrave.git \
    && cd openrave && mkdir build && cd build \
    && cmake .. -DOPT_VIDEORECORDING=OFF \
    && make -j$(nproc) \
    && sudo make install
    
USER developer
ENV HOME /home/developer

CMD ["bash"]