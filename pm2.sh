#!/bin/bash

pm2 start /home/odroid/.django-monitor/servidor.js
pm2 startup
pm2 save
echo "-------------------INSTALATION FINISHED ENJOY-------------------"
