#!/bin/sh

echo "==> Downloading the package lists from the repositories and updating them to get information on the newest versions of packages and their dependencies..."
sudo apt-get update > /dev/null

echo "==> Fetching new versions of packages existing on the machine..."
sudo apt-get upgrade -y

echo "==> Installing untily for desktop brightness and setting up to 100% brightness..."
sudo apt-get install -y xbacklight
xbacklight -set 100

echo "==> Installing ownCloud client..."
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
sudo apt-get update
sudo apt-get install owncloud-client

echo "==> Installing KeepassX..."
sudo apt-get install keepassx

echo "==> Installing and setting up GIT..."
sudo apt-get install git
git config --global user.name "Gytis Karčiauskas"
git config --global user.email gytis@karciauskas.lt

echo "==> Installing cURL..."
sudo apt-get install curl

echo "==> Installing PHP5..."
sudo apt-get install php5

echo "==> Installing Composer globally..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "==> Installing MySQL server..."
sudo apt-get install mysql-server

echo "==> Installing phpMyAdmin..."
sudo apt-get install phpmyadmin

echo "==> Generating SSH key for this computer..."
ssh-keygen -t rsa -C "eeePC"
