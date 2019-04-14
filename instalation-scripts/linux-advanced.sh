#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ -f /tmp/helloworld.txt ]; then
    echo "===> This install script has already been run! It is intended to be run only once <==="
    exit 0
fi
sudo wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list
echo "="
echo "===> Updating packages... <==="
echo "="
sudo apt-get update && sudo apt upgrade -y
echo "="
echo "===> Installing git and salt... <==="
echo "="
sudo apt-get install git salt-minion -y 

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


