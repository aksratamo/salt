{% if "Arch" == grains ["os_family"] %}
{% else %}
lutris-ppa:
  pkgrepo.managed:
    - ppa: lutris-team/lutris
{% endif %}

gaming:
  pkg.installed:
    - refresh: True
    - pkgs:
      - lutris
