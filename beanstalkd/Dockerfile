FROM phusion/baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install supervisor.
RUN apt-get -y install supervisor

# Install Beanstalkd.
RUN apt-get -y install beanstalkd

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add supervisord configuration.
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 11300

# Start supervisor which will make sure that beanstalkd is running.
CMD ["/usr/bin/supervisord"]
