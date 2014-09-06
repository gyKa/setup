#!/bin/sh

# Update system packages.
sudo apt-get update

# Remove useless files.
sudo rm -rf ~/python_games/ ~/ocr_pi.png ~/Desktop/

# Remove useless packages.
sudo apt-get remove --purge -y wolfram-engine python-picamera python3-picamera \
    python-rpi.gpio python3-rpi.gpio gnome-themes-standard-data \ 
    gnome-icon-theme zenity zenity-common

sudo apt-get autoremove --purge -y

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

# Prepare homino project.
git clone https://github.com/gyKa/homino.git
make install -C homino/

# Restart PHP5 FastCGI process manager and nginx.
sudo service php5-fpm restart
sudo service nginx restart

# Prepare SSH for deployment.
mkdir .ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClUVpqPk+DRJxbw18T1Xo7HQUOyYP+s4uahOEuZ8eMb9A540IQaZQcwH0UzICrvOl8gxTDabvOacY8VkLanX1lmkJWYg3B4jbpIY6wBx0H6l8WzHXXpR7GNQpNW7mmOYFB1xztKUIcTURXNozxi/Oeq/5MJJ4rSJOAleOX3MrzaapTkpEas8+Qv/kIJFTNx1yg+gWATG0DQREnekTm45U/2fSCsidt0pRWutyhnxRqpTw7IO1UsuzhFxPWZOxa/tP5DtfqqF2nQUV5zCZKv4T6ng8th1tq9dnmbql1KPmB4YMFrmHMH5CzU4WkvA3u8V76Xsm0bHV6ETt+9HZRIwGr Codeship/gyKa/transi" >> .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
