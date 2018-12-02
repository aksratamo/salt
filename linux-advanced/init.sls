nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client


linux-advanced:
  pkg.installed:
    - pkgs:
      - neofetch
      - keepassxc
      - httpie
      - nextcloud-client
      - qbittorrent
      
