# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luckykoritela/ros_ws/src/cv_basics

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luckykoritela/ros_ws/build/cv_basics

# Include any dependencies generated for this target.
include CMakeFiles/my_node.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my_node.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_node.dir/flags.make

CMakeFiles/my_node.dir/src/my_node.cpp.o: CMakeFiles/my_node.dir/flags.make
CMakeFiles/my_node.dir/src/my_node.cpp.o: /home/luckykoritela/ros_ws/src/cv_basics/src/my_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/luckykoritela/ros_ws/build/cv_basics/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my_node.dir/src/my_node.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/my_node.dir/src/my_node.cpp.o -c /home/luckykoritela/ros_ws/src/cv_basics/src/my_node.cpp

CMakeFiles/my_node.dir/src/my_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_node.dir/src/my_node.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/luckykoritela/ros_ws/src/cv_basics/src/my_node.cpp > CMakeFiles/my_node.dir/src/my_node.cpp.i

CMakeFiles/my_node.dir/src/my_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_node.dir/src/my_node.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/luckykoritela/ros_ws/src/cv_basics/src/my_node.cpp -o CMakeFiles/my_node.dir/src/my_node.cpp.s

# Object files for target my_node
my_node_OBJECTS = \
"CMakeFiles/my_node.dir/src/my_node.cpp.o"

# External object files for target my_node
my_node_EXTERNAL_OBJECTS =

my_node: CMakeFiles/my_node.dir/src/my_node.cpp.o
my_node: CMakeFiles/my_node.dir/build.make
my_node: CMakeFiles/my_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/luckykoritela/ros_ws/build/cv_basics/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable my_node"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_node.dir/build: my_node

.PHONY : CMakeFiles/my_node.dir/build

CMakeFiles/my_node.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_node.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_node.dir/clean

CMakeFiles/my_node.dir/depend:
	cd /home/luckykoritela/ros_ws/build/cv_basics && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luckykoritela/ros_ws/src/cv_basics /home/luckykoritela/ros_ws/src/cv_basics /home/luckykoritela/ros_ws/build/cv_basics /home/luckykoritela/ros_ws/build/cv_basics /home/luckykoritela/ros_ws/build/cv_basics/CMakeFiles/my_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_node.dir/depend

