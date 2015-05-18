## Installation & configuration

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
$ sudo apt-get install -y gitg > /dev/null

# Install VIM...
$ sudo apt-get install -y vim > /dev/null

# Install XChat...
$ sudo apt-get install -y xchat > /dev/null

# Install VLC...
$ sudo apt-get install -y vlc > /dev/null

# Install Liferea...
$ sudo apt-get install -y liferea > /dev/null

# Install Turpial...
$ sudo apt-get install -y turpial > /dev/null

# Installing Ubuntu restricted extras...
$ sudo apt-get install -y ubuntu-restricted-extras > /dev/null

# Install fswebcam...
$ sudo apt-get install fswebcam > /dev/null

# Install ffmpeg...
$ sudo apt-get install ffmpeg > /dev/null

# Install htop...
$ sudo apt-get install htop > /dev/null

# Install Ruby...
$ sudo apt-get install ruby > /dev/null
$ sudo apt-get install ruby-dev > /dev/null # if you want build something

# Install Jekyll...
$ sudo gem install jekyll

# Install NodeJS...
$ sudo apt-get install nodejs > /dev/null

# Install PHP5...
$ sudo apt-get install php5-cli > /dev/null
$ sudo apt-get install php5-mcrypt > /dev/null
$ sudo php5enmod mcrypt

# Install curl...
$ sudo apt-get install curl > /dev/null

# Install Composer...
$ curl -sS https://getcomposer.org/installer | php
$ sudo mv composer.phar /usr/local/bin/composer

# Install Lavaral installer...
$ composer global require "laravel/installer=~1.1"
$ echo "PATH=$PATH:~/.composer/vendor/bin" >> ~/.bashrc
$ source ~/.bashrc

# Install PIP...
$ sudo apt-get install python-pip

# Install Willie IRC bot...
$ sudo pip install willie

# Prepare workspace...
$ mkdir ~/Workspace
$ git clone git@github.com:gyKa/setup.git ~/Workspace/setup
$ git clone git@github.com:gyKa/bin.git ~/Workspace/bin
$ make -c ~/Workspace/bin
```

## Appearance

Unity sometimes crashes. Gnome 3/Classic looks terrible. Mate is FTW!

```sh
sudo apt-get install ubuntu-mate-core ubuntu-mate-desktop
sudo reboot
```

Change Splash screen.

```sh
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
```

* Change wallpaper.
* Add KeepassX, Thunderbird, XChat icons into Laucher.
* Add Lithuanian keyboard layout.

## Applications

### Firefox

Add *Window and Tab Limiter 4.28* plugin.
Add *RSS Icon in url bar 1.5* plugin.
Add *YouTube mp3 1.0.9* plugin.

Change homepage to *http://homepage.karciauskas.lt*.

### Thunderbird

Add 3 accounts.

### XChat

Add account for 2 servers.
Enable timestamps.

## Unity Tweak Tool

Set vertical workspaces to 3.
