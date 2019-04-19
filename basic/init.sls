linux_apps:
  pkg.installed:
    - pkgs:
      - htop
      - tree
      - firefox
      - ufw

/usr/bin/upgrade:
  file.managed:
    - source: salt://basic/upgrade
    - mode: 733


      
    
# Swappiness
/etc/sysctl.d/99-sysctl.conf:
  file.managed:
    - source: salt://basic/99-sysctl.conf

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
    - source: https://someonewhocares.org/hosts/hosts
    - show_changes: False
    - skip_verify: True

ufw:
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: ufw


'sudo ufw enable':
  cmd.run
