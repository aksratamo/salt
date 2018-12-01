#!/bin/bash
#Installs top.sls and advanced-linux-apps
cd
echo "Updating packages..."
sudo apt-get update -qq >> /dev/null
echo "Installing git and salt..."
sudo apt-get install git -y -qq >> /dev/null
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P
echo "Cloning repository..."
cd /srv/
sudo git clone https://github.com/aksratamo/salt

#Running highstate and advanced-linux
sudo salt-call --local state.apply
sudo salt-call --local state.apply linux-apps
sudo salt-call --local state.apply linux-advanced
