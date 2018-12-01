#!/bin/bash
#Installs top.sls and advanced-linux-apps
cd
echo "Updating packages..."
sudo apt-get update -qq >> /dev/null
echo "Installing git and salt..."
sudo apt-get install git salt-master salt-minion -y -qq >> /dev/null
echo "Cloning repository..."
cd /srv/
sudo git clone https://github.com/aksratamo/salt

#Running highstate and advanced-linux
sudo salt-call --local state.apply
sudo salt-call --local state.apply linux-apps
sudo salt-call --local state.apply linux-advanced
