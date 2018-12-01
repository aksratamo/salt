linux_apps:
  pkg.installed:
    - pkgs:
      - htop
      - tree
      - firefox
      - ufw


#Enable Firewall and configs
/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://linux-apps/ufw.conf
 
/etc/ufw/user.rules:
  file.managed:
    - source: salt://linux-apps/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://linux-apps/user6.rules

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

