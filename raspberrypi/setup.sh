#!/bin/sh

# Update system packages.
sudo apt-get update

# Remove useless files.
sudo rm -rf ~/python_games/ ~/ocr_pi.png ~/Desktop/

# Remove useless packages.
sudo apt-get remove --purge -y wolfram-engine python-picamera python3-picamera \
    python-rpi.gpio python3-rpi.gpio gnome-themes-standard-data \ 
    gnome-icon-theme zenity zenity-common xserver-xorg-core xserver-common

sudo apt-get autoremove --purge -y

# Upgrade software packages.
sudo apt-get upgrade -y

# Install system utils.
sudo apt-get install -y htop vim

# Install IRC client and screen.
sudo apt-get install -y weechat weechat-scripts screen

# Autoload Weechat scripts.
ln -s /usr/share/weechat/perl/buffers.pl ~/.weechat/perl/autoload/buffers.pl

# Install NodeJS and NPM.
wget http://nodejs.org/dist/v0.10.2/node-v0.10.2-linux-arm-pi.tar.gz
tar -xvzf node-v0.10.2-linux-arm-pi.tar.gz
echo "NODE_JS_HOME=/home/pi/node-v0.10.2-linux-arm-pi" >> ~/.bash_profile
echo "PATH=$PATH:$NODE_JS_HOME/bin" >> ~/.bash_profile
source ~/.bash_profile
rm node-v0.10.2-linux-arm-pi.tar.gz

# Install Hubot.
sudo npm install -g hubot coffee-script

# Install Redis.
wget http://download.redis.io/releases/redis-2.8.17.tar.gz
tar xzf redis-2.8.17.tar.gz
cd redis-2.8.17
make # take cup of coffe
make test
sudo make install
cd utils
sudo ./install_server.sh
cd ../..
rm redis-2.8.17.tar.gz

# Install Nginx.
sudo apt-get install -y nginx
sudo service nginx start

# Install PHP.
sudo apt-get install -y php5-fpm

# Setup Nginx and PHP.
sudo mkdir -p /var/www
sudo chown -R $USER:$USER /var/www
sudo chmod -R 755 /var/www
wget https://raw.githubusercontent.com/gyKa/setup/master/raspberrypi/etc/nginx/sites-available/default > /dev/null 2>&1
sudo mv default /etc/nginx/sites-available/
sudo service php5-fpm restart
sudo service nginx restart

# Setup sites.
git clone https://github.com/gyKa/evenite.git /var/www/evenite

# Setup GIT.
git config --global user.email "gytis@karciauskas.lt"
git config --global user.name "Gytis Karčiauskas"
