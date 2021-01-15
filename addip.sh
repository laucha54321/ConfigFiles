#!/bin/bash
#This script adds an IP address to the trusted ones on the webserver.
#This scripts can be run inside the webserver but it requires server restart to take effect.
#This script requires to have installed jq, this can be done doing sudo apt-install jq or sudo sudo yum install jq.
#To add an ip you have to pass the ip as a parameter when executing the script.

#Files location conf.json and backups ↓↓↓↓
conffile="/work/scriptserver/conf/conf.json"
confdir="/work/scriptserver/conf/bak"

#This function outputs the list of IPs that are allowed to enter the Script Server Web App ↓↓↓↓
ShowList(){
        jq '.access.trusted_ips' $conffile
}

#Output redirection to the file location ↓↓↓↓
UpdateList(){
        echo "$var">$conffile
}

#Date for the backup save ↓↓↓↓
NOW=$(date +%m-%d-%y)

#Create a backup of the conf.json ↓↓↓↓
cat $conffile>$confdir/conf_$NOW.bak

#Add the ip address ↓↓↓↓
if [ -z $1 ]
	then
		echo "This is the list of IP addresses that are allowed in the server."
		ShowList
	else
		var=$(jq --arg ip "$1" '.access.trusted_ips [.access.trusted_ips| length] += $ip' $conffile)
		UpdateList $var
		echo "This is the updated list with the new IP address added to it."
		ShowList
fi

