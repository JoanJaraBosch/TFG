#!/bin/bash
#Author: Joan Jara
#Description: Script to download, and put the configuration files for our webapp
# in django in order to monitor the system made of odroid. This script will download
# and install all we need and will make up the node server too.
#Version: 1
#Date: 10/7/2020

#We need root permissions.
if [[ $EUID -ne 0 ]]; then
    echo "You must be root or sudo to do this."
    exit
fi

#Upgrades and instalations needed.
apt update -y
apt install python3-pip python3 gunicorn nginx python3-django gettext nload npm -y
apt install libjpeg8-dev zlib1g-dev -y
apt install vnstat -y
pip3 install --upgrade setuptools
pip3 install virtualenv wheel
pip3 install --upgrade django
pip3 install gunicorn requests pillow 

#Change permisions and config of npm for odroid user.
mkdir -p /home/odroid/.npm-global/
mkdir -p /home/odroid/.django-monitor/
npm config set prefix '/home/odroid/.npm-global'
echo "export PATH=/home/odroid/.npm-global/bin:$PATH" >> /home/odroid/.profile
source /home/odroid/.profile
chown -R odroid:odroid /home/odroid/.pm2/
chown -R odroid:odroid /home/odroid/.npm-global/
chown -R odroid:odroid /home/odroid/.django-monitor/

#Copy scripts and webapp to the default folder
cp -rp odroid/ /home/odroid/.django-monitor/
cp -rp servidor.js /home/odroid/.django-monitor/ 
cp -rp monitoring.sh /home/odroid/.django-monitor/
cp -rp json-server.sh /home/odroid/.django-monitor/

#We made a variable to know where we are.
descarregues=$(pwd)

#Make migrations.
python3 /home/odroid/.django-monitor/odroid/manage.py makemigrations
python3 /home/odroid/.django-monitor/odroid/manage.py migrate

#Obtain static files. 
python3 /home/odroid/.django-monitor/odroid/manage.py collectstatic --noinput

#If this file/link already exist because of previous test, 
#we gonna delete it. If not we gonna create the hard link.
if [ -f /home/odroid/.django-monitor/odroid/ips ]; then
	rm /home/odroid/.django-monitor/odroid/ips
fi

ln -s /etc/dnsmasq.d/dnsmasq_hosts.conf /home/odroid/.django-monitor/odroid/ips


#Copy files to their directori to make the deamons.
cp -p $descarregues/gunicorn.service /etc/systemd/system/gunicorn.service
cp -p $descarregues/odroid_site_ssl /etc/nginx/sites-available/odroid_site
rm -r /etc/nginx/sites-available/default 
rm -r /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/odroid_site /etc/nginx/sites-enabled

#We generate the keys and certificate to make our webapp lan more secure.
IP=$(hostname -I | awk '{print $1}')
$descarregues/gen-cer.sh $IP

#We reload, enable and start the deamons
systemctl daemon-reload
systemctl start gunicorn
systemctl enable gunicorn
systemctl enable nginx
systemctl start nginx 
#We make the node server up like a deamon.
chown odroid:odroid /home/odroid/.pm2/rpc.sock /home/odroid/.pm2/pub.sock
env PATH=$PATH:/usr/bin /home/odroid/.npm-global/lib/node_modules/pm2/bin/pm2 startup systemd -u odroid --hp /home/odroid

#Finally the instalation is completed.
echo "-------------------EXECUTE AS ODROID USER THE FILE PM2.SH------------------------------"

#Installing npm modules for my project
cd /home/odroid/.django-monitor
npm install os 
npm install websocket 
npm install child_process 
npm install http 
npm install pm2 

export NODE_PATH=/home/odroid/.django-monitor/node_modules

su odroid -c "bash pm2.sh"
