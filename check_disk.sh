#!/bin/bash

backup_date=$(date +'%m/%d/%Y %H:%M:%S')
df -H | awk '{print $5 " " $1}' | while read output;
do
#echo "Disk Detail= $output"
usage=$(echo $output | awk '{print $1}'| cut -d'%' -f1)
file_sys=$(echo $output | awk '{print $2}')
#echo $usage
 if [ $usage -ge 20 ]
 then 
	 echo "CRITICAL for $file_sys on $backup_date"
fi
done

