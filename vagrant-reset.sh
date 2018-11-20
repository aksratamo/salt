#!/bin/bash
# this will destroy and put up vagrand again and ssh it straght back for fast salt testing.
# run this in your vagrant master in the same folder as Vagrantfile
echo "Vagrant destroy"
vagrant destroy 
echo "Vagrant up"
vagrant up 
echo "Vagrant ssh"
vagrant ssh 
