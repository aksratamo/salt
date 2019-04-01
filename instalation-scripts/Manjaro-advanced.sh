#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ -f /tmp/helloworld.txt ]; then
    echo "===> This install script has already been run! It is intended to be run only once <==="
    exit 0
fi
cd
echo "="
echo "===> Updating packages... <==="
echo "="
sudo pacman -Syu -y
echo "="
echo "===> Installing git and salt... <==="
echo "="
sudo pacman -S git salt -y 

sudo echo -e "master: localhost\nid: linux-advanced" | sudo tee /etc/salt/minion
echo "="
echo "===> Cloning repository... <==="
echo "="
cd /srv/
sudo git clone https://github.com/aksratamo/salt
cd salt/

echo "="
echo "===> Running highstate and advanced-linux, Please wait <==="
echo "="
sudo salt-call --local state.apply 
