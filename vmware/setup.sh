#!/bin/sh

echo "==> Downloading the package lists from the repositories and updating them to get information on the newest versions of packages and their dependencies..."
sudo apt-get update > /dev/null

echo "==> Fetching new versions of packages existing on the machine..."
sudo apt-get upgrade -y

echo "==> Installing ownCloud client..."
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
sudo apt-get update > /dev/null
sudo apt-get install -y --force-yes owncloud-client

echo "==> Installing KeepassX..."
sudo apt-get install -y keepassx

echo "==> Installing and setting up GIT..."
sudo apt-get install -y git
git config --global user.name "Gytis Karčiauskas"
git config --global user.email gytis@karciauskas.lt

echo "==> Installing cURL..."
sudo apt-get install -y curl

echo "==> Installing PHP5..."
sudo apt-get install -y php5 php5-curl php5-xdebug

echo "==> Installing Composer globally..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "==> Installing MySQL server..."
sudo apt-get install -y mysql-server

echo "==> Installing phpMyAdmin..."
sudo apt-get install -y phpmyadmin

echo "==> Installing VIM..."
sudo apt-get install -y vim

echo "==> Installing gitg..."
sudo apt-get install -y gitg

echo "==> Installing Dia..."
sudo apt-get install -y dia

echo "==> Generating SSH key for this computer..."
ssh-keygen -t rsa -C "Ubuntu"
