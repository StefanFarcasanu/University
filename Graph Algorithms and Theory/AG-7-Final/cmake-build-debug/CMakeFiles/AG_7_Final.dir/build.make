# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/stefan/CLionProjects/AG-7-Final

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/AG_7_Final.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/AG_7_Final.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/AG_7_Final.dir/flags.make

CMakeFiles/AG_7_Final.dir/pb1.cpp.o: CMakeFiles/AG_7_Final.dir/flags.make
CMakeFiles/AG_7_Final.dir/pb1.cpp.o: ../pb1.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/AG_7_Final.dir/pb1.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/AG_7_Final.dir/pb1.cpp.o -c /Users/stefan/CLionProjects/AG-7-Final/pb1.cpp

CMakeFiles/AG_7_Final.dir/pb1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AG_7_Final.dir/pb1.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/stefan/CLionProjects/AG-7-Final/pb1.cpp > CMakeFiles/AG_7_Final.dir/pb1.cpp.i

CMakeFiles/AG_7_Final.dir/pb1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AG_7_Final.dir/pb1.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/stefan/CLionProjects/AG-7-Final/pb1.cpp -o CMakeFiles/AG_7_Final.dir/pb1.cpp.s

CMakeFiles/AG_7_Final.dir/pb2.cpp.o: CMakeFiles/AG_7_Final.dir/flags.make
CMakeFiles/AG_7_Final.dir/pb2.cpp.o: ../pb2.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/AG_7_Final.dir/pb2.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/AG_7_Final.dir/pb2.cpp.o -c /Users/stefan/CLionProjects/AG-7-Final/pb2.cpp

CMakeFiles/AG_7_Final.dir/pb2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AG_7_Final.dir/pb2.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/stefan/CLionProjects/AG-7-Final/pb2.cpp > CMakeFiles/AG_7_Final.dir/pb2.cpp.i

CMakeFiles/AG_7_Final.dir/pb2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AG_7_Final.dir/pb2.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/stefan/CLionProjects/AG-7-Final/pb2.cpp -o CMakeFiles/AG_7_Final.dir/pb2.cpp.s

# Object files for target AG_7_Final
AG_7_Final_OBJECTS = \
"CMakeFiles/AG_7_Final.dir/pb1.cpp.o" \
"CMakeFiles/AG_7_Final.dir/pb2.cpp.o"

# External object files for target AG_7_Final
AG_7_Final_EXTERNAL_OBJECTS =

AG_7_Final: CMakeFiles/AG_7_Final.dir/pb1.cpp.o
AG_7_Final: CMakeFiles/AG_7_Final.dir/pb2.cpp.o
AG_7_Final: CMakeFiles/AG_7_Final.dir/build.make
AG_7_Final: CMakeFiles/AG_7_Final.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable AG_7_Final"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AG_7_Final.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/AG_7_Final.dir/build: AG_7_Final

.PHONY : CMakeFiles/AG_7_Final.dir/build

CMakeFiles/AG_7_Final.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/AG_7_Final.dir/cmake_clean.cmake
.PHONY : CMakeFiles/AG_7_Final.dir/clean

CMakeFiles/AG_7_Final.dir/depend:
	cd /Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/stefan/CLionProjects/AG-7-Final /Users/stefan/CLionProjects/AG-7-Final /Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug /Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug /Users/stefan/CLionProjects/AG-7-Final/cmake-build-debug/CMakeFiles/AG_7_Final.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/AG_7_Final.dir/depend

