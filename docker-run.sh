#!/bin/bash

docker run --gpus all -it \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v ${PWD}/catkin_ws/src/osr_course_pkgs:/home/cri_osr/catkin_ws/src/osr_course_pkgs \
    -w /home/cri_osr/catkin_ws/src \
    osr-course:dev
# -v /tmp/.X11-unix:/tmp/.X11-unix \
# --shm-size="256M" 
# --stop-signal SIGINT