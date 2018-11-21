linux_apps:
  pkg.installed:
    - pkgs:
      - htop
      - tree
      - neofetch
      - keepassxc
      - firefox


/etc/firefox/syspref.js:
   file.managed:
    - source: salt://linux_apps/syspref.js
