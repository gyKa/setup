#!/bin/sh

echo "==> Updating the list of packages..."
apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
apt-get upgrade -y > /dev/null

echo "==> Installing Git..."
apt-get install -y git > /dev/null

echo "==> Installing and setting up ZNC server..."
apt-get install -y znc
adduser bouncer
su bouncer
znc --makeconf
exit

echo "==> Preparing WEB environtment..."
echo "===> karciauskas.lt"
mkdir -p /var/www/karciauskas.lt/public_html
git clone https://github.com/gyKa/homepage.git /var/www/karciauskas.lt/public_html
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/etc/apache2/sites-available/karciauskas.lt
mv karciauskas.lt /etc/apache2/sites-available/karciauskas.lt
a2ensite karciauskas.lt
# We should also modify our permissions a little bit to ensure that read access
# is permitted to the general web directory and all of the files and folders it
# contains so that pages can be served correctly:
chmod -R 755 /var/www
service apache2 restart

echo "==> Cleaning up..."
rm $0
