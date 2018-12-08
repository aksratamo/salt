#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ -f /tmp/helloworld.txt ]; then
    echo "===> This install script has already been run! It is intended to be run only once <==="
    exit 0
fi
cd
echo "===> Updating packages... <==="
sudo apt-add-repository multiverse && sudo apt-get update 
echo "===> Installing git and salt... <==="
sudo apt-get install git curl salt-minion -y 
if [ ! -d /srv/]; then
echo "===> Installing  salt-minion with workaround bootstrap instalation... <==="
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P 
fi
sudo echo -e "master: localhost\nid: linux-advanced" | sudo tee /etc/salt/minion
echo "===> Cloning repository... <==="
cd /srv/
sudo git clone https://github.com/aksratamo/salt
cd salt/
# sudo wget https://someonewhocares.org/hosts/hosts


echo "===> Running highstate and advanced-linux, Please wait <==="
sudo salt-call --local state.apply 
# --state-output=terse
