# OSR-course

## A repository to simplify the environment setup for a [open-source-robotics course](http://www.osrobotics.org/osr/)  

This course is built on Ubuntu16.04 with ROS. The base image is [horasun/ros-gui](https://github.com/HoraN1/docker-gui-ros). It simplifies some procedures listed on the course website. You can just follow the instructions below to get your environment setup.

## 1. Basic setup: Docker, Nvidia-docker

To start with, make sure you installed *docker*. Installation instructions can be found at [install docker](https://docs.docker.com/engine/install/). 

Then, install *nvidia-docker* such that docker run command recognizes ```--gpus all``` tag. You can find out more at [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

At your working directory

```
git clone https://github.com/HoraN1/osr-course.git
cd osr-course
```

## 2. Build the osr-course image and run the image

You can either build from Dockerfile or pull from Docker hub with `docker pull horasun/osr-course:latest`. Run all the command below in your **host machine terminal**.

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

In the **running docker container**, run:

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

In the running docker container, run the command below to test OpenRave

```
openrave data/lab1.env.xml
```

Run the command below to visualize the robot with RVIZ

```
roslaunch osr_description visualize_robot_gripper.launch
```

If you encounter an error like `roslaunch: command not found`, run `source ~/.bashrc` first. 

Run this command to start gazebo simulation, you may run `gzserver --verbose` to run an empty model and setup gazebo online models.

```
roslaunch osr_gazebo robotic_setup.launch
```

The first time you run this command, it may take some time and may cause some error. For more information regarding how to use this workspace or testing, please visit the [course website](http://www.osrobotics.org/osr/installation/system.html).