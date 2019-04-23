# Checks if Debian based if yes it adds PPA:s
{% if "Debian" == grains ["os_family"] %}

nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client


keepass-ppa:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc

    
Libreoffice-ppa:
  pkgrepo.managed:
    - ppa: libreoffice/ppa

Virtualbox-desktop:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib
    - file: /etc/apt/sources.list.d/virtualbox-bionic.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    
Atom:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main
    - file: /etc/apt/sources.list.d/atom.list
    - key_url: https://packagecloud.io/AtomEditor/atom/gpgkey


signal-desktop:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main
    - file: /etc/apt/sources.list.d/signal-xenial.list
    - key_url: https://updates.signal.org/desktop/apt/keys.asc
    - require_in:
      - pkg: signal-desktop
{% else %}
{% endif %}


linux-advanced:
  pkg.installed:
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
