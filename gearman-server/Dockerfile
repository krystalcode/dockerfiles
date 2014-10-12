FROM       debian:wheezy

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN        apt-get update

# Install.
           apt-get -y install gearman-job-server

# Clean up.
RUN        apt-get clean && \
           rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE     4730

ENTRYPOINT ["gearmand"]
