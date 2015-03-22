#!/bin/sh

echo "==> Updating the list of packages..."
sudo apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
sudo apt-get upgrade -y > /dev/null

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
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
echo "source .bash-git-prompt/gitprompt.sh" >> .bashrc
source .bashrc

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
