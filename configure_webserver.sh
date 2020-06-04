#!/bin/bash

set -e

name=$1
orgname=$2

vmid=$(pct list | grep $name | cut -f 1 -d ' ')
echo "VMID is $vmid"

url=$(pct exec $vmid -- bash -c 'url=$(hostname -I | awk "{print $1}") && echo $url')

pct exec $vmid -- bash -c 'cd /var/www/html && wp option update home "http://'$url'"'
pct exec $vmid -- bash -c 'cd /var/www/html && wp option update siteurl "http://'$url'"'
pct exec $vmid -- bash -c 'cd /var/www/html && wp option update blogname '$orgname
