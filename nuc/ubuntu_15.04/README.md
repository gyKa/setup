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

# Install Unity Twaek Tool...
$ sudo apt-get install unity-tweak-tool > /dev/null

# Install fswebcam...
$ sudo apt-get install fswebcam > /dev/null

# Install ffmpeg...
$ sudo apt-get install ffmpeg > /dev/null

# Install htop...
$ sudo apt-get install htop > /dev/null

# Prepare workspace...
$ mkdir ~/Workspace
$ git clone git@github.com:gyKa/setup.git ~/Workspace/setup
$ git clone git@github.com:gyKa/bin.git ~/Workspace/bin
$ make -c ~/Workspace/bin
```

## Appearance

* Change wallpaper.
* Enable Workspaces.
* Remove LibreOffice, Ubuntu Software Center, Amazon, System settings icons from Launcher.
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
