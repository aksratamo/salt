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
<<<<<<< HEAD:instalation-scripts/linux-advanced.sh
sudo salt-call --local state.apply linux-apps
sudo salt-call --local state.apply linux-advanced


=======
sudo salt-call --local state.apply linux-advanced
sudo salt-call --local state.apply linux-apps
>>>>>>> fa7a6d65470b60c1574bb84e6d2ff2ec5ec5a5f1:linux-advanced.sh
