FROM krystalcode/baseimages_phusion_baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install mysql.
RUN apt-get -y install mysql-server

# Install php5 and extensions.
RUN apt-get -y install php5 php5-mysql php5-gd php5-curl drush

# Install supervisor.
RUN apt-get -y install supervisor

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create application database.
RUN service mysql start && mysql -u root -e 'CREATE DATABASE application charset=utf8'

# Configure supervisor.
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 80 for Apache.
EXPOSE 80

# Start supervisor which will start Apache and MySQL.
CMD ["/usr/bin/supervisord"]
