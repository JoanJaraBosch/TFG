# TFG
This repository is for testing and uploading our final bachelor's project.

### Fer despres de fer el gitclone
```
  sudo apt-get install unrar
  unrar x odroid.rar
  pip3 install --upgrade django
```
Un cop fet lo anterior, ara hem de modificar el fitxer settings.py que estara dintre de la carpeta odroid/odroid. Haurem de
posar a allowed_host la nostra ip i la ip 0.0.0.0. U cop fet aixo, dintre de la carpeta odroid/, podrem executar la següent 
comanda:
`python3 manage.py runserver 0.0.0.0:8000`


Serveix per poder veure de manera local la pagina web i d'aquesta manera poder monitoritzar desde qualsevol ordinador local, 
les plaques odroid.
