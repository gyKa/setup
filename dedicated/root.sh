#!/bin/sh

echo "==> Updating the list of packages..."
apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
apt-get upgrade -y > /dev/null

echo "==> Installing ZNC server..."
apt-get install -y znc > /dev/null

echo "==> Adding new user..."
adduser gytis

echo "==> Disabling root login over SSH..."
sed -i '/PermitRootLogin/ s/yes/no/' /etc/ssh/sshd_config
service ssh reload

echo "==> Preparing WEB environtment..."
usermod -a -G www-data gytis
chgrp -R www-data /var/www
chmod -R 775 /var/www
chmod -R g+ws /var/www
echo "===> karciauskas.lt"
mkdir -p /var/www/karciauskas-lt/public_html
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/karciauskas-lt.conf
mv karciauskas-lt.conf /etc/apache2/sites-available/karciauskas-lt.conf
a2ensite karciauskas-lt
echo "===> homepage.karciauskas.lt"
mkdir -p /var/www/homepage-karciauskas-lt/public_html
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/homepage-karciauskas-lt.conf
mv homepage-karciauskas-lt.conf /etc/apache2/sites-available/homepage-karciauskas-lt.conf
a2ensite homepage-karciauskas-lt
echo "===> finished!"
service apache2 restart

echo "==> Cleaning up..."
rm $0
