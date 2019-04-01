# Checks if Debian based if yes it adds PPA:s
{% if "Debian" == grains ["os_family"] %}
/usr/lib/firefox/defaults/pref/local-settings.js:
  file.managed:
    - source: salt://basic/syspref.js

nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client


keepass-ppa:
  pkgrepo.managed:
    - ppa: phoerious/keepassxc

## Checks if os is something else than 18.10 based as stacer ppa does not support it
  {% if "18.10" != grains ["osrelease"] %}
   stacer-ppa:
     pkgrepo.managed:
       - ppa: oguzhaninan/stacer
  {% else %}
  {% endif %}

signal-desktop:
  pkgrepo.managed:
    - humanname: Signal-desktop PPA
    - name: deb  https://updates.signal.org/desktop/apt xenial main
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
{% if "18.10" != grains ["osrelease"] %}
     - stacer
{% else %}
{% endif %}
