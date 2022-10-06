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
    
添加lib路径到系统
   sudo ldconfig /usr/local/lib
   export LD_LIBRARY_PATH=/usr/lib/jvm/java-11-openjdk-amd64/lib/server

查看目录

readlink -f /usr/bin/java | sed "s:bin/java::"
Option 1: Set a Static Value
/usr/local/hadoop/etc/hadoop/hadoop-env.sh
 . . .
#export JAVA_HOME=
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
 . . .
Option 2: Use Readlink to Set the Value Dynamically
/usr/local/hadoop/etc/hadoop/hadoop-env.sh
 . . .
#export JAVA_HOME=
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
 . . .
 export CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:.

-- find all java
sudo update-alternatives --config java

g++ b.cpp -o test  -I/usr/local/hadoop/include -L/usr/local/hadoop/lib/native -L/usr/lib/jvm/java-11-openjdk-amd64/lib/server -ljvm -lhadooppipes -lhadooputils -lpthread -lssl -lcrypto


hadoop pipes -D hadoop.pipes.java.recordreader=true -D hadoop.pipes.java.recordwriter=true -program /bin/dd


--- build
g++ d.cpp -o dd  -I/usr/local/hadoop/include -L/usr/local/hadoop/lib/native -L/usr/lib/jvm/java-11-openjdk-amd64/lib/server -ljvm -lhadooppipes -lhadooputils -lpthread -lssl -lcrypto

-- put to 
hadoop fs -mkdir /bin
hadoop fs -put counter /bin
hadoop fs -ls /bin
--- add data
hadoop fs -put num.txt /data

---run
hadoop fs -rm -r /output
hadoop pipes -conf job_config.xml -input /data/num.txt -output /output -program /bin/counter

hadoop jar hadoop-mapreduce-examples-3.3.4.jar wordcount -input /data  -output /output
hadoop jar hadoop-mapreduce-examples-3.3.4.jar wordcount /data /output
hadoop /bin/counter -conf job_config.xml -input /data/num.txt -output /output 

hadoop pipes -D hadoop.pipes.java.recordreader=true -D hadoop.pipes.java.recordwriter=true -input /data/num.txt -output /output_dd -program /bin/dd





2

In mapred-site.xml add this property:

<property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
</property>
In yarn-site.xml add this property:

<property>
    <name>yarn.nodemanager.aux-services</name>
    <value>map reduce_shuffle</value>
</property>
I also got the same error, adding above two properties solved the problem...

https://www.cnblogs.com/lanxuezaipiao/p/3648853.html
https://github.com/autopear/Intellij-Hadoop