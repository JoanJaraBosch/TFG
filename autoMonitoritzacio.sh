#!/bin/bash

#Author: Joan Jara
#Description: Aquest script te el proposit d'instal·lar els requisits minims
# per a executar la web en django al master per tal de ferho automaticament
# i veureu gracies al servidor nginx.


#Mirem si som root o sudo sino no executem
if [[ $EUID -ne 0 ]]; then
    echo "You must be root or sudo to do this."
    exit
fi
#Instal·lació dels paquets necessaris
apt update -y
#sudo apt upgrade -y
apt install python3-pip python3 nginx python3-django gettext nload npm -y
#Instalarem el virtualenv per a poguer tindre un entorn virtual
#i no molestar els altres projectes que puguem tindre en un futurgettext
pip3 install --upgrade setuptools
pip3 install virtualenv wheel
pip3 install --upgrade django
pip3 install gunicorn
descarregues=$(pwd)
#Fem les migracions pertinents
cd $descarregues/odroid
python3 manage.py makemigrations
python3 manage.py migrate

#Agafem els fitxers statics
python3 manage.py collectstatic --noinput
ln /etc/dnsmasq.d/dnsmasq_hosts.conf $descarregues/odroid/ips
#Copiem els arxius pertinents i reiniciem els dimonis
cp -p $descarregues/gunicorn.service /etc/systemd/system/gunicorn.service
systemctl daemon-reload
systemctl start gunicorn
systemctl enable gunicorn

rm -r /etc/nginx/sites-available/default 
rm -r /etc/nginx/sites-enabled/default
#Copiem els arxius pertinents i reiniciem
IP=$(hostname -I | awk '{print $1}')
./gen-cer.sh $IP
 
cp -p $descarregues/odroid_site_ssl /etc/nginx/sites-available/odroid_site
ln -s /etc/nginx/sites-available/odroid_site /etc/nginx/sites-enabled
systemctl restart nginx

pip3 install gunicorn
npm install os -g
npm install websocket -g
npm install child_process -g
npm install http -g


cp servidor_node.service /etc/systemd/system/

systemctl enable servidor_node.service
systemctl start servidor_node.service

wget https://apt.izzysoft.de/izzysoft.asc
apt-key add izzysoft.asc
echo "deb [arch=all] https://apt.izzysoft.de/ubuntu generic universe" | sudo tee -a /etc/apt/sources.list
apt update -y
apt-get install monitorix -y
systemctl enable monitorix
systemctl start monitorix

echo "Instal·lació completada, si obre un navegador, hauria de poguer veure anant a 0.0.0.0:8000 la nostra pagina web en django per monitoritzar les plaques odroid"
