#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

sudo apt-get install htop keepassx flashplugin-installer git vim gitg \
python-virtualenv tree mysql-workbench mysql-server

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_14.04/Release.key
sudo apt-key add - < Release.key
rm Release.key
sudo apt-get update
sudo apt-get install owncloud-client

ssh-keygen -t rsa -C "NUC"

mkdir ~/Workspace

rm ~/examples.desktop
sudo rm -rf /usr/share/example-content/

git config --global user.name "Gytis Karčiauskas"
git config --global user.email gytis@karciauskas.lt

