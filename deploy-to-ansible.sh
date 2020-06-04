#!/bin/bash
# send to ansible command/control
#ashton mackenzie
#
#ansible="192.168.1.8"
#
target=/home/deployer/ansible/all/
sphene=192.168.1.1
ansible=192.168.1.8

echo "Copying playbook files"
scp vars.yml deployer@$ansible:$target
scp proxmox.yml deployer@$ansible:$target

echo "Copying shell scripts"
scp configure_fileserver.sh deployer@$ansible:$target
scp configure_webserver.sh deployer@$ansible:$target
scp configure_dataserver.sh deployer@$ansible:$target