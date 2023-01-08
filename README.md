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
30. You should now have everything you need to run the program.

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

## Results and Findings
  The basic premise of the independent study was to research and gain an understanding of how the Robot Operating System (ROS) functions. I focused on the relationship between the ROS scheduler and the memory management system, examining how they work together to enable the operation of ROS-based applications. More specifically, I looked into how the ROS scheduler is affected when the available memory is exhausted. The end goal of the study was to make my own change to the already built-in ROS scheduler in hopes of improving the ROS scheduler when it runs on exhausted memory. First, I will begin by providing an overview of my research on the ROS scheduler and memory management system and then I will go into how I tested the different efficiencies as well as my own ROS program.
Robotic Operating System (ROS) is a framework for building scalable robotic applications and systems. It provides an interface for communication between different processes. The basic attributes of ROS are nodes, topics, services, and actions. Nodes are essentially ROS's forms of processes or programs. Topics enable nodes to send messages to other nodes. Services enable nodes to send requests and responses between other nodes. Actions allow a node to send requests to other nodes in order to perform a specific action. These are the key building blocks of ROS applications/systems.
The ROS scheduler is responsible for scheduling the execution of tasks within the system. It is implemented as a real-time priority scheduler in which higher-priority tasks are given priority in terms of execution, while lower-priority tasks are executed only when resources are available. The ROS scheduler uses a priority-based scheduling algorithm, where tasks are assigned a priority level ranging from 0 (lowest priority) to 99 (highest priority). In addition to assigning priority levels to tasks, the ROS scheduler also uses a round-robin scheduling algorithm to ensure that tasks with the same priority level are given a fair amount of execution time. This helps to prevent a single task from monopolizing the system's resources and ensures that all tasks can make progress. Furthermore, the ROS scheduler has 3 different types of executors: single-threaded executors, multi-threaded executors, and static single-threaded executors. Additionally, being a real-time operating system the ROS scheduler supports real-time processes. More specifically, ROS supports soft real-time processes which are similar to regular real-time processes except that they have more relaxed time boundaries.
	The ROS memory management system is crucial for real-time performance. In general, ROS tries to avoid hitting page faults and dynamically allocating memory. This is because during a page fault or dynamic memory allocation the CPU must halt and either load the memory from the disk or update various metadata/request additional RAM. These operations are very expensive and unpredictable which is damaging to a real-time operating system as programs have to be somewhat predictable. One specific example of a situation that requires dynamic memory allocation in real time is if a message received by a robot determines the size of the messages it itself publishes. In this case, different-sized messages must be created during the run time of the process. There are several solutions to this type of example, including object pools, Two-Level Segregate Fit (TLSF) allocator, and stack allocation. Object pools are essentially where there are a set of objects that are already initialized and instead of creating a new object every time, a process simply takes an existing object, performs the necessary operations, and then returns the object. In this case, there is no need for dynamic memory allocation but in some situations, all the objects may be currently in use which will cause an exception. Stack allocation is simply just allocating whatever is needed on the stack and if the memory needed exceeds the stack’s size, it fails. TLSF, which is the default ROS allocator, makes it so that all operations (malloc, free, etc.) have a constant upper bound, thus making each operation O(1). This makes it so a process can dynamically allocate memory while knowing the time window. Furthermore, after looking into ROS’ allocator.c file it seems to be fairly simple. The ROS default allocator utilizes C’s malloc, calloc, realloc, and free functions for all of its operations. The allocator creates a struct rcutils_allocator_t which holds the wrapper function declarations for each of the required functions (allocate, zero_allocate, reallocate, and deallocate) as well as the state. These structs are copyable and only the state within these structs can be modified. These functions are then used when an allocator is created.
	In order to test how the ROS scheduler and memory management system work together I created my own program. Basically, the goal of the program was for me to test certain operations in the case where there is an abundant amount of memory and the case where the memory is limited (thus causing the memory management system to be called) and compare how they run. Because I needed my program to be memory intensive I decided to follow the path of doing some type of image processing within my program. In the end, I decided to use OpenCV and have my program run a face detection algorithm that detected the number of faces in the image. The first thing I did was I created a publisher and subscriber program. Basically, the publisher node would use the computer’s webcam and constantly send images from the webcam at a rate of 100 milliseconds for 500 images. The subscriber receives the images from the publisher, runs the face detection algorithm, and then prints out how many faces were detected in the image. I found that when there is an abundant amount of memory the program took about 1.02 GB of RAM to run or about 31% of the RAM as well as the time it took to run was 51.55 seconds. Now to test the program at an exhaustive memory state, I first limited the amount of memory that the ROS program could to 2 GB by running ulimit -m in the terminal. Additionally, I had to create a separate setup file for the program and configure it to my program in which it set the max memory. I ran the program at this limited memory state and found little difference in the run time efficiencies. This was because the program was not reaching the limit of 2 GB. To get the program to use more memory, I created a launch file that instead of running only a single publisher, ran 27 different publisher nodes. This got the program to max out at around 2.5 GB of RAM or 67% of the RAM usage. Additionally, the time it took for each node to complete increased with the longest time being 91.94 seconds. This demonstrated how important of a role memory plays within the scheduler and that the two rely on one another.
	Overall, I was able to learn a lot during my independent study at both a practical level as well as a conceptual level. I gained new skills in writing ROS programs along with learning Python and OpenCV. Additionally, I learned a lot about how the ROS scheduler and memory management systems work as well as the intricacies between them. One thing I was not able to do was to implement a change to the scheduler. Despite this, I gained a lot of new information throughout the study and hope to possibly continue working on this as well as learn even more about ROS.

