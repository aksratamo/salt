{% if "Windows" == grains ["os"] %}
{%	set hellofile = "C:\helloworld.txt" %}
{% else %}
{%	set hellofile = "/tmp/helloworld.txt" %} 
{% endif %}

{{ hellofile }}:
  file.managed:
    - source: salt://helloworld/helloworld.txt

