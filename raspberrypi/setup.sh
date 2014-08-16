#!/bin/sh

# Update system packages.
sudo apt-get update

# Remove useless files.
sudo rm -rf ~/python_games/ ~/ocr_pi.png ~/Desktop/

# Remove useless packages.
sudo apt-get remove --purge -y wolfram-engine python-picamera python3-picamera \
    python-rpi.gpio python3-rpi.gpio

# Upgrade software packages.
sudo apt-get upgrade -y

# Install WEB server.
sudo apt-get install -y nginx
sudo service nginx start

# Install MySQL server with empty root password.
sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y mysql-server

# Install PHP bridges between nginx and MySQL.
sudo apt-get install -y php5-fpm php5-mysql

# Install PHP command line interface.
sudo apt-get install -y php5-cli

# Install phpMyAdmin.
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin

# Create a symbolic link between phpMyAdmin and site’s directory.
sudo ln -s /usr/share/phpmyadmin/ /usr/share/nginx/www

# Change default site configuration.
wget https://raw.githubusercontent.com/gyKa/setup/master/raspberrypi/etc/nginx/sites-available/default
sudo mv default /etc/nginx/sites-available/

# Prepare transi site.
git clone https://github.com/gyKa/transi.git
wget https://raw.githubusercontent.com/gyKa/setup/master/raspberrypi/etc/nginx/sites-available/transi_site
sudo mv transi_site /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/transi_site /etc/nginx/sites-enabled/transi_site
make install -C transi/

# Prepare pi site.
wget https://raw.githubusercontent.com/gyKa/setup/master/raspberrypi/etc/nginx/sites-available/pi_site
sudo mv pi_site /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/pi_site /etc/nginx/sites-enabled/pi_site

# Restart PHP5 FastCGI process manager and nginx.
sudo service php5-fpm restart
sudo service nginx restart
