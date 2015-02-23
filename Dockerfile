#
# Redis commander dockerfile
#
# http://github.com/tenstartups/redis-commander-docker
#

# Pull base image.
FROM debian:jessie

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment.
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-color

# Install packages.
RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    git \
    nano \
    wget

# Install nodejs from official source.
RUN \
  curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get install -y nodejs

# Install node packages.
RUN npm install -g redis-commander

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]

# Expose ports.
EXPOSE 8081
