#!/bin/bash
#Simple logging server

echo "Setting keyboard layout to fi-FI"
setxkbmap fi
cd ~
echo "Updating packages..."
sudo apt-get update -qq >> /dev/null
echo "Installing git and salt..."
sudo apt-get install git salt-master salt-minion -y -qq >> /dev/null
echo "Cloning repository..."
cd /srv/
git clone https://github.com/aksratamo/salt
