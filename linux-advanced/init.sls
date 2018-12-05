nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client

keepass-ppa:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc

signal-desktop:
  pkgrepo.managed:
    - humanname: Signal-desktop PPA
    - name: deb  https://updates.signal.org/desktop/apt xenial main
    - file: /etc/apt/sources.list.d/signal-xenial.list
    - key_url: salt://linux-advanced/keys.asc

linux-advanced:
  pkg.installed:
    - pkgs:
      - neofetch
      - keepassxc
      - httpie
      - nextcloud-client
      - qbittorrent
      - signal-desktop
