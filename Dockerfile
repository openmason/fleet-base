# Base image description
#
# Usage:
# docker build -t openmason/fleet-base
#
#
FROM ubuntu:14.04
MAINTAINER el aras<openmason@gmail.com>

# env 
ENV HOME /root

# Core updates
RUN 
  apt-get update; \
  apt-get install -y build-essential git; \
  apt-get clean

# Python related deps
RUN
  apt-get update; \
  apt-get install -y python-software-properties python python-pip; \
  apt-get clean

# Useful tools / system utilities
RUN 
  apt-get update; \
  apt-get install -y wget sysstat lsof strace tcpdump; \
  apt-get clean



