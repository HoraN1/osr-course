#!/bin/bash
declare current_dir=$PWD 
docker run --gpus all -it --network host \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $current_dir/catkin_ws/src/osr_course_pkgs:/home/cri_osr/catkin_ws/src/osr_course_pkgs \
    -w /home/cri_osr/catkin_ws/src \
    osr-course:dev
# --shm-size="256M" 
# --stop-signal SIGINT