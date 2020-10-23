#!/bin/bash
#Author: Joan Jara Bosch
#Description: In this script we use the json-server script in order to achieve the information for the graphics. We opted to do it in this way because the json script is in a local place where
#	      can be accessed for every odroid. So we only need to execute the json script with ssh or without. 
#Version: 2
#Date: 1/8/2020

if [ "$1" == "master" ]; then
	json=$(./json-server.sh ) 
else
	json=$(ssh -o StrictHostKeyChecking=no $1 "/home/odroid/.django-monitor/json-server.sh")
fi

sleep $2
echo $json
