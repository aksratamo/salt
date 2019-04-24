#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ "$1" == test ]; then
        echo "===> TEST RUN <===" 
fi
echo "Set to basic or advanced. Add gaming for Lutris"
read MinionID
if [ ! -f /etc/salt/minion ]; then
	if [ "$(lsb_release -is)" == ManjaroLinux ] || [ "$(lsb_release -is)" == Arch ]; then
		sudo pacman -Syu -y --needed
		echo "="
		echo "===> Installing git and salt... <==="
		echo "="
		sudo pacman -S git salt -y 

	else
	        if [ "$(lsb_release -is)" == Ubuntu ]; then
        	    	echo "===> First run installing salt <==="
        	   	sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
        		echo "deb [arch=amd64] http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list
        		
        		if [ "$1" == test ]; then
        
        			echo "="
        			echo "===> Test run, not running updates <==="
        			echo "="
        			sudo apt-get update
        		else
        			echo "="
        			echo "===> Updating packages... <==="
        			echo "="
        			sudo apt-get update && sudo apt upgrade -y
        		fi	
        			echo "="
        			echo "===> Installing salt-minion and git... <==="
        			echo "="
        			sudo apt-get install git salt-minion -y 
                        else 
                                echo "un supported os"
                        fi 
	fi
	echo "="
	echo "===> Cloning repository... <==="
	echo "="
	cd /srv/
	sudo git clone https://github.com/aksratamo/salt
	cd 


fi

    	echo "===> Setting MinionID to ¤ $MinionID ¤  <==="
	echo -e "master: localhost\nid: linux-$MinionID" | sudo tee /etc/salt/minion
	echo "="
	
		if [ "$1" == test ]; then

			echo "="
			echo "===> Test run, making no changes <==="
			echo "="
			sudo salt-call --local state.apply test=True

		else
			echo "="
			echo "===> Running highstate with MinionID ¤ $MinionID ¤ , Please wait <==="
			echo "="
			sudo salt-call --local state.apply 
		fi
