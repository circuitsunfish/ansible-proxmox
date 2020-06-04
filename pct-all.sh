#!/bin/bash
getIDs=`getId` #load existing container and vm ids using custom tool already in place

#goal: loop over array and look for available values
function getNewID {
	#update the list each time we get a new ID
	getIDs=`getId` #load existing container and vm ids using custom tool already in place
	OIFS=$IFS #store Internal File Separator
	IFS=' '
	read -ra IDs <<< "$getIDs" #convert ids to array for easier handling
	IFS=$OIFS #restore Internal File Separator
	for i in {100..1000} 
	do
        	if [[ " ${IDs[@]} " =~ " ${i} " ]]; then
                	continue;
	        else
        	        echo $i;
	                break;
	        fi
	done
}

#get a new file server
fileID=`getNewID`
pct restore $fileID /var/lib/vz/dump/vzdump-file.tar --storage containment --hostname "newfile" --description "newfile" --unique
pct start $fileID
#sleep 30
#get a new web server
webID=`getNewID`
pct restore $webID /var/lib/vz/dump/vzdump-web.tar --storage containment --hostname "newweb" --description "newweb" --unique
pct start $webID
