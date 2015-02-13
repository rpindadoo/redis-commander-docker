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
RUN apt-get update
RUN apt-get install -y curl git nano python python-dev python-pip python-virtualenv wget

# Compile node from source.
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-*.tar.gz && \
  rm -f node-*.tar.gz && \
  cd node-* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd .. && \
  rm -rf node-v*

# Install node packages.
RUN npm install -g joeferner/redis-commander

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]

# Expose ports.
EXPOSE 8081
