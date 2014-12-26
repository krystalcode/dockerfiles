FROM krystalcode/baseimage

MAINTAINER Dimitris Bozelos <dbozelos@gmail.com>

# Update.
RUN apt-get update

# Install.
RUN apt-get -y install mysql-server php5 php5-mysql php5-gd drush

# Clean up.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port 80 for Apache.
EXPOSE 80

# Start Apache and MySQL.
CMD service apache2 start && service mysql start
