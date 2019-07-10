#!/bin/bash
# Installs top.sls and advanced-linux-apps
# Check if script has been run before
if [ "$1" == test ]; then
        echo "===> TEST RUN <===" 
fi
echo -e "\e[4m\e[32m === Choose installation type ===\e[0m"
echo -e "\e[4m\e[32m === Type basic or advanced   === \e[0m"
echo -e "\e[4m\e[32m === Add gaming for Lutris    === \e[0m"
echo -e "\e[4m\e[32m === Example: advanced gaming === \e[0m"
read MinionID


# If Salt minion info does not exist install salt othervise skip salt installation
if [ ! -f /etc/salt/minion ]; then

#echo -e "\e[42mGREEN BACKGROUND COLOR TEXT HERE\e[0m"

#echo -e "\e[42mGREEN BACKGROUND COLOR TEXT HERE\e[0m"


# check if Arch or Ubuntu based
# If Arch based install salt and git with pacman
	if [ "$(lsb_release -is)" == ManjaroLinux ] || [ "$(lsb_release -is)" == Arch ]; then
		sudo pacman -Syu -y --needed
		echo -e "\e[42mInstalling Salt on Linux based on \e[4m$(lsb_release -is)\e[0m"
		sudo pacman -S git salt -y 


# If Ubuntu based but not Ubuntu lts based add Salt PPA (without PPA Salt is broken in non LTS)
	elif [ "$(lsb_release -is)" == Ubuntu ] && [ "$(lsb_release -rs)" != 18.04 ] && [ "$(lsb_release -rs)" != 20.04 ] ; then
       	    	echo -e "\e[42mInstalling Salt with PPA. Your Linux is non LTS \e[4m$(lsb_release -is) $(lsb_release -rs)\e[0m"
       	   	sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
       		echo "deb [arch=amd64] http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list
		
# If Ubuntu is LTS dont install Salt PPA
	elif [ "$(lsb_release -is)" == Ubuntu ] && [ "$(lsb_release -rs)" == 18.04 ] || [ "$(lsb_release -rs)" == 20.04 ] ; then
		echo -e "\e[42mInstalling Salt without PPA. Your Linux is LTS \e[4m$(lsb_release -is) $(lsb_release -rs)\e[0m"

        else 
		echo -e "\e[41mYou seem to be running $(lsb_release -is) based Linux. Its not supported\e[0m"
                echo -e "\e[41mEXIT\e[0m"
		exit
fi       	







# If ubuntu based install salt and git with apt
	if [ "$(lsb_release -is)" == Ubuntu ]; then
	       	if [ "$1" == test ]; then
			echo -e "\e[43mTest run, not running updates\e[0m"
        		sudo apt-get update
        	else
        		echo -e "\e[42mUpdating packages\e[0m"
        		sudo apt-get update && sudo apt upgrade -y
        	fi	
			echo -e "\e[42mInstalling salt-minion and git\e[0m"
        		sudo apt-get install git salt-minion -y 

                        
	fi

	echo -e "\e[42mCloning repository\e[0m"
	cd /srv/ || exit
	sudo git clone https://github.com/aksratamo/salt
	cd || exit
# Stop Salt service (its not used in local installation)
	sudo systemctl disable salt-minion.service
	sudo systemctl stop salt-minion.service

fi
# Salt installation ends






# Add Salt minion info
	echo -e "master: localhost\nid: linux-$MinionID\nfile_client: local" | sudo tee /etc/salt/minion
	sudo -i sed "s/ - username: empty/ - username: $USER/" /srv/salt/usercmd/user.sls
	
		if [ "$1" == test ]; then

			echo -e "\e[43mTest run, making no changes\e[0m"
			sudo salt-call --local state.apply test=True
			sudo systemctl status salt-minion.service

		else
			echo -e "\e[42mRunning highstate with MinionID \e[4m$MinionID\e[0m"
			echo -e "\e[42m\e[4mPlease wait...\e[0m"
			sudo salt-call --local state.apply 
fi
