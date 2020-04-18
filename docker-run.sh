#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>
#
# Description:
#     Docker run command scripts: docker run ...

# Looking for catkin workspace, if not found, make one.
course_path="./catkin_ws/src/osr_course_pkgs"
if [ ! -d "$course_path" ]
then
    mkdir -p $PWD/catkin_ws/src
    git clone https://github.com/crigroup/osr_course_pkgs.git $PWD/catkin_ws/src/osr_course_pkgs
fi

tag=${1:-latest}

docker run --gpus all -it \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e TERM=xterm-256color \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v $PWD/catkin_ws:/home/container/catkin_ws \
    horasun/osr-course:$tag