
#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ -f /tmp/helloworld.txt ]; then
    echo "===> This install script has already been run! It is intended to be run only once <==="
    exit 0
fi
wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee -a /etc/apt/sources.list.d/saltstack.list
echo "="
echo "===> Updating packages... <==="
echo "="
sudo apt-get update 
echo "="
echo "===> Installing git and salt... <==="
echo "="
sudo apt-get install git salt-minion -y 
#if [ ! -d /srv/]; then
#echo "===> Installing  salt-minion with workaround bootstrap instalation... <==="
#curl -L https://bootstrap.saltstack.com -o install_salt.sh
#sudo sh install_salt.sh -P 
#fi
sudo echo -e "master: localhost\nid: linux-apps" | sudo tee /etc/salt/minion
echo "="
echo "===> Cloning repository... <==="
echo "="
cd /srv/
sudo git clone https://github.com/aksratamo/salt
cd salt/
# sudo wget https://someonewhocares.org/hosts/hosts

echo "="
echo "===> Running highstate and advanced-linux, Please wait <==="
echo "="
sudo salt-call --local state.apply 
# --state-output=terse
