FROM ubuntu:14.04
MAINTAINER el aras

# Core updates
RUN apt-get update 
RUN apt-get install -y build-essential

# Python related deps
RUN apt-get install -y python-software-properties python
RUN apt-get install -y python-pip

# Deployment related deps
RUN apt-get install -y git

CMD ["/bin/bash"]

