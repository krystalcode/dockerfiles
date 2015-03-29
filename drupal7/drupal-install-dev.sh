#!/bin/bash

# Download and install development modules.
cd /var/www/html && \
drush dl fpa module_filter admin_menu devel diff coder && \
drush en -y fpa module_filter admin_menu admin_menu_toolbar devel diff coder
