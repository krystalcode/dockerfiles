#!/bin/bash

# Download and install common modules.
cd /var/www/html && \
drush en -y views ctools entity entityreference context libraries jquery_update bootstrap features && \
drush en -y views ctools entity entityreference context libraries jquery_update bootstrap features
