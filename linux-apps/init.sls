linux_apps:
  pkg.installed:
    - show_changes: False
    - pkgs:
      - htop
      - tree
      - firefox
      - ufw
      - vlc

#Enable Firewall and configs
/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://linux-apps/ufw.conf
    - show_changes: False
 
/etc/ufw/user.rules:
  file.managed:
    - source: salt://linux-apps/user.rules
    - show_changes: False

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://linux-apps/user6.rules
    - show_changes: False

ufwservice:
  service.running:
    - name: ufw       
    - watch:
      - file: /etc/ufw/user6.rules
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/ufw.conf



#Firefox preferences
/etc/firefox/syspref.js:
  file.managed:
    - source: salt://linux-apps/syspref.js


#Add someonewhocares host list to hostfile
/etc/hosts:
  file.managed:
    - source: salt://hosts
    - show_changes: False
