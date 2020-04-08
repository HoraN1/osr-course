FROM ros:kinetic-ros-base
LABEL maintainer="He Zhanxin" \
      version="V0.1"
    
# Install basic packages and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    ubuntu-drivers-common \
    ipython python-dev python-numpy python-pip python-scipy

CMD ["bash"]