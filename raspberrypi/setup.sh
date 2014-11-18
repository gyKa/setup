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

# Install IRC client and screen.
sudo apt-get install -y weechat weechat-scripts screen

# Autoload Weechat scripts.
ln -s /usr/share/weechat/perl/buffers.pl ~/.weechat/perl/autoload/buffers.pl
