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
RUN apt-get update 
RUN apt-get install -y build-essential

# Python related deps
RUN apt-get install -y python-software-properties python
RUN apt-get install -y python-pip

# Deployment/monitoring related deps
RUN apt-get install -y git
RUN apt-get install -y sysstat lsof strace tcpdump


