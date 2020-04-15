# OSR-course
## A repository to simplify the environment setup for a [open-source-robotics course](http://www.osrobotics.org/osr/)  

## GPU Dependency
To start with, make sure you installed nvidia-docker such that docker run command recognizes ```--gpus all``` tag.
You can find out more at [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

## To get the latest image
```
docker pull horasun/ros-gui:latest
``` 

## To run the image with GUI-enabled
```
bash docker-run.sh
```
You can change the container name with the tag ```--name=<CUSTOM_NAME>``` in ```docker-run.sh``` file.

## To test if the X-server is forwarding
In the docker container, run:
```
bash test-gui.sh
```