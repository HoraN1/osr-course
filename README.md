# OSR-course

## A repository to simplify the environment setup for a [open-source-robotics course](http://www.osrobotics.org/osr/)  

This course is built on Ubuntu16.04 with ROS. The base image is [horasun/ros-gui](https://github.com/HoraN1/docker-gui-ros).

## 1. Basic setup: Docker, Nvidia-docker, course content

To start with, make sure you installed docker. Installation instructions can be found at [install docker](https://docs.docker.com/engine/install/). 

Then, install nvidia-docker such that docker run command recognizes ```--gpus all``` tag. You can find out more at [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

At your working directory

```
git clone https://github.com/HoraN1/osr-course.git
cd osr-course
```

To get the course content, run

```
bash scripts/get-course.sh
```

And you will see a new directory called catkin_ws in your current directory.

## 2. Build the osr-course image and run the image

You can either build from Dockerfile or pull from Docker hub with `docker pull horasun/osr-course:latest`.

Build with default name horasun/osr-course

```
# In host machine terminal
docker build -t horasun/osr-course .
```

Or if you want to customize yourself

```
# In host machine terminal
docker build -t <name:tag> .
``` 

But remember to modify the image name and tag in the last line of ```docker-run.sh```. And to run a container from the image, run

```
# In host machine terminal
bash docker-run.sh
```

You can change the container name with the tag ```--name=<CUSTOM_NAME>``` in ```docker-run.sh``` file.

## 3. Install dependencies and packages

In the running docker container, run:

```
# In docker container terminal
bash ~/install-dependencies.sh
```

## 4. Compile and build workspace

In the running docker container, run:

```
# In docker container terminal
bash ~/initialize-workspace.sh
```

## 5. Test the installation and setup

In the running docker container, run:

```
roslaunch osr_description visualize_robot_gripper.launch
```

You can visualize the robot with RVIZ. Or run this command to start gazebo simulation

```
roslaunch osr_gazebo robotic_setup.launch
```

For more information regarding how to use this workspace or testing, please visit the [course website](http://www.osrobotics.org/osr/installation/system.html).