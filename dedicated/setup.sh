#!/bin/sh

echo "==> Downloading the package lists from the repositories and updating them to get information on the newest versions of packages and their dependencies..."
apt-get update > /dev/null

echo "==> Fetching new versions of packages existing on the machine..."
apt-get upgrade -y
