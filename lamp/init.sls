lamp:
  pkg.installed:
   - pkgs:
     - apache2
     - libapache2-mod-php
     - libapache2-mod-php
     - mariadb-client
     - mariadb-server
     - ufw


# Apache config
/var/www/html/index.html:
  file.managed:
   - source: salt://lamp/index.html

# PHP Config
/etc/apache2/mods-available/php7.2.conf:
  file.managed:
   - source: salt://lamp/php7.2.conf
