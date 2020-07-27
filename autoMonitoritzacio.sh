#!/bin/bash

#Author: Joan Jara
#Description: Aquest script te el proposit d'instal·lar els requisits minims
# per a executar la web en django al master per tal de ferho automaticament
# i veureu gracies al servidor nginx.

#Instal·lació dels paquets necessaris
sudo apt update -y
#sudo apt upgrade -y
sudo apt install python3-pip python3 nginx python3-django gettext -y
#Instalarem el virtualenv per a poguer tindre un entorn virtual
#i no molestar els altres projectes que puguem tindre en un futurgettext
sudo pip3 install --upgrade setuptools
sudo pip3 install virtualenv wheel
sudo pip3 install --upgrade django
sudo pip3 install gunicorn
descarregues=$(pwd)
#Fem les migracions pertinents
cd $descarregues/odroid
python3 manage.py makemigrations
python3 manage.py migrate

#Agafem els fitxers statics
python3 manage.py collectstatic --noinput

#Copiem els arxius pertinents i reiniciem els dimonis
sudo cp -p $descarregues/gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

sudo rm -r /etc/nginx/sites-available/default 
sudo rm -r /etc/nginx/sites-enabled/default
#Copiem els arxius pertinents i reiniciem
sudo cp -p $descarregues/odroid_site /etc/nginx/sites-available/odroid_site
sudo ln -s /etc/nginx/sites-available/odroid_site /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo pip3 install gunicorn
echo "Instal·lació completada, si obre un navegador, hauria de poguer veure anant a 0.0.0.0:8000 la nostra pagina web en django per monitoritzar les plaques odroid"
