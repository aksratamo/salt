{% import_yaml "/srv/salt/usercmd/user.sls" as username %}



echo 'exec fish' >>  /home/{{ username }}/usertest:
  cmd.run:
  - runas: {{ username }}
    

#Start fish by default
#echo 'exec fish' >>  /home/{{ username }}/.bashrc:
#  cmd.run:
#    - unless: grep -qxF 'exec fish' /home/{{ username }}/.bashrc
#    - runas: {{ username }}
  


#Install Oh My Fish
#curl -L https://get.oh-my.fish | fish:
#  cmd.run:
#    - unless: grep -qxF 'The MIT License (MIT)' /home/{{ username }}/.local/share/omf/LICENSE 
#    - runas: {{ username }}


#Install Oh My Fish theme Agnoster
#omf install agnoster:
#  cmd.run:
#    - unless: grep -qxF 'The MIT License (MIT)'/home/{{ username }}/.local/share/omf/themes/agnoster/
#    - runas: {{ username }}









