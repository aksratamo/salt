# Checks if Debian based if yes it adds PPA:s
{% if "Debian" == grains ["os_family"] %}

nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client


keepass-ppa:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc


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
      - neofetch
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
