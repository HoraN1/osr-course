FROM nvidia/cudagl:10.1-devel-ubuntu16.04
LABEL maintainer="He Zhanxin" \
      version="V0.1"
    
# Install tools required
RUN apt-get update && apt-get install -y --no-install-recommends\
    build-essential \
    software-properties-common \
    ubuntu-drivers-common \
    ipython python-dev python-numpy python-pip python-scipy \
    apt-utils vim wget curl lsb-release sudo && \
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

WORKDIR ${HOME}
CMD bash