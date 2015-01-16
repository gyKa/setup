#!/bin/sh

echo "==> Removing useless stuff..."
rm ~/examples.desktop
sudo rm -rf /usr/share/example-content/

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

echo "==> Installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo "===> Installing PyPI..."
sudo apt-get install -y python-pip

echo "===> Installing VirtualEnv..."
sudo pip install virtualenv

echo "===> Installing the stable release version of RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "===> Installing Ruby..."
rvm install 2.1.4

echo "===> Installing IRB..."
sudo apt-get install -y irb

echo "===> Installing Rails..."
gem install rails

echo "===> Install Heroku Toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "===> Install NodeJS and NPM..."
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
