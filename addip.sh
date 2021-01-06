#!/bin/bash
#This script adds an IP address to the trusted ones on the webserver
#This scripts can be run inside the webserver but it requires server restart to take effect.
#This script requires to have installed jq, this can be done doing sudo apt-install jq or sudo sudo yum install jq.
#To add an ip you have to pass the ip as a parameter when executing the script

#Files location conf.json and backups ↓↓↓↓
conffile="/scriptserver/conf/conf.json"
confdir="/scriptserver/conf/bak"

#Date for the backup save
NOW=$(date +%m-%d-%y)

#Create a backup of the conf.json ↓↓↓↓
cat $conffile>$confdir/conf_$NOW.bak

#Add the ip address ↓↓↓↓
var=$(jq --arg ip "$1" '.access.trusted_ips [.access.trusted_ips| length] += $ip' $conffile)

#Output redirection to the file location ↓↓↓↓
echo "$var">$conffile

#Show the list of ips
echo Here is the ip list with your ip added to it.
jq '.access.trusted_ips' $conffile
