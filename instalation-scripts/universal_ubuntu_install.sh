#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before

echo "Set to basic or advanced:"
read MinionID
if [ ! -f /etc/salt/minion ]; then
    	echo "===> First run installing salt <==="
   	sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
	echo "deb [arch=amd64] http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list
	echo "="
	echo "===> Updating packages... <==="
	echo "="
	sudo apt-get update && sudo apt upgrade -y
	echo "="
	echo "===> Installing git and salt... <==="
	echo "="
	sudo apt-get install git salt-minion -y 
	echo "="
	echo "===> Cloning repository... <==="
	echo "="
	cd /srv/
	sudo git clone https://github.com/aksratamo/salt
	cd salt/


fi

    	echo "===> Just changing Minion ID <==="
	echo -e "master: localhost\nid: linux-$MinionID" | sudo tee /etc/salt/minion
	echo "="
	echo "===> Running highstate with MinionID ¤ $MinionID ¤ , Please wait <==="
	echo "="
	sudo salt-call --local state.apply 
