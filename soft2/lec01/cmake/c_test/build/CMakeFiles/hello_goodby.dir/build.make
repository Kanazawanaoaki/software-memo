# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build

# Include any dependencies generated for this target.
include CMakeFiles/hello_goodby.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello_goodby.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello_goodby.dir/flags.make

CMakeFiles/hello_goodby.dir/hello.c.o: CMakeFiles/hello_goodby.dir/flags.make
CMakeFiles/hello_goodby.dir/hello.c.o: ../hello.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/hello_goodby.dir/hello.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hello_goodby.dir/hello.c.o   -c /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/hello.c

CMakeFiles/hello_goodby.dir/hello.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hello_goodby.dir/hello.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/hello.c > CMakeFiles/hello_goodby.dir/hello.c.i

CMakeFiles/hello_goodby.dir/hello.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hello_goodby.dir/hello.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/hello.c -o CMakeFiles/hello_goodby.dir/hello.c.s

CMakeFiles/hello_goodby.dir/hello.c.o.requires:

.PHONY : CMakeFiles/hello_goodby.dir/hello.c.o.requires

CMakeFiles/hello_goodby.dir/hello.c.o.provides: CMakeFiles/hello_goodby.dir/hello.c.o.requires
	$(MAKE) -f CMakeFiles/hello_goodby.dir/build.make CMakeFiles/hello_goodby.dir/hello.c.o.provides.build
.PHONY : CMakeFiles/hello_goodby.dir/hello.c.o.provides

CMakeFiles/hello_goodby.dir/hello.c.o.provides.build: CMakeFiles/hello_goodby.dir/hello.c.o


CMakeFiles/hello_goodby.dir/goodbye.c.o: CMakeFiles/hello_goodby.dir/flags.make
CMakeFiles/hello_goodby.dir/goodbye.c.o: ../goodbye.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/hello_goodby.dir/goodbye.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hello_goodby.dir/goodbye.c.o   -c /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/goodbye.c

CMakeFiles/hello_goodby.dir/goodbye.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hello_goodby.dir/goodbye.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/goodbye.c > CMakeFiles/hello_goodby.dir/goodbye.c.i

CMakeFiles/hello_goodby.dir/goodbye.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hello_goodby.dir/goodbye.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/goodbye.c -o CMakeFiles/hello_goodby.dir/goodbye.c.s

CMakeFiles/hello_goodby.dir/goodbye.c.o.requires:

.PHONY : CMakeFiles/hello_goodby.dir/goodbye.c.o.requires

CMakeFiles/hello_goodby.dir/goodbye.c.o.provides: CMakeFiles/hello_goodby.dir/goodbye.c.o.requires
	$(MAKE) -f CMakeFiles/hello_goodby.dir/build.make CMakeFiles/hello_goodby.dir/goodbye.c.o.provides.build
.PHONY : CMakeFiles/hello_goodby.dir/goodbye.c.o.provides

CMakeFiles/hello_goodby.dir/goodbye.c.o.provides.build: CMakeFiles/hello_goodby.dir/goodbye.c.o


# Object files for target hello_goodby
hello_goodby_OBJECTS = \
"CMakeFiles/hello_goodby.dir/hello.c.o" \
"CMakeFiles/hello_goodby.dir/goodbye.c.o"

# External object files for target hello_goodby
hello_goodby_EXTERNAL_OBJECTS =

libhello_goodby.so: CMakeFiles/hello_goodby.dir/hello.c.o
libhello_goodby.so: CMakeFiles/hello_goodby.dir/goodbye.c.o
libhello_goodby.so: CMakeFiles/hello_goodby.dir/build.make
libhello_goodby.so: CMakeFiles/hello_goodby.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libhello_goodby.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_goodby.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello_goodby.dir/build: libhello_goodby.so

.PHONY : CMakeFiles/hello_goodby.dir/build

CMakeFiles/hello_goodby.dir/requires: CMakeFiles/hello_goodby.dir/hello.c.o.requires
CMakeFiles/hello_goodby.dir/requires: CMakeFiles/hello_goodby.dir/goodbye.c.o.requires

.PHONY : CMakeFiles/hello_goodby.dir/requires

CMakeFiles/hello_goodby.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello_goodby.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello_goodby.dir/clean

CMakeFiles/hello_goodby.dir/depend:
	cd /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build /home/kanazawa/Desktop/codes/in_jsk/software-memo/soft2/lec01/cmake/c_test/build/CMakeFiles/hello_goodby.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello_goodby.dir/depend

