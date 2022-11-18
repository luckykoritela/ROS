# ROS
## Installation
1. Install the ROS 2 Core (Rolling Ridley) by following the steps laid out here: https://docs.ros.org/en/rolling/Installation.html.
2. Install python in the same directory as previously using: sudo apt install python3-numpy
3. Similarly, install python boost using: sudo apt install libboost-python-dev
4. Go to the src folder in the ROS workspace and enter the following command: git clone https://github.com/ros-perception/vision_opencv.git
5. Run the following command: colcon build --symlink-install
6. Install OpenCV using: sudo apt install python3-opencv
