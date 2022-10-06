sudo apt update

sudo apt install -y g++
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y libgtest-dev

sudo apt install -y libgoogle-glog-dev
sudo apt install -y libgflags-dev
sudo apt install -y libboost-all-dev
sudo  apt install libssl-dev

sudo apt install -y software-properties-common
sudo apt install -y libghc-double-conversion-dev
sudo apt install -y default-jre

--rdkafka
git clone
./confirate
make
sudo make install
lib use librdkafka++


--thrift
sudo apt install bison flex
sudo apt install nodejs npm ant
./bootstrap.sh
./configure --without-java
./configure CXXFLAGS='-g -O2'
./configure CFLAGS='-g -O2'
./configure CPPFLAGS='-DDEBUG_MY_FEATURE'


make
sudo make install


 g++ client.cpp  ../gen-cpp/SharedService.cpp 
 ../gen-cpp/Calculator.cpp ../gen-cpp/shared_types.cpp ../gen-cpp/tutorial_types.cpp -lthrift -o aaa

#Test in PR-1 step -1
#this is a test in pr-2 -step 2
#this is a test in pr-2 -step 2