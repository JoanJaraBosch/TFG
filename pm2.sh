#!/bin/bash
#Author: Joan Jara Bosch
#Descritption: Script to start the node server automatically even after reboot.
#Version: 1
#Date: 14/9/2020


#Installing npm modules for my project
cd /home/odroid/.django-monitor
update="utf-8-validate bufferutil pm2 os websocket http child_process"
for package in $update; do
	if [ $(npm list -g | grep -c $package) -eq 0 ]; then   npm install -g $package; fi
done

pm2 start /home/odroid/.django-monitor/servidor.js
pm2 startup
echo "-------------------INSTALATION FINISHED ENJOY-------------------"

mkdir -p ~/.ssh/sockets
echo -e "Host *\n\tControlMaster auto\n\tControlPath  ~/.ssh/sockets/%r@%h-%p\n\tControlPersist 2000" > ~/.ssh/config
