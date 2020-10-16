#!/bin/bash

cd /home/odroid/.django-monitor

npm install os -g
npm install utf-8-validate -g
npm install bufferutil -g
npm install websocket -g
npm install child_process -g
npm install http -g
npm install pm2 -g

#We make the node server up like a deamon.
chown -R odroid:odroid /home/odroid/.django-monitor/*
chown -R odroid:odroid /home/odroid/.npm-global/*
runuser -l odroid -c 'pm2 list'
chown -R odroid:odroid /home/odroid/.pm2/*
runuser -l odroid -c 'rm -rf ~/.pm2'
runuser -l odroid -c 'pm2 start /home/odroid/.django-monitor/servidor.js'
runuser -l odroid -c 'pm2 startup'
env PATH=$PATH:/usr/bin /home/odroid/.npm-global/lib/node_modules/pm2/bin/pm2 startup systemd -u odroid --hp /home/odroid


echo "-------------------INSTALATION FINISHED ENJOY-------------------"

#We restart the deamons because there are cases were the instalation needs a second restart
systemctl restart nginx
systemctl restart gunicorn
