#!/bin/bash

#Author: Joan Jara
#Description: Script to download, and put the configuration files for our webapp
# in django in order to monitor the system made of odroid. This script will download
# and install all we need and will make up the node server too.


#We need root permissions.
if [[ $EUID -ne 0 ]]; then
    echo "You must be root or sudo to do this."
    exit
fi

#Upgrades and instalations needed.
apt update -y
apt install python3-pip python3 nginx python3-django gettext nload npm -y
pip3 install --upgrade setuptools
pip3 install virtualenv wheel
pip3 install --upgrade django
pip3 install gunicorn
npm install os -g
npm install websocket -g
npm install child_process -g
npm install http -g
npm install pm2 -g

#Change permisions and config of npm for odroid user.
mkdir /home/odroid/.npm-global
npm config set prefix '/home/odroid/.npm-global'
echo "export PATH=/home/odroid/.npm-global/bin:$PATH" >> /home/odroid/.profile
source /home/odroid/.profile
chown -R odroid /home/odroid/.pm2/
chown -R odroid /home/odroid/.npm-global/

#Monitorix instalation and getting keys. Test, monitorix is another way 
#to monitor our systems.
if [ -f $descarregues/izzysoft.asc ]; then
	rm $descarregues/izzysoft.asc
else
	wget https://apt.izzysoft.de/izzysoft.asc
	apt-key add izzysoft.asc
	echo "deb [arch=all] https://apt.izzysoft.de/ubuntu generic universe" | sudo tee -a /etc/apt/sources.list
fi
apt update -y
apt-get install monitorix -y
systemctl enable monitorix
systemctl start monitorix

#We made a variable to know where we are.
descarregues=$(pwd)

#Make migrations.
python3 $descarregues/odroid/manage.py makemigrations
python3 $descarregues/odroid/manage.py migrate

#Obtain static files. 
python3 $descarregues/odroid/manage.py collectstatic --noinput

#If this file/link already exist because of previous test, 
#we gonna delete it. If not we gonna create the hard link.
if [ -f $descarregues/odroid/ips ]; then
	rm $descarregues/odroid/ips
else
	ln /etc/dnsmasq.d/dnsmasq_hosts.conf $descarregues/odroid/ips
fi

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
systemctl restart nginx 
#We make the node server up like a deamon.
chown odroid:odroid /home/odroid/.pm2/rpc.sock /home/odroid/.pm2/pub.sock
env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u odroid --hp /home/odroid

#Finally the instalation is completed.
echo "-------------------EXECUTE AS ODROID USER THE FILE PM2.SH------------------------------"
