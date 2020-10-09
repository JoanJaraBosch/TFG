#!/bin/bash
#Author: Joan Jara Bosch
#Descritption: Script to start the node server automatically even after reboot.
#Version: 1
#Date: 14/9/2020

pm2 start /home/odroid/.django-monitor/servidor.js
pm2 startup
pm2 save
echo "-------------------INSTALATION FINISHED ENJOY-------------------"
