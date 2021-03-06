FROM centos:latest
MAINTAINER haveyb "haveyb@163.com"
RUN groupadd -r redis && useradd  -r -g redis redis
RUN yum -y update \
&&  yum -y install epel-release \
&&  yum -y install wget \
&&  yum -y install vim \
&&  yum -y install redis \
&&  yum -y install net-tools \
&&  yum -y install zlib-devel \
&&  yum -y install ruby \
&&  yum -y install rubygems \
&&  yum -y install ncurses
RUN  wget https://rubygems.org/downloads/redis-3.2.1.gem  \
&&   gem install -l ./redis-3.2.1.gem \
&&   rm -f redis-3.2.1.gem
COPY  ./redis-trib.rb  /usr/bin
COPY  ./redis.sh       /usr/bin
RUN  mkdir -p /config \
&&   chmod  775  /usr/bin/redis.sh
