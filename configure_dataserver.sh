#!/bin/bash

set -e

name=$1
orgname=$2

vmid=$(pct list | grep $name | cut -f 1 -d ' ')
echo "VMID is $vmid"

pct push $vmid /var/ansible/jokeemr.sql /tmp/jokeemr.sql
pct exec $vmid -- bash -c 'mysql < /tmp/jokeemr.sql'
