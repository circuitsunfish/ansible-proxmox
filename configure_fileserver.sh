#!/bin/bash

set -e

name=$1
orgname=$2

vmid=$(pct list | grep $name | cut -f 1 -d ' ')
echo "VMID is $vmid"

pct exec $vmid -- bash -c 'sed -i "s/replace/"'$orgname-$name'"/g" /etc/samba/smb.conf'
pct exec $vmid -- bash -c "systemctl restart smb"
