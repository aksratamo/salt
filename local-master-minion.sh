#!/bin/bash
#installs git and saltmaster&minion sets keyboard to fi

cd
echo "Updating packages..."
sudo apt-get update -qq >> /dev/null
echo "Installing git and salt..."
sudo apt-get install git salt-master salt-minion -y -qq >> /dev/null
echo "Cloning repository..."
cd /srv/
sudo git clone https://github.com/aksratamo/salt

echo "Writing salt settings to file and restarting salt-minion..."
sudo echo -e "master: localhost\nid: localminion" | sudo tee /etc/salt/minion
sudo systemctl restart salt-minion
echo "Adding minion to master"
sleep 5
sudo salt-key -A
sleep 5
echo "Running highstate"
sudo salt '*' state.highstate
