# Fleet-base
Highly opinionated base image. Bundles build-essential (all that required to do any build for python), git, zeromq and python-dev. This image is also available in docker hub as openmason/fleet-base.

# Languages
 * Python
 * Nodejs

# Utilties
 * wget
 * sysstat
 * strace
 * tcpdump

Please refer to the Dockerfile for full list of admin utilities packed in.

# Features included
 * cron
 * ssh
 * syslog
 * logrotate
 * circus (mozilla circus process manager)

# To include within your Dockerfile

    FROM openmason/fleet-base:latest
