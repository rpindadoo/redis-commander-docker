#
# Redis commander docker image
#
# http://github.com/tenstartups/redis-commander-docker
#

FROM tenstartups/alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk --update add nodejs && \
  rm -rf /var/cache/apk/*

# Install node packages.
RUN npm install -g redis-commander
RUN echo '{}' > /root/.redis-commander

# Define the entrypoint script.
ENTRYPOINT ["redis-commander"]

# Expose ports.
EXPOSE 8081
