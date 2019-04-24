{% if "Arch" == grains ["os_family"] %}
{% else %}
lutris-ppa:
  pkgrepo.managed:
    - ppa: lutris-team/lutris
{% endif %}

lutris:
  pkg.installed
