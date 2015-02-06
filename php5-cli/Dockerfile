FROM krystalcode/baseimages_dockerfile_ubuntu

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install.
RUN apt-get install -y php5-cli

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["php"]
CMD ["--help"]
