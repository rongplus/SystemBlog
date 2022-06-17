1, install googletest
Start by installing the gtest development package:
 - sudo apt-get install libgtest-dev
Note that this package only install source files. You have to compile the code yourself to create the necessary library files. These source files should be located at /usr/src/gtest. Browse to this folder and use cmake to compile the library:

   sudo apt-get install cmake # install cmake
   cd /usr/src/googletest
   sudo cmake CMakeLists.txt
   sudo make
 
# copy or symlink libgtest.a and libgtest_main.a to your /usr/lib folder
sudo cp *.a /usr/lib
Lets say we now want to test the following simple squareRoot function:

// whattotest.cpp
#include <math.h>
 
double squareRoot(const double a) {
    double b = sqrt(a);
    if(b != b) { // nan check
        return -1.0;
    }else{
        return sqrt(a);
    }
}

sudo apt install libgoogle-glog-dev
apt install libgflags-dev
apt-get install libboost-all-dev

apt install software-properties-common
apt-get install -y libghc-double-conversion-dev


# Clone the repo
git clone https://github.com/facebook/folly
# Install dependencies
cd folly
sudo ./build/fbcode_builder/getdeps.py install-system-deps --recursive

 ./build/fbcode_builder/getdeps.py --allow-system-packages build


  g++ a.cpp -std=c++14 -lfolly -lgflags -lglog -I/home/include


g++ a.cpp -std=c++14 -lfolly -lgflags -lglog -I/home/include -L/home/lib -pthread -l

-----------------------------------------

   - step 1 g++
    sudo apt install g++
 - step git cmake
    sudo apt install git
    sudo apt install cmake

 - step 2 google flag, google test, glog
    git clone https://github.com/gflags/gflags.git
    $ cd gflags-$version
    $ mkdir build && cd build
    $ ccmake ..  (another version cmake)

    - Press 'c' to configure the build system and 'e' to ignore warnings.
    - Set CMAKE_INSTALL_PREFIX and other CMake variables and options.
    - Continue pressing 'c' until the option 'g' is available.
    - Then press 'g' to generate the configuration files for GNU Make.

    $ make
    $ make test    (optional)
    $ make install (optional)

    git clone https://github.com/google/googletest.git
    $ cd googletest-$version
    $ mkdir build && cd build
    $ cmake ..

    sudo apt install libgoogle-glog-dev
    sudo apt-get install -y libfmt-dev
    git clone https://github.com/fmtlib/fmt.git 


 - step boost   https://www.boost.org/doc/libs/1_79_0/more/getting_started/unix-variants.html
    export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
    https://somethingididnotknow.wordpress.com/2012/02/17/fix-the-error-while-loading-shared-libraries-libboost_thread-so-1-48-0-cannot-open-shared-object-file-no-such-file-or-directory-error/

  - step sudo apt-get install libssl-dev 

  - step folly
    ignore the logging/example

  - step aws
    

