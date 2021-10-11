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
## Performing Wire Segmentation using Deeplab

Cloning the deeplab model on your local machine

1. git clone https://github.com/tensorflow/models.git 
Then download the wire dataset from kaggle: https://www.kaggle.com/zanellar/electric-wires-image-segmentation 
Note that the file is really large. The first 700 images will be used for training and the latter 300 images will be used for testing. 

2. Navigate to the dataset directory: cd models/research/deeplab/datasets and create a folder named Custom_Dataset. Inside the Custom_Dataset folder, create three folders JPEGImages, SegmentationClass, and ImageSets. Inside the JPEGImages should be all the original images in jpeg format that you wish to train and test on. For instance if there are 700 images for training and 300 images for testing, there should be a total of 1000 images inside the JPEGImages folder. The SegmentationClass folder contains the masks for the coreesponding images in JPEGImages folder. Inside the ImageSets folder should include three text files: train.txt, trainval.txt, val.txt. Inside train.txt should include all name files of the images, and the names should be the same as the images listed under JPEFImages folder.There should be a total of 700 names inside this folder using the above example. Likewise, the trainval.txt would contain 1000 names, and test.txt would contain 300 names for testing. The final folder directory should look like this:
+ datasets
  + pascal_voc_seg
    + VOC2012
      + JPEGImages
      + Segmentation
      + ImageSets
    + tfrecord
    + exp
      + train_on_train_set
        + train
        + eval
        + vis

3. Run the build_voc2012_data.py in datasets folder. The purpose is to make the dataset into tfrecord format that can be read efficiently with tensorflow.

4. 



