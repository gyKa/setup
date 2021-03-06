#!/bin/sh

echo "==> Updating the list of packages..."
apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
apt-get upgrade -y > /dev/null

echo "==> Installing Git..."
apt-get install -y git-core > /dev/null

echo "==> Install MySQL server..."
apt-get install -y mysql-server > /dev/null

echo "==> Install phpMyAdmin..."
apt-get install -y phpmyadmin > /dev/null

echo "==> Install PHP..."
apt-get install -y php5-cli > /dev/null
apt-get install -y php5-mcrypt > /dev/null
apt-get install -y php5-mysql > /dev/null
php5enmod mcrypt
apt-get install -y php5 > /dev/null

echo "==> Install cUrl..."
apt-get install -y curl > /dev/null

echo "==> Install Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "==> Adding new user..."
adduser gytis

echo "==> Disabling root login over SSH..."
sed -i '/PermitRootLogin/ s/yes/no/' /etc/ssh/sshd_config
service ssh reload

echo "==> Preparing WEB environtment..."
usermod -a -G www-data gytis
chgrp -R www-data /var/www
chmod -R 775 /var/www
chmod -R g+s /var/www # setgid permission
echo "===> karciauskas.lt"
mkdir -p /var/www/karciauskas-lt/public_html
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/karciauskas-lt.conf
mv karciauskas-lt.conf /etc/apache2/sites-available/karciauskas-lt.conf
a2ensite karciauskas-lt
echo "===> keturvalakiai.eu"
mkdir -p /var/www/keturvalakiai/public
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/keturvalakiai.conf
mv keturvalakiai.conf /etc/apache2/sites-available/keturvalakiai.conf
a2ensite keturvalakiai
echo "===> homepage.karciauskas.lt"
git clone https://github.com/gyKa/homepage.git /var/www/homepage-karciauskas-lt
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/homepage-karciauskas-lt.conf
mv homepage-karciauskas-lt.conf /etc/apache2/sites-available/homepage-karciauskas-lt.conf
a2ensite homepage-karciauskas-lt
make install -C /var/www/homepage-karciauskas-lt
echo "===> evenite.karciauskas.lt"
git clone https://github.com/gyKa/evenite.git /var/www/evenite
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/evenite.conf
mv evenite.conf /etc/apache2/sites-available/evenite.conf
a2ensite evenite
cd /var/www/evenite
composer install
chmod -R 775 /var/www/evenite/vendor /var/www/evenite/storage
cd ~
echo "===> finished!"
service apache2 restart

echo "==> Cleaning up..."
rm $0
