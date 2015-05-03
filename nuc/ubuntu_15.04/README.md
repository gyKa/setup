```sh
# Update the list of packages...
$ sudo apt-get update -y > /dev/null

# Install the newest versions of all packages...
$ sudo apt-get upgrade -y > /dev/null

# Install ownCloud client...
$ sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
$ wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_15.04/Release.key
$ sudo apt-key add - < Release.key
$ rm Release.key
$ sudo apt-get update -y > /dev/null
$ sudo apt-get install -y owncloud-client > /dev/null

# Install KeePassX...
$ sudo apt-get install -y keepassx > /dev/null

# Login to ownCloud.

# Generate SSH keys...
$ ssh-keygen -t rsa -C "NUC"

# Upload public SSH key to GitHub.

# Remove example content...
$ rm ~/examples.desktop
$ sudo rm -rf /usr/share/example-content/

# Install and set up Git...
$ sudo apt-get install -y git > /dev/null
$ git config --global user.name "Gytis Karčiauskas"
$ git config --global user.email gytis@karciauskas.lt
$ git config --global push.default simple

# Install GitG...
sudo apt-get install -y gitg > /dev/null

# Installing VIM...
$ sudo apt-get install -y vim > /dev/null

# Prepare workspace...
$ mkdir ~/Workspace
$ git clone git@github.com:gyKa/setup.git ~/Workspace/setup
```
