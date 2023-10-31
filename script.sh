#!/bin/bash

# Update package repositories
sudo apt-get update

# Install Apache, PHP, MySQL, and other tools
sudo apt-get install -y apache2 php mysql-server php-mysql stress

# Determine the init system
if [ -f /lib/systemd/system/apache2.service ]; then
  # System is using systemd
  sudo systemctl enable --now apache2
else
  # System is using init
  sudo update-rc.d apache2 defaults
  sudo service apache2 start
fi

# Change the working directory to /var/www/
cd /var/www/

# Download and extract a web application
wget https://api-storage.cloud.toast.com/v1/AUTH_f6a41fa655f84f47bb1a154bda1fbcf2/testweb/testweb.tar
tar xvf testweb.tar html
