#!/bin/bash
#installs git and saltmaster&minion sets keyboard to fi

echo "Setting keyboard layout to fi-FI"
setxkbmap fi
cd
echo "Updating packages..."
sudo apt-get update -qq >> /dev/null
echo "Installing git and salt..."
sudo apt-get install git salt-master salt-minion -y -qq >> /dev/null
echo "Cloning repository..."
cd /srv/
sudo git clone https://github.com/aksratamo/salt
