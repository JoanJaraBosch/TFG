#!/bin/bash
#Author: Joan Jara Bosch
#Descritption: Script to start the node server automatically even after reboot.
#Version: 1
#Date: 14/9/2020


#Installing npm modules for my project
cd /home/odroid/.django-monitor
npm install os
npm install websocket
npm install child_process
npm install http
npm install pm2

export NODE_PATH=/home/odroid/.django-monitor/node_modules/

pm2 start /home/odroid/.django-monitor/servidor.js
pm2 startup
pm2 save
echo "-------------------INSTALATION FINISHED ENJOY-------------------"
