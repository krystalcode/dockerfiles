#!/bin/bash

# Download and install latest Drupal with standard profile.
cd /var/www/html && \
drush dl drupal --drupal-project-rename=drupal && \
mv drupal/* drupal/.gitignore drupal/.htaccess ./ && \
drush site-install -y standard --db-url='mysql://root@localhost/application' --site-name=Drupal --account-name=administrator --account-pass=administrator
