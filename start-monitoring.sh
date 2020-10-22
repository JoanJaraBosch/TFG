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
apt install python3-pip python3 gunicorn nginx python3-django gettext nload npm sysstat -y
apt install libjpeg8-dev zlib1g-dev -y
pip3 install --upgrade setuptools
pip3 install virtualenv wheel
pip3 install --upgrade django
pip3 install gunicorn requests pillow 
pip3 install django-modeltranslation
#Change permisions and config of npm for odroid user.
mkdir -p /home/odroid/.npm-global/
mkdir -p /home/odroid/.django-monitor/
mkdir -p /home/odroid/.pm2/
npm config set prefix '/home/odroid/.npm-global'
runuser -l odroid -c "echo "export NODE_PATH=/home/odroid/.django-monitor/node_modules" >> /home/odroid/.profile"
runuser -l odroid -c "echo "export PATH=/home/odroid/.npm-global/bin:\$PATH" >> /home/odroid/.profile"
runuser -l odroid -c "source /home/odroid/.profile"

chown -R odroid:odroid /home/odroid/.pm2/
chown -R odroid:odroid /home/odroid/.npm-global/
chown -R odroid:odroid /home/odroid/.django-monitor/

#Copy scripts and webapp to the default folder
cp -rp odroid/ /home/odroid/.django-monitor/
cp -rp servidor.js /home/odroid/.django-monitor/ 
cp -rp monitoring.sh /home/odroid/.django-monitor/
cp -rp maintenance.sh /home/odroid/.django-monitor/
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

#Installing node 
runuser -l odroid -c "./pm2.sh"

#Finally the instalation is completed.
env PATH=$PATH:/usr/bin /home/odroid/.npm-global/lib/node_modules/pm2/bin/pm2 startup systemd -u odroid --hp /home/odroid


echo "-------------------INSTALATION FINISHED ENJOY-------------------"

#We restart the deamons because there are cases were the instalation needs a second restart
systemctl restart nginx
systemctl restart gunicorn
