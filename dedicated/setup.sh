#!/bin/sh

echo "==> Updating the list of packages..."
apt-get update -y > /dev/null

echo "==> Installing the newest versions of all packages..."
apt-get upgrade -y > /dev/null

echo "==> Installing cURL..."
apt-get install -y curl > /dev/null

echo "==> Installing Git..."
apt-get install -y git > /dev/null

echo "==> Installing and setting up ZNC server..."
apt-get install -y znc
adduser bouncer
su bouncer
znc --makeconf
exit

echo "==> Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
usermod -a -G rvm root
source /etc/profile.d/rvm.sh

echo "==> Installing Ruby..."
rvm install ruby-2.2.1

echo "==> Installing NodeJS..."
curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs

echo "==> Installing MySQL server..."
apt-get install -y mysql-server

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
