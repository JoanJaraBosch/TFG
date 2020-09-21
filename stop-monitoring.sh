#!/bin/bash

#Author: Joan Jara
#Description: Script to delete and stop and delete all the monitoring.


#We need root permissions.
if [[ $EUID -ne 0 ]]; then
    echo "You must be root or sudo to do this."
    exit
fi

#Uinstalling all we installed.
apt remove python3-pip python3 nginx python3-django gettext nload npm -y
pip3 uninstall --yes virtualenv wheel
pip3 uninstall --yes gunicorn 
npm uninstall os -g
npm uninstall websocket -g
npm uninstall child_process -g
npm uninstall http -g
npm uninstall pm2 -g

#Deleteing the files and documents created.
rm -r /home/odroid/.npm-global
rm -r /home/odroid/.django-monitor
rm -r /etc/nginx/ssl/

#Stoping monitorix deamon and uninstalling it.
systemctl disable monitorix
systemctl stop monitorix
apt-get remove monitorix -y

descarregues=$(pwd)

#Stoping deamons and uninstalling it.
systemctl disable gunicorn
systemctl stop gunicorn
systemctl disable nginx
systemctl stop nginx
systemctl remove nginx
apt autoremove nginx -y
rm -r /etc/systemd/system/gunicorn.service
rm -r /etc/nginx/sites-available/* 
rm -r /etc/nginx/sites-enabled/*

#Stoping node server
env PATH=$PATH:/usr/bin /home/odroid/.npm-global/lib/node_modules/pm2/bin/pm2 unstartup systemd -u odroid --hp /home/odroid

#Finally the instalation is completed.
echo "-------------------ALL UNINSTALLED------------------------------"


reboot
