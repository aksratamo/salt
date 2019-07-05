#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ "$1" == test ]; then
        echo "===> TEST RUN <===" 
fi
echo "=== Choose installation type ==="
echo "=== Type basic or advanced ==="
echo "=== Add gaming for Lutris ==="
echo "=== Example: advanced gaming ==="
read MinionID


# If Salt minion info does not exist install salt othervise skip salt installation
if [ ! -f /etc/salt/minion ]; then



# check if Arch or Ubuntu based
# If Arch based install salt and git with pacman
	if [ "$(lsb_release -is)" == ManjaroLinux ] || [ "$(lsb_release -is)" == Arch ]; then
		sudo pacman -Syu -y --needed
		echo "===> Installing git and salt... <==="
		sudo pacman -S git salt -y 


# If Ubuntu based but not Ubuntu lts based add Salt PPA (without PPA Salt is broken in non LTS)
	elif [ "$(lsb_release -is)" == Ubuntu ] && [ "$(lsb_release -rs)" != 18.04 ] && [ "$(lsb_release -rs)" != 20.04 ] ; then
       	    	echo "===> First run. Installing Salt with ppa.<==="
       	   	sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
       		echo "deb [arch=amd64] http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list
		
# If Ubuntu is LTS dont install Salt PPA
	elif [ "$(lsb_release -is)" == Ubuntu ] && [ "$(lsb_release -rs)" == 18.04 ] || [ "$(lsb_release -rs)" == 20.04 ] ; then
		echo "===> First run. Installing Salt. OS is LTS, salt ppa skipped <==="

        else 
                echo "Unsupported OS. ABORT"
		exit
fi       	







# If ubuntu based install salt and git with apt
	if [ "$(lsb_release -is)" == Ubuntu ]; then
	       	if [ "$1" == test ]; then
        		echo "===> Test run, not running updates <==="
        		sudo apt-get update
        	else
        		echo "===> Updating packages... <==="
        		sudo apt-get update && sudo apt upgrade -y
        	fi	
        		echo "===> Installing salt-minion and git... <==="
        		sudo apt-get install git salt-minion -y 

                        
	fi


	echo "===> Cloning repository... <==="
	cd /srv/ || exit
	sudo git clone https://github.com/aksratamo/salt
	cd || exit
# Stop Salt service (its not used in local installation)
	sudo systemctl disable salt-minion.service
	sudo systemctl stop salt-minion.service

fi
# Salt installation ends






# Add Salt minion info
    	echo "===> Setting MinionID to ¤ $MinionID ¤  <==="
	echo -e "master: localhost\nid: linux-$MinionID\nfile_client: local" | sudo tee /etc/salt/minion
	
		if [ "$1" == test ]; then

			echo "="
			echo "===> Test run, making no changes <==="
			echo "="
			sudo salt-call --local state.apply test=True
			sudo systemctl status salt-minion.service

		else
			echo "="
			echo "===> Running highstate with MinionID ¤ $MinionID ¤ , Please wait <==="
			echo "="
			sudo salt-call --local state.apply 
fi
