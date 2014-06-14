# Base image description
#
# Usage:
# docker build -t openmason/fleet-base .
#
#
FROM ubuntu:14.04
MAINTAINER el aras<openmason@gmail.com>

# env variables 
ENV HOME /root

# Core updates
RUN \
  apt-get update; \
  apt-get install -yq \
    build-essential git \
    software-properties-common \
    --no-install-recommends; \
  apt-get clean

# Any ppa repositories go here

# Python related deps
RUN \
  apt-get update; \
  apt-get install -yq \
    python python-dev python-pip python-virtualenv \
    --no-install-recommends; \
  apt-get clean

# Useful tools / system utilities
RUN \
  apt-get update; \
  apt-get install -yq wget sysstat lsof strace tcpdump --no-install-recommends; \
  apt-get clean

