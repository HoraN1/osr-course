#!/bin/bash
#
# Author:
#     He Zhanxin <https://github.com/HoraN1>
#
# Description:
#     Docker execute a running container to open a new terminal

CONTAINER_ID=$1

docker exec -it \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e TERM=xterm-256color \
    $CONTAINER_ID bash
