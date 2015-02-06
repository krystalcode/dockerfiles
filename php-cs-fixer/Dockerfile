FROM krystalcode/baseimages_dockerfile_ubuntu

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install.
RUN apt-get install -y php5-cli

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install php-cs-fixer script.
ADD http://get.sensiolabs.org/php-cs-fixer.phar /usr/local/bin/php-cs-fixer
RUN chmod a+x /usr/local/bin/php-cs-fixer

ENTRYPOINT ["php-cs-fixer"]
CMD ["--help"]
