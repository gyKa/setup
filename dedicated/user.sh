#!/bin/sh

echo "==> Setting up ZNC server..."
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/.znc/configs/znc.conf
mkdir -p ~/.znc/configs
mv znc.conf ~/.znc/configs/
znc --makepass
read -p "Copy these lines somewhere and press [Enter] key to continue..."

echo "==> Cleaning up..."
rm $0
