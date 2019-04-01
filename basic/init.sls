linux_apps:
  pkg.installed:
    - pkgs:
      - htop
      - tree
      - firefox
      - ufw
      - vlc
      - gufw




#Firefox preferences
{% if "Arch" == grains ["os_family"] %}
/usr/lib/firefox/defaults/pref/local-settings.js:
  file.managed:
    - source: salt://basic/syspref.js

{% else %}
/etc/firefox/syspref.js:
  file.managed:
    - source: salt://basic/syspref.js
{% endif %}



#Add someonewhocares host list to hostfile
/etc/hosts:
  file.managed:
    - source: salt://basic/hosts
    - show_changes: False
