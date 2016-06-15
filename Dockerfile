#
# Redis commander docker image
#
# http://github.com/tenstartups/redis-commander-docker
#

FROM mhart/alpine-node:4.4.5

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk --update add bash coreutils curl nano tar wget && \
  rm -rf /var/cache/apk/*

# Install node packages.
RUN npm install -g redis-commander

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]

# Expose ports.
EXPOSE 8081
