# OSR-course
## A repository to simplify the environment setup for a [open-source-robotics course](http://www.osrobotics.org/osr/)  

This course is built on Ubuntu16.04 with ROS. For now it only works with nvidia gpu based host.

## Basic setup: Docker, Nvidia-docker, course content

To start with, make sure you installed docker. Installation instructions can be found at [install docker](https://docs.docker.com/engine/install/). 

Then, install nvidia-docker such that docker run command recognizes ```--gpus all``` tag. You can find out more at [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

Setup you working directory
```
git clone https://github.com/HoraN1/osr-course.git
```

To get the course content, in current path, run
```
bash get-course.sh
```
And you will see a new directory called catkin_ws in you current directory.

## To build the osr-course image and run the image
Build with default name crigroup/osr-course
```
docker build -t crigroup/osr-course .
```
Or if you want to customize yourself
```
docker build -t <name:tag> .
``` 
But remember to modify the image name and tag in the last line of ```docker-run.sh```. And to run a container from the image, run
```
bash docker-run.sh
```
You can change the container name with the tag ```--name=<CUSTOM_NAME>``` in ```docker-run.sh``` file.

## To test if the X-server is forwarding
In the docker container, run:
```
bash test-gui.sh
```
