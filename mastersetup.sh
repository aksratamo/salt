#!/bin/bash
#installs git and saltmaster&minion sets keyboard to fi

echo "Setting keyboard layout to fi-FI"
setxkbmap fi
cd
echo "Updating packages..."
sudo apt-get update
echo "Installing git and salt..."
sudo apt-get install git salt-master salt-minion -y -qq >> /dev/null
echo "Cloning repository..."
cd /srv/
git clone https://github.com/aksratamo/salt
