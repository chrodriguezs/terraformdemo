#!/bin/sh

## Install AP
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y
sudo apt-get install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-intl php5-openssl php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl -y


# Permissions
sudo chown -R www-data:www-data /var/www

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
sudo a2enmod rewrite
sudo php5enmod mcrypt

sudo service apache2 restart

# Enabling Apache
sudo systemctl enable apache2.service

exit