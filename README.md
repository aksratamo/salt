# Linux server Salt Config
This is my Linux server salt school project
I'm doing a advanced linux server management [course](http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-%e2%80%93-loppukevat-2018-5p)
My goal is to make an ever growing [SaltStack](https://www.saltstack.com/) config with version history for each week. 

You can find my work relating to this project at 
<https://akseliratamo.fi>

## Installation
### Setting up Master and slave on local mashine and running highstate. (first line only if you want finnish keyboard)
```bash
setxkbmap fi
wget https://raw.githubusercontent.com/aksratamo/salt/master/local-master-minion.sh
sudo bash local-master-minion.sh
```

## FAQ
## How it works
When you clone this repo it will create a salt/* folder structure what you should put under /srv/* in root. Because Salt is run as root we need in this case run git also as root.
For updating this I need to use 
```
sudo git add . && sudo git commit; sudo  git pull && sudo git push
```

### Goal
My goal is to make a salt like [Tero Karvinen sirotin](https://github.com/terokarvinen/sirotin)
That when I try new Linux distros I can always just run a local salt putting everything in same state 

## Reference sources:
<https://github.com/jisosomppi/log-analysis/blob/master/LICENSE>

<https://github.com/terokarvinen/sirotin>
