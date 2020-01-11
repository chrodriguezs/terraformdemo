#!/bin/sh
 
#######################################
# Bash script to install an AMP stack and PHPMyAdmin plus tweaks. For Debian based systems.
# Written by @AamnahAkram from http://aamnah.com
# In case of any errors (e.g. MySQL) just re-run the script. Nothing will be re-installed except for the packages with errors.
#######################################
 
# Update packages
echo -e "\n Updating System.."
sudo apt-get update
## Install AMP
echo -e "\n Installing Apache2"
sudo apt-get install -y apache2
echo -e "\n Installing PHP & Requirements"
sudo apt-get install -y libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php-gd php7.0-intl  php-pear php-mcrypt php7.0-mysql php7.0-ps php7.0-pspell php7.0-recode
echo -e "\n Verifying installs$Color_Off"
sudo apt-get install -y apache2 libapache2-mod-php7.0 php7.0 mysql-server php-pear php7.0-mysql mysql-client mysql-server php7.0-mysql php-gd
## TWEAKS and Settings
# Permissions
echo -e "\n Permissions for /var/www"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set"
# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "\n Enabling Modules"
sudo a2enmod rewrite
sudo phpenmod mcrypt
# Restart Apache
echo -e "\n Restarting Apache"
sudo service apache2 restart
# Enabling Apache
echo -e "\n Enabling Apache"
sudo systemctl enable apache2.service