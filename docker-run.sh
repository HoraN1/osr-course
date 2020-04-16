#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>

# Description:
#     Docker run command scripts: docker run ...

docker run --gpus all -it \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e TERM=xterm-256color \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v ${PWD}/catkin_ws/src/osr_course_pkgs:/home/cri_osr/catkin_ws/src/osr_course_pkgs \
    -w /home/cri_osr/catkin_ws/src \
    crigroup/osr-course