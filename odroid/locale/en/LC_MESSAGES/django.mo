��    <      �  S   �      (  I  )  �  s  �  ,
  e   �  �   [     7     S  H   b     �  5   �     �     �       *        E     Q  -   h  "   �  7   �     �     �  
     >        O     _     o          �  	   �     �     �     �     �     �     �     �       %        ;     R  &   c     �     �     �  
   �     �     �     �     �     �               !  [   2  l   �  |   �  "   x     �     �  B  �    �  x  �  �  x  4     �   :     �        E     
   U  <   `     �     �  	   �  *   �     �     �  #        4     H  	   f     p     u  +   ~     �     �     �     �     �  	   �     �                 
        '     B  	   S  %   ]     �     �  &   �     �     �     �     �     �                 +      4      D      K      T   E   h   f   �   m   !     �!     �!     �!     !      ;                   5   0   8         #   +   
   (                  <      7                        2       %                 ,           :                                *   -   1       	         )      6   9                &   $       '       .   "   3                     4            /    
Aquest manual té el propòsit de permetre a l'usuari instal·lar de manera
automatitzada un sistema de cues anomenat Slurm el qual permetrà que es
pugui paral·lelitzar de manera adequada i eficient.
A més a més, també automatitzarà la instal·lació de l'aplicació web per tal de
monitorar i mantenir el nostre sistema.
 
Per a poder veure la plana web, només cal que aneu a un navegador d’un
ordinador que estigui a la mateixa LAN que la placa màster i posseu
https://ipOdroid.
On ipOdroid serà la ip de la LAN Odroid. Seguidament haura d’acceptar els
permisos ja que hem generat un certificat autosignat per tal d’establir una
conexió segura en el nostre servidor. Ara hauria de poder veure la aplicació
web. En cas de que estigui utilitzant Firefox, haurà d’anar també a la següent
plana web: https://ipOdroid:3000 per tal d’acceptar els certificats per el
servidor node encarregat d’enviar les dades a l’aplicació web.
Finalment, necessitarà entrar amb usuari i contrasenya odroid odroid per a
poder monitoritzar i mantenir les plaques. Per a usar la placa amb més d’un
usuari, haurà d’anar a https://ipOdroid/admin on estarà a la plana
d’administrador per a poguer crear els usuaris necessaris encarregats de
monitoritzar les plaques.
 
Primer de tot necessitaràs un lloc on posar les teves plaques Odroid de manera
que el cada cable Ethernet anirà a un port del Swicth i al port Ethernet de les
plaques. Després hauràs de connectar l'adaptador USB Etehrnet i el cable
Ethernet d'aquest USB al router. De manera opcional podràs posar el HDMI, el
ratolí i el teclat a la placa màster per tal de configurar-la amb l'ajuda d'una
pantalla. En cas de no vulgueu posar el material opcional, haureu d'anar a la
configuració del router per saber la IP de la placa màster de manera LAN i
connectar-se per SSH de la següent manera:
ssh odroid@ip
On haurà de posar de contrasenya Odroid. Ara ja està llest per passar a
l'apartat de descàrregues.
 A continuació disposa d'un enllaç per a visitar la pàgina de les plaques/ordinadors que utilitzem. A continuació, podreu veure informació sobre els professors implicats en el nostre projecte, tot i què el nostre professor principal ha estat en Carles Aliagas ja que ens ha fet de tutor del treball de fi de carrera. Adaptador de USB a Ethernet Aplicació web Ara haureu de descomprimir el fitxer master.zip amb la següent comanda: Automatització Cables Ethernet (tants com plaques + 1 per el router) Connect Continue Monitoring Contrasenya: Delay en segons per la obtenció de dades: Descripció Descàrrega del manual Descàrrega pel manteniment i monitorització Descàrrega per la automatització Descàrrega, descompressió i instal·lació d’arxius Descàrregues Equip Estudiants Fnalment, executeu el script com a sudo de la següent manera: HDMI (opcional) INPUT TERMINAL: Iniciar Sessió Instal·lació Introducció Made with Manteniment Manual Material Menú Monitorització Monitorització i manteniment Montar el sistema Nom d'usuari: Nombre de punts pels grafics lineals: OUTPUT ERROR TERMINAL: OUTPUT TERMINAL: Pantalla amb connexió HDMI (opcional) Pause Monitoring Plaques Odroid Portada Professors Ratolí (opcional) Remove Output Send Command Sobre nosaltres Stop Monitoring Swicth Tancar Sessió Tecla (opcional) Un cop descomprimit, aneu dintre el directori que heu descomprimit amb la comanda següent: Un cop dintre a la terminal de la nostra placa màster, aneu al directori Documents amb la següent comanda: Un cop dintre el directori, heu de descarregar els arxius per a la automatització. Haureu d’executar la següent comanda: Un router amb connexió a Internet by i Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 
This manual is intended to allow the user to install 
automated a queuing system called Slurm which will allow 
can parallelize efficiently and efficiently. 
In addition, it will also automate the installation of the web application in order toof 
monitor and maintain our system. 
 
To view the webpage, all you have to do is go to a browser 
computer that is on the same LAN as the master board and has 
https://ipOdroid. 
Where ipOdroid will be the ip of the Odroid LAN. You will then need to accept the 
permissions since we generated a self - signed certificate to establish a 
secure connection to our server. You should now be able to see theapplication 
web. If you're using Firefox, you'll need to go to thenext 
web page: https://ipOdroid:3000 in order to accept certificates for 
node server responsible for sending data to the web application. 
Finally, you will need to log in with your odroid username and password for 
be able to monitor and maintain the boards. To use the board with more than one 
user, must go to https://ipOdroid/admin where it will be on the page 
administrator to be able to create the necessary users in charge of 
monitor plates. 
 
First of all you'll need a place to put your Odroid boards fromway 
that each Ethernet cable will go to a Swicth port and the Ethernet port ofthe 
boards. You will then need to connect the Etehrnet USB adapter and cable 
Ethernet from this USB to the router. Optionally you can set HDMI,the 
mouse and keyboard on the master board in order to configure it with the helpfrom 
screen. If you do not want to put the optional material, you must go tothe 
configuring the router to know the IP of the master board in LAN mode and 
connect via SSH as follows: 
ssh odroid @ ip 
Where to put Odroid password. Now it's ready to go to 
the downloads section. 
 Below is a link to visit the plates/computer we use. Now you can see information about teachers who works in this project eventhough our principal teacher is Carles Aliagas because he is our mentor in our final degree project. USB to Ethernet adapter Web Aplication Now you need to unzip the master.zip file with the following command: Automation Ethernet wires (as much as odroid boards + 1 for the router) Connect Continue Monitoring Password: Delay in the obtention of data in seconds: Description Manual/guide download Monitoring and maintenance download Automation download Download and file instalation Downloads Team Students Finally, run the script as sudo as follows: HDMI (optional) INPUT TERMINAL: Sign in Instalation Introduction Made with Maintenance Manual/Guide Material Menu Monitoring Monitoring and maintenance Mount the system Username: Number of points in a lineal graphic: OUTPUT ERROR TERMINAL: OUTPUT TERMINAL: Screen with HDMI connection (optional) Pause Monitoring Odroid boards Home Teachers Mouse (optional) Remove Output Send Command About us Stop Monitoring Switch Sign out Keyboard (optional) Once unzipped, go to the directory you unzipped with thenext command: Once inside the terminal of our master plate, go to the directoryDocuments with the following command: Once inside the directory, you must download the files for theautomation. You must run the following command: Router with internet connection by and 