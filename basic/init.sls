linux_apps:
  pkg.installed:
    - show_changes: False
    - pkgs:
      - htop
      - tree
      - firefox
      - ufw
      - vlc
      - gufw

#Enable Firewall and configs
/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://basic/ufw.conf
    - show_changes: False
 
/etc/ufw/user.rules:
  file.managed:
    - source: salt://basic/user.rules
    - show_changes: False

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://basic/user6.rules
    - show_changes: False

ufwservice:
  service.running:
    - name: ufw       
    - watch:
      - file: /etc/ufw/user6.rules
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/ufw.conf


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
