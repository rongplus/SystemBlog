FROM ubuntu:22.04

# Install dependencies
RUN apt-get update 
RUN apt-get -y install apache2

# Install apache and write hello world message
RUN echo 'Hello World!' > /var/www/html/index.html

# install dev
RUN apt-get install -y g++
RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y libgtest-dev
RUN cd /usr/src/googletest && cmake CMakeLists.txt && make 

RUN apt install -y libgoogle-glog-dev
RUN apt-get install -y libgflags-dev
RUN apt-get install -y libboost-all-dev
RUN  apt-get install libssl-dev

RUN apt-get install -y software-properties-common
RUN apt-get install -y libghc-double-conversion-dev
RUN apt install -y default-jre