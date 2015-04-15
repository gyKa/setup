#!/bin/sh

# Update system packages.
sudo apt-get update -y

# Remove useless files.
sudo rm -rf ~/python_games/ ~/ocr_pi.png ~/Desktop/

# Remove useless packages.
sudo apt-get remove --purge -y wolfram-engine python-picamera python3-picamera \
    python-rpi.gpio python3-rpi.gpio gnome-themes-standard-data \
    gnome-icon-theme zenity zenity-common xserver-xorg-core xserver-common \
    sonic-pi raspberrypi-artwork penguinspuzzle lxde lxde-common lxde-core \
    lxde-icon-theme

sudo apt-get autoremove --purge -y

# Upgrade software packages.
sudo apt-get upgrade -y
