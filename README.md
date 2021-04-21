# PROJECTNAME
This is my brandnew project using [CMAKEBasic](https://github.com/Plurax/CMAKEBasic) template

# Project description and aim

This C++ project can be used as basic jumpstart for your own development tasks. It contains a basic
CMake setup supporting out of source builds. There are no library dependencies included, but you will
be able to start writing tests, valgrind memcheck and create doxygen documentation right from the start.

It contains an init shell script which transforms the whole repository into a new project with the
given name as command line argument. So this can also be used to create a fast mini project to evaluate
something you wanted to try without the copy and paste mess...

# Project structure and organisation

    CMAKEBasic
    ├── cmake
    │   ├── GetGitRevisionDescription.cmake    # Retrieve version info from git
    │   ├── GetGitRevisionDescription.cmake.in # Retrieve version info from git
    │   └── PackageConfigurator.cmake
    ├── CMakeLists.txt                         # Main build file
    ├── Doxyfile.in
    ├── include                                # Include folder is departed from source
    │   ├── CMakeLists.txt
    │   └── PROJECTNAME                        # Project folder which is copied to include dir on install
    │       ├── BaseClass.h                    # A dummy base class
    │       ├── CMakeLists.txt                 # Basicly just doing the version replace
    │       └── PROJECTNAMEVersion.h.in        # Version template class
    ├── init.sh                                # Init script for creation of a new project
    ├── LICENSE.MIT
    ├── README.md
    ├── src                                    # Source folder is departed from include
    │   ├── BaseClass.cpp                      # A dummy base class
    │   ├── CMakeLists.txt                     # This contains the build magic of executable and library
    │   └── main.cpp                           # A dummy executable
    └── test                                   # Test folder contains all test stuff
        ├── CMakeLists.txt                     # Buildfile for tests
        └── src
            ├── unit-BaseClass.cpp             # Unit test for base class
            └── unit.cpp                       # The catch binaries are built as seperate .a to save build time

# Requirements

* doxygen: http://www.stack.nl/~dimitri/doxygen/
* graphviz: http://www.graphviz.org/
* cmake > 3.8 (C++17)
* valgrind for memcheck test
* lcov for coverage test

# Usage

To create a new c++17 project with CMake, call the init.sh script with the desired project name.
The CMakeLists.txt in the source folder creates a shared library and an executable. You can adapt those afterwards.
(May be a future version can select between executable and library project). To assure a working testing framework
for an executable, you can change the SHARED into a static lib and statically link your executable to that. So the
tests will have access to the binaries.

## Init.sh

```
    ./init.sh testproj
    cd .
```

## CMake

```
    mkdir build
    cd build
    cmake -DBUILDTESTS=ON -DCOVERAGE=ON -DVALGRIND=ON ..
    make
    make test
    make lcov_html
    make doc
```

## Tests

Tests are running via catch2, which is downloaded via the init.sh script.
The CMake setup for the tests will create seperate executables for each unittest. The compilation is optimized
by creating an archive of catch2 which is linked to all executables. The tests will also run valgrind to
perform memchecks if enabled. Adding a new unit test is just creating a new cpp file like the
unit-BaseClass.cpp.

## Packaging

Packaging not yet imlemented/tested.

# Remarks

Although CMake is also for cross compiling, I dont have tested MSVC support or other platforms. I am using
this currently on Ubuntu 18.04.01

# Thanks

This project is basically a cookbook to be able to jumpstart a new c++ project very fast, instead of
cobbling a new one together of some existing projects (Which is especially cumbersome if you want to show
some thing to a "non C++ colleague"). It is inspired by the base project from
[Barthélémy von Haller](https://github.com/Barthelemy), mixed with the testing part from
[Niels Lohmanns](https://github.com/nlohmann) json library.

If there are any licensing issues - please let me know.
