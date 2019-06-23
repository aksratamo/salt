# Checks if Debian based if yes it adds PPA:s
{% if "Debian" == grains ["os_family"] %}
#{% set oscode = grains ["oscodename"] %}

nextcloud-client:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client

keepassXC:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc

libreoffice:
  pkgrepo.managed:
    - ppa: libreoffice/ppa

#virtualbox:
#  pkgrepo.managed:
#    - name: deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian {{ oscode }} contrib
#    - file: /etc/apt/sources.list.d/virtualbox-{{ oscode }}.list
#    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc


atom:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main
    - file: /etc/apt/sources.list.d/atom.list
    - key_url: https://packagecloud.io/AtomEditor/atom/gpgkey

signal-desktop:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main
    - file: /etc/apt/sources.list.d/signal-xenial.list
    - key_url: https://updates.signal.org/desktop/apt/keys.asc

{% else %}
{% endif %}


linux-advanced:
  pkg.installed:
    - refresh: True
    - pkgs:
      - signal-desktop
      - htop
      - keepassxc
      - httpie
      - nextcloud-client
      - qbittorrent
      - vim
      - fish
      - tmux
      - putty
      - android-tools-adb 
      - android-tools-fastboot
      - curl


#Start fish by default
echo 'exec fish' >>  ~/.bashrc:
  cmd.run:
    - unless: grep -qxF 'exec fish' ~/.bashrc  

#Set grub wait time to 0
sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub:
  cmd.run:
    - unless: grep -qxF 'GRUB_TIMEOUT=0' /etc/default/grub

#Install Oh My Fish
curl -L https://get.oh-my.fish | fish:
  cmd.run:
    - unless: grep -qxF 'The MIT License (MIT)' ~/.local/share/omf/LICENSE 


#Install Oh My Fish theme Agnoster
#omf install agnoster:
#  cmd.run:
#    - unless: grep -qxF 'The MIT License (MIT)' ~/.local/share/omf/themes/agnoster/

