#!/bin/sh

echo "==> Updating the list of packages..."
sudo apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
sudo apt-get upgrade -y > /dev/null

echo "==> Setting up Bash..."
echo 'alias ls="ls --color=auto"' > ~/.bashrc
source ~/.bashrc

echo "==> Installing ownCloud client..."
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_14.04/Release.key
sudo apt-key add - < Release.key
rm Release.key
sudo apt-get update -y > /dev/null
sudo apt-get install -y owncloud-client > /dev/null

echo "==> Installing KeePassX..."
sudo apt-get install -y keepassx > /dev/null

echo "==> Installing and setting up Git..."
sudo apt-get install -y git > /dev/null
git config --global user.name "Gytis Karčiauskas"
git config --global user.email gytis@karciauskas.lt
git config --global push.default simple

echo "==> Installing Bash Git prompt..."
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
echo "source ~/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc
source ~/.bashrc

echo "==> Installing Ubuntu restricted extras..."
sudo apt-get install -y ubuntu-restricted-extras > /dev/null

echo "==> Installing GitG..."
sudo apt-get install -y gitg > /dev/null

echo "==> Installing Flash support..."
sudo apt-get install -y flashplugin-installer > /dev/null

echo "==> Installing VIM..."
sudo apt-get install -y vim > /dev/null

echo "==> Installing VLC..."
sudo apt-get install -y vlc > /dev/null

echo "==> Installing XChat..."
sudo apt-get install -y xchat > /dev/null

echo "==> Installing Filezilla..."
sudo apt-get install -y filezilla > /dev/null

echo "==> Installing and setting up Apache2..."
sudo apt-get install -y apache2 > /dev/null
sudo chown -R $USER:$GROUP /var/www
sudo rm /etc/apache2/envvars
wget https://raw.githubusercontent.com/gyKa/setup/master/nuc/etc/apache2/envvars
sudo mv envvars /etc/apache2/

echo "==> Installing MySQL server..."
sudo apt-get install -y mysql-server > /dev/null

echo "==> Installing PHP5..."
# Package php5 required only for the WEB.
sudo apt-get install -y php5-cli php5 php5-mysql > /dev/null

echo "==> Installing Composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "==> Installing phpMyAdmin..."
sudo apt-get install -y phpmyadmin > /dev/null

echo "==> Installing and setting up phpbrew..."
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
sudo mv phpbrew /usr/bin/phpbrew
phpbrew init
echo "source ~/.phpbrew/bashrc" >> ~/.bashrc
source ~/.phpbrew/bashrc
sudo apt-get install -y libxml2-dev libssl-dev libbz2-dev libreadline-dev \
libxslt1-dev
phpbrew install 5.4.38

echo "==> Installing WP-CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash
mv wp-completion.bash ~/.wp-cli/.wp-completion.bash
echo "source ~/.wp-cli/.wp-completion.bash" >> .bashrc
source ~/.wp-cli/.wp-completion.bash

echo "==> Installing PIP..."
sudo apt-get install -y python-pip > /dev/null

echo "==> Installing virtualenv..."
sudo pip install virtualenv

echo "==> Generating SSH keys..."
ssh-keygen -t rsa -C "NUC"

read -p "Upload public SSH key to GitHub.com and press [Enter] key to continue..."

echo "==> Removing example content..."
rm ~/examples.desktop
sudo rm -rf /usr/share/example-content/

echo "==> Preparing workspace..."
mkdir ~/Workspace
git clone git@github.com:gyKa/setup.git ~/Workspace/setup
git clone git@github.com:gyKa/back-time.git ~/Workspace/back-time
git clone git@github.com:gyKa/homepage.git ~/Workspace/homepage

echo "==> Cleaning up..."
rm $0
