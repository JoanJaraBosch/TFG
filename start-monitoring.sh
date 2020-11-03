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
update="python3-pip python3 gunicorn nginx python3-django gettext nload npm sysstat libjpeg8-dev zlib1g-dev"
for package in $update; do
	if [ $(dpkg-query -W -f='${Status}' $package 2>/dev/null | grep -c "ok installed") -eq 0 ]; then   apt-get install $package -y; fi
done

pip3 install --upgrade setuptools
pip3 install --upgrade django
install="virtualenv wheel gunicorn requests pillow django-modeltranslation"
for package in $install;do
	if [ $(pip3 list --format=columns | grep -c $package) -eq 0 ];then pip3 install $package; fi
done
#Change permisions and config of npm for odroid user.
mkdir -p /home/odroid/.npm-global/
mkdir -p /home/odroid/.django-monitor/
mkdir -p /home/odroid/.pm2/
su odroid -c "npm config set prefix '/home/odroid/.npm-global'"

chmod 744 monitor
cp -p monitor /etc/default/

if [ $(grep "source /etc/default/monitor" /etc/profile | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /etc/profile
fi

if [ $(grep "source /etc/default/monitor" /etc/bash.bashrc | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /etc/bash.bashrc
fi

if [ $(grep "source /etc/default/monitor" /root/.profile | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /root/.profile
fi

if [ $(grep "source /etc/default/monitor" /root/.bashrc | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /root/.bashrc
fi

if [ $(grep "source /etc/default/monitor" /home/odroid/.profile | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /home/odroid/.profile
fi

if [ $(grep "source /etc/default/monitor" /home/odroid/.bashrc | wc -l) -eq 0 ]; then
	echo "source /etc/default/monitor" >> /home/odroid/.bashrc
fi

chown -R odroid:odroid /home/odroid/.pm2/
chown -R odroid:odroid /home/odroid/.npm-global/
chown -R odroid:odroid /home/odroid/.django-monitor/

#Copy scripts and webapp to the default folder
cp -rp odroid/ /home/odroid/.django-monitor/
cp -p servidor.js /home/odroid/.django-monitor/ 
cp -p monitoring.sh /home/odroid/.django-monitor/
cp -p maintenance.sh /home/odroid/.django-monitor/
cp -p json-server.sh /home/odroid/.django-monitor/
cp -p pm2.sh /home/odroid/.django-monitor/
#We made a variable to know where we are.
descarregues=$(pwd)

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
su odroid -c "./pm2.sh"

#Finally the instalation is completed.
env PATH=$PATH:/usr/bin /home/odroid/.npm-global/lib/node_modules/pm2/bin/pm2 startup systemd -u odroid --hp /home/odroid


echo "-------------------INSTALATION FINISHED ENJOY-------------------"

#We restart the deamons because there are cases were the instalation needs a second restart
systemctl restart nginx
systemctl restart gunicorn

systemctl restart sshd
