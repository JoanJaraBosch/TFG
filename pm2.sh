#!/bin/bash

pm2 start /home/odroid/.django-monitor/servidor.js
pm2 startup
echo "-------------------INSTALATION FINISHED ENJOY-------------------"
