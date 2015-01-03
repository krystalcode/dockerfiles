FROM krystalcode/baseimages_dockerfile_ubuntu

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update && apt-get -y upgrade

# Install.
RUN apt-get -y install emacs git wget php5-cli

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add emacs configuration file.
ADD ./.emacs /root/
