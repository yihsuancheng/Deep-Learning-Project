# Deep-Learning-Project

## Make an executable test file 

```
touch test
chmod +x test
gedit test # or any text editor 
```

## copy the following contents in the executable test file 

```
#!/usr/bin/env bash
set -e

# create workspace 

mkdir -p wire_detection2/src

cd wire_detection/src

# 1.) clone the DeepLab_ros repo 
git clone https://github.com/ethz-asl/deeplab_ros.git

# 2.) Clone the catkin_simple dependency 
git clone https://github.com/catkin/catkin_simple.git

# 3.) Clone this DeepLearning repo 
git clone https://github.com/yihsuancheng/Deep-Learning-Project.git

# 4.) Build workspace 
cd ..
source /opt/ros/melodic/setup.bash
catkin_make
```
## Finally Run the executable 

```
./test
```
