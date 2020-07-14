#!/bin/bash

#Author: Joan Jara
#Description: Aquest script te el proposit d'instal·lar els requisits minims
# per a executar la web en django al master per tal de ferho automaticament
# i veureu gracies al servidor nginx.

#Instal·lació dels paquets necessaris
sudo apt update
sudo apt install python3-pip python3 gunicorn nginx
#Instalarem el virtualenv per a poguer tindre un entorn virtual 
#i no molestar els altres projectes que puguem tindre en un futur
sudo pip3 install virtualenv

descarregues=$(pwd)
#crearem la carpeta al directori home del usuari odroid
mkdir ~/aux
cd ~/aux
#creem el nosytre entorn virtual
virtualenv odroidenv
#I l'activem
source odroidenv/bin/activate

#Al arxiu RAR, tenim un fitxer anomenat requirements, on tenim tots els 
#requeriments per al nostre porejecte i que amb la següent comanda, 
#s'insta·laran
pip3 install -r $descarregues/requirements.txt

# Ara el q farem sera copiar el nostre entorn virtual al nostre projecte 
#descomprimi
sudo cp -r ~/aux/odroidenv $descarregues/odroid/
sudo rm -r ~/aux

#Fem les migracions pertinents
cd $descarregues/odroid
python3 manage.py makemigrations
python3 manage.py migrate

#Agafem els fitxers statics
python3 manage.py collectstatic

#Copiem els arxius pertinents i reiniciem els dimonis
sudo cp -p $descarregues/gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

#Copiem els arxius pertinents i reiniciem
sudo cp -p $descarregues/odroid_site /etc/nginx/sites-available/odroid_site
sudo ln -s /etc/nginx/sites-available/odroid_site /etc/nginx/sites-enabled
sudo systemctl restart nginx

echo "Instal·lació completada, si obre un navegador, hauria de poguer veure anant a 0.0.0.0:8000 la nostra pagina web en django per monitoritzar les plaques odroid"
