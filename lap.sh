#!/bin/sh

sudo apt-get update

## Install AP
sudo apt-get install apache2 apache2-doc apache2-utils -y
sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php7.0-intl php7.0-openssl php7.0-idn php-pear php7.0-imagick php7.0-mcrypt php7.0-mysql php7.0-ps php7.0-pspell php7.0-recode php7.0-xsl -y


# Permissions
sudo chown -R www-data:www-data /var/www

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
sudo a2enmod rewrite
sudo php7.0enmod mcrypt

sudo service apache2 restart

# Enabling Apache
sudo systemctl enable apache2.service