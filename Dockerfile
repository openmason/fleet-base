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

# Core updates
RUN \
  apt-get update; \
  apt-get install -yq  build-essential git  software-properties-common  --no-install-recommends; \
  apt-get clean

# Any ppa repositories go here


# Python, Nodejs, Useful tools / system utilities
RUN \
  apt-get update; \
  apt-get install -yq python python-dev python-pip python-virtualenv --no-install-recommends; \
  apt-get install -yq nodejs npm --no-install-recommends; \
  apt-get install -yq wget sysstat lsof strace tcpdump --no-install-recommends; \
  apt-get install -yq openssh-server ssh-import-id --no-install-recommends; \
  pip install --upgrade supervisor --pre; \
  mkdir /var/run/sshd; \
  mkdir /var/log/supervisor; \
  apt-get clean

