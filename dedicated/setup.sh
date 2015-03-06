#!/bin/sh

echo "==> Downloading information from the repositories about newest versions of the packages and their dependencies..."
apt-get update > /dev/null

echo "==> Fetching and upgrading new versions of the packages existing on this machine..."
apt-get upgrade -y

# Self deletion.
rm $0
