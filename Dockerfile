# Base image description
#
# Usage:
# docker build -t openmason/fleet-base .
#
#
FROM ubuntu:14.04
MAINTAINER el aras<openmason@gmail.com>

# Set locale
RUN locale-gen --no-purge en_US.UTF-8

# env variables 
ENV HOME /root
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEPLOY_USER openmason

# Core updates
RUN \
  apt-get update; \
  apt-get install -yq  build-essential git  software-properties-common libevent-dev libzmq-dev --no-install-recommends; 

# Any ppa repositories go here


# Python, Nodejs, Useful tools / system utilities
RUN \
  apt-get install -yq python python-dev python-pip --no-install-recommends; \
  apt-get install -yq nodejs nodejs-legacy npm --no-install-recommends; \
  apt-get install -yq openssh-server ssh-import-id --no-install-recommends; \
  ssh-import-id gh:$DEPLOY_USER; 

RUN \
  apt-get install -yq wget sysstat lsof strace tcpdump --no-install-recommends; \
  pip install --upgrade circus; \
  npm install -g chevron; \
  mkdir -p /var/run/sshd /var/log/circus;

# Everything is controled via mozilla circus supervisor
ADD circus/circusd.conf  /etc/circusd.conf

# Set the default command to execute
# when creating a new container
CMD ["/usr/local/bin/circusd", "/etc/circusd.conf"]

# All cleanups
RUN apt-get clean; \
  rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* 

# Expose ports
EXPOSE 22
