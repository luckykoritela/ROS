# ROS
## Installation
1. First install Ubuntu 20.04 on virtual box and start the virtual machine (if you do not already have linux)
1. Install the ROS 2 Core (Rolling Ridley) by following the steps laid out here: https://docs.ros.org/en/rolling/Installation/Alternatives/Ubuntu-Development-Setup.html (Stop before the section Install Additional DDS Implementations (optional)).
2. Install python in the same directory as previously using: sudo apt install python3-numpy
3. Similarly, install python boost using: sudo apt install libboost-python-dev
4. Go to the src folder in the ROS workspace and enter the following command: git clone https://github.com/ros-perception/vision_opencv.git
5. Run the following command: colcon build --symlink-install
6. Go back to the base directory folder and install OpenCV using: sudo apt install python3-opencv
7. Then, set up the environment by running the following in the terminal: . ~/ros2_rolling/install/local_setup.bash (You will have to do this for every new terminal you use)
8. Then, clone this repository so that the base directory folder is at the same level as the previously created ros workspace folder (ros2_rolling).
9. Then go to the source folder of the new ros workspace (ros_ws) and run: colcon build --packages-select cv_basics
## Running the Program
1. This code is a ROS 2 publisher and subscriber.
2. To run the code open a terminal, navigate to the ros_ws directory and set up the environment using: . ~/ros2_rolling/install/local_setup.bash and also source install/setup.bash
3. Then run the publisher by typing: ros2 run cv_basics img_publisher
4. Create another new terminal and do the same setup as previously
5. Then run the subscriber by typing: ros2 run cv_basics img_subscriber

1. You can also run the program by navigating to the launch directory in the ROS workspace and running ros2 launch my_launch.py config_file:=params.yaml
## Setting up webcam in virtual box
1. First make sure virtual box is updated to the latest version.
2. Then install the virtual box extension pack based on your build.
3. Then open up the virtual box vm manager and go to File->Preferences and then select "Extensions". Here click "Add a new package" and then select the extension pack you just downloaded from your computer and install it.
4. Then start you Ubuntu virtual machine and open up a command prompt (in your personal computer NOT the virtual machine) and navigate to the virtual box folder: cd c:\Program Files\Oracle\VirtualBox
5. Then run the following command: VboxManage controlvm "Ubuntu 20.04" webcam attach .1
6. Now go back to the virtual machine and at the top of the machine click Devices->Webcams and select the webcam there (there should be a checkmark next to the webcam name) which will enable the webcam.
