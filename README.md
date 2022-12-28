# ROS
## Installation
1. First intall Ubuntu 20.04 on your machine or on virtual box.
2. Open up your terminal to the base directory.
3. Install the ROS 2 Core (Rolling Ridley) by typing the following commands into the command line.
4. sudo apt update && sudo apt install locales
5. sudo locale-gen en_US en_US.UTF-8
6. sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
7. export LANG=en_US.UTF-8
8. sudo apt install software-properties-common
9. sudo add-apt-repository universe
10. sudo apt update && sudo apt install curl
11. sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
12. echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
13. sudo apt update && sudo apt install -y \
  python3-flake8-docstrings \
  python3-pip \
  python3-pytest-cov \
  ros-dev-tools
14. python3 -m pip install -U \
   flake8-blind-except \
   flake8-builtins \
   flake8-class-newline \
   flake8-comprehensions \
   flake8-deprecated \
   flake8-import-order \
   flake8-quotes \
   pytest-repeat \
   pytest-rerunfailures
15. mkdir -p ~/ros2_rolling/src
16. cd ~/ros2_rolling
17. vcs import --input https://raw.githubusercontent.com/ros2/ros2/rolling/ros2.repos src
18. sudo apt upgrade
19. sudo rosdep init
20. rosdep update
21. rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
22. sudo apt install python3-numpy
23. sudo apt install libboost-python-dev
24. cd ~/ros2_rolling/
25. colcon build --symlink-install
26. cd ..
24. git clone https://github.com/luckykoritela/ROS.git
25. Now open up file explorer. Then click on the ROS folder. You should see a couple of files including a ros_ws folder. Copy and paste this folder so that it is on the same base level as the ros2_rolling folder. You can then delete the ROS folder.
25. cd ros_ws/src
26. sudo apt install python3-opencv
27. git clone https://github.com/ros-perception/vision_opencv.git
27. cd ..
29. colcon build --symlink-install
30. You should no have everything you need to run the program.

## Running the Program
1. There are two ways to run the program. You can either run the publisher and subscriber seperately in two different terminals or run the launch file which runs both at once.
2. To run the publisher and subscriber seperately open two new terminals, and in each navigate to the ros_ws directory and set up the environment by typing ". ~/ros2_rolling/install/local_setup.bash" followed by "source install/setup.bash". Then run the publisher in one terminal by typing "ros2 run cv_basics image_publisher" and run the subscriber in the other terminal by typing "ros2 run cv_basics image_subscriber". 
3. To run the program using the launch file first navigate to the ros_ws directory. Then navigate to the launch directory by typing "cd launch". There should be two launch files. The file named my_launch.py is the file that runs one subscriber and 27 publishers (uses up more memory) and the file named single_launch.py is the file that runs one subscriber and one publisher. To run the my_launch file type "ros2 launch my_launch.py config_file:=params.yaml". To run the single_launch file type "ros2 launch single_launch.py config_file:=params.yaml".

## Setting up webcam (only for virtual box)
1. First make sure virtual box is updated to the latest version.
2. Then install the virtual box extension pack based on your build.
3. Then open up the virtual box vm manager and go to File->Preferences and then select "Extensions". Here click "Add a new package" and then select the extension pack you just downloaded from your computer and install it.
4. Then start you Ubuntu virtual machine and open up a command prompt (in your personal computer NOT the virtual machine) and navigate to the virtual box folder: cd c:\Program Files\Oracle\VirtualBox
5. Then run the following command: VboxManage controlvm "Ubuntu 20.04" webcam attach .1
6. Now go back to the virtual machine and at the top of the machine click Devices->Webcams and select the webcam there (there should be a checkmark next to the webcam name) which will enable the webcam.
