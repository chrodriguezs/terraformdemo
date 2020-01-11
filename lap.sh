#!/bin/sh
echo "Updating Libraries"
sudo apt-get update
echo "Installing Apache"
sudo apt-get install -y apache2 apache2-bin apache2-utils
echo "Installing PHP & Complements"
sudo apt-get install -y php7.0 php7.0-gd php7.0-bcmath php7.0-intl php7.0-mbstring php7.0-curl
echo "Enable rewrite & Restart and Enable Apache Service"
sudo a2enmod rewrite
sudo service apache2 restart
sudo systemctl enable apache2.service