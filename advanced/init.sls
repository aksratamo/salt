nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client

atom-ppa:
  pkgrepo.managed:
    - ppa: webupd8team/atom   

keepass-ppa:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc


stacer-ppa:
  pkgrepo.managed:
    - ppa: oguzhaninan/stacer

signal-desktop:
  pkgrepo.managed:
    - humanname: Signal-desktop PPA
    - name: deb  https://updates.signal.org/desktop/apt xenial main
    - file: /etc/apt/sources.list.d/signal-xenial.list
    - key_url: salt://linux-advanced/keys.asc

linux-advanced:
  pkg.installed:
    - pkgs:
      - atom
      - neofetch
      - keepassxc
      - httpie
      - nextcloud-client
      - qbittorrent
      - signal-desktop
      - stacer
      - vim
      - fish
      - tmux
