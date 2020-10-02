#!/bin/bash

if [ "$1" == "master" ]; then
	json=$(./json-server.sh ) 
else
	json=$(ssh -o StrictHostKeyChecking=no $1 "/home/odroid/.django-monitor/json-server.sh")
fi

echo $json
