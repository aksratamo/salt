

# Distrohoppers tool for Privacy minded Ubuntu based distros
## Distrohopping made easy 
#### Only for Ubuntu based distros for now.
It will remove telemetry from firefox, adjust the scroll speed, remove title bar. And install privacy tools like nextcloud-client, keepass and configure UFW


## Instalation
### For masterless local salt (my preference)
(Copy first line only if you want to have finnish keyboard)
```bash
setxkbmap fi
wget https://raw.githubusercontent.com/aksratamo/salt/master/instalation-scripts/linux-advanced.sh
sudo bash linux-advanced.sh
``` 


### Setting up Master and slave on local mashine and running highstate. 
```bash
setxkbmap fi
wget https://raw.githubusercontent.com/aksratamo/salt/master/local-master-minion.sh
sudo bash local-master-minion.sh
```

## FAQ

### Whats the goal of this project?
My goal is to make a privacy minded distrohoppers toolbox. So that I can easily change distros and install all my needed aplications and configs. 
The other reason is to make privacy easy. If you run this you get https://someonewhocares.org/hosts/hosts hosts file. Firefox with disabled telemetry and duckduckgo as startpage, Nextcloud client and keepassxc and enables firewall.
My goal is to make a salt like [Tero Karvinen sirotin](https://github.com/terokarvinen/sirotin)
That when I try new Linux distros I can always just run a local salt putting everything in same state

### How it works?
When you clone this repo it will create a salt/* folder structure what you should put under /srv/* in root. Because Salt is run as root we need in this case run git also as root.
For updating this I need to use 
```
sudo git add . && sudo git commit; sudo  git pull && sudo git push
```
### Wich Distros this works on?
I have tested it with Kubuntu 18.04 and 18.10, Ubuntu and KdePlasma. 
The apt install for saltstack does not work for 18.10 based distros so I switched it around for the multiplatform installer using curl.
It works on both ubuntus but on Plasma it says "error: No dependencies instalation function found" when trying to instal salt. I need to study this further.

### Is there a full list of changes this makes?
Here: 
Installs these aplications
* neofetch
* keepassxc
* httpie
* nextcloud-client (adds offical PPA)
* qbittorrent      
* htop
* tree
* firefox 
* ufw (enables it only ssh open)
* vlc
* stacer (system monitor)

Firefox removes telemetry makes scroll wheel faster and smoother, disables title bar, enables mouse middle click autoscrolling, puts the white default theme on, removes the warning when closing firefox with multiple tabs open.   

### What are those windows files?
That where part of the schoolproject where we needed to configure salt for windows also. Thats not my main aim so I will probably clean them at some point. Or I will make an own instalation version for windows. At the moment it installs NotepadPlusPlus, chocolatey, VLC and with chocolatey it installs autohotkey.
### How did this start?
This is my Linux server salt school project
I'm doing a advanced linux server management [course](http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-%e2%80%93-loppukevat-2018-5p)
My goal is to make an ever growing [SaltStack](https://www.saltstack.com/) config with version history for each week. 

You can find my work relating to this project at 
<https://akseliratamo.fi>


##### Reference sources:
<https://github.com/jisosomppi/log-analysis/blob/master/LICENSE>

<https://github.com/terokarvinen/sirotin>
