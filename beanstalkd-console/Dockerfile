FROM phusion/baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install supervisor.
RUN apt-get -y install supervisor

# Install Beanstalkd.
RUN apt-get -y install beanstalkd

# Install PHP 5 and Apache 2.
RUN apt-get -y install php5

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download PHP Composer.
RUN cd /root && \
    php -r "readfile('https://getcomposer.org/installer');" | php

# Install beanstalkd_console project.
RUN rm /var/www/html/* && \
    /root/composer.phar create-project ptrofimov/beanstalk_console -s dev /var/www/html

# Configure Apache 2.
# Change document root from /var/www/html to /var/www/html/public as required by
# beanstalkd_console.
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Allow apache to write to storage.json file (required by beanstalkd_console).
RUN chown root:www-data /var/www/html/storage.json && \
    chmod 664 /var/www/html/storage.json

# Add supervisord configuration.
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 11300
EXPOSE 80

# Start supervisor which will make sure that beanstalkd is running.
CMD ["/usr/bin/supervisord"]
