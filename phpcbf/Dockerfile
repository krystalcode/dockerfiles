FROM krystalcode/baseimages_dockerfile_ubuntu

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install.
RUN apt-get install -y php5-cli php-pear

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP Code Sniffer.
RUN pear install PHP_CodeSniffer

ENTRYPOINT ["phpcbf"]
CMD ["--help"]
