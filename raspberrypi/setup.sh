#!/bin/sh

# Update system packages.
sudo apt-get update

# Remove useless packages.
sudo apt-get remove --purge -y wolfram-engine python-picamera python3-picamera

# Upgrade software packages.
sudo apt-get upgrade -y

# Install web server.
sudo apt-get install -y nginx
sudo service nginx start