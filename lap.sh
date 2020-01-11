#!/bin/sh
# Update packages
echo -e "\n Updating System.."
echo $(sudo apt-get update)
## Install AMP
echo -e "\n Installing Apache2"
sudo apt-get install -y apache2
echo -e "\n Installing PHP & Requirements"
sudo apt-get install -y php php-gd php-bcmath php-intl php-openssl php-mbstring php-curl php-mysql
echo -e "\n Verifying installs$Color_Off"
sudo apt-get install -y apache2 php php-gd php-bcmath php-intl php-openssl php-mbstring php-curl php-mysql
## TWEAKS and Settings
# Permissions
echo -e "\n Permissions for /var/www"
sudo chown -R www-data:www-data "/var/www"
echo -e "$Green \n Permissions have been set"
# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "\n Enabling Modules"
sudo a2enmod rewrite
# Restart Apache
echo -e "\n Restarting Apache"
sudo service apache2 restart
# Enabling Apache
echo -e "\n Enabling Apache"
sudo systemctl enable apache2.service