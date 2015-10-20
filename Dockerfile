#
# Redis commander docker image
#
# http://github.com/tenstartups/redis-commander-docker
#

# Pull base image.
FROM alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment.
ENV \
  DEBIAN_FRONTEND=noninteractive \
  TERM=xterm-color

# Install packages.
RUN \
  apk --update add bash curl nano nodejs wget && \
  rm -rf /var/cache/apk/*

# Install node packages.
RUN npm install -g redis-commander

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]

# Expose ports.
EXPOSE 8081
