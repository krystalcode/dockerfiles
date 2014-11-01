FROM       phusion/baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN        apt-get update

# Install nodejs.
RUN        apt-get install -y nodejs npm
RUN        ln -s /usr/bin/nodejs /usr/bin/node

# Install redis.
RUN        apt-get install -y redis-server

# Clean up.
RUN        apt-get clean && \
           rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install bower-registry.
RUN        npm install -g bower-registry

EXPOSE     8080

CMD        service redis-server start && bower-registry -p 8080 -d redis -o '{"port": 6379, "host": "127.0.0.1"}'
