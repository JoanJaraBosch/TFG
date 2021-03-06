��    L      |  e   �      p  I  q  �  �  J  �	  �  �
    �  �  �  �  U  e     �   �  s   `     �     �  H   �     H  5   X     �     �     �     �  *   �     �     �  -     "   ?  7   b     �  �   �  �   �     #  
   )  >   4     s     �     �     �     �  	   �     �     �     �     �  
   �     �          $     6     C  %   Q     w     �  &   �     �  �   �     �     �  
   �     �     �     �  �   	     �  �   �     �     �     �     �     �  [   �  l   <  |   �  "   &      I      L   �   N   �   !  B  �!    �"  �  $  /  �%  �  �&  �  �(  x  *  �  �-  4   0  �   H0  R   �0     I1     a1  E   p1  
   �1  <   �1     �1     2     2  	   #2  +   -2     Y2     e2  #   {2     �2     �2  	   �2  �   �2  �   �3     ?4     D4  +   M4     y4     �4     �4     �4     �4  	   �4     �4     �4     �4     �4  
   �4  
   �4     �4     5     &5  	   /5  %   95     _5     v5  &   �5     �5  �   �5     �6     �6     �6     �6     �6     �6  �   �6     a7  �   j7     8     )8     08     68     ?8  E   S8  f   �8  m    9     n9     �9     �9  �   �9  �   9:        3                   )   /   &          7   +       K       J   $       I             L       H             ;   "   8      %      -          '   #                         9   5   (   	   2   4             E                 @   C   *       .       :   D         A   
             B       =      <              6         ,       0   >   !       1      ?   F           G    
Aquest manual té el propòsit de permetre a l'usuari instal·lar de manera
automatitzada un sistema de cues anomenat Slurm el qual permetrà que es
pugui paral·lelitzar de manera adequada i eficient.
A més a més, també automatitzarà la instal·lació de l'aplicació web per tal de
monitorar i mantenir el nostre sistema.
 
En aquest subapartat, pots descarregar la plana web local per al manteniment i monitoratge de les plaques Odroid. Aquesta plana et permetrà veure els estats essencials de les plaques com pot ser
l'entropia, la calor, la utilització de les CPUs i altres. A més a més, proporciona un apartat de manteniment on disposaràs de 3 petites terminals on 1 serà per l'input, i les altres pels
outputs (stdout i stderr) on podràs executar petites comandes. A continuació teniu l'enllaç de descàrrega.
 
En aquest subapartat, trobaràs l'enllaç que et permetrà descarregar els arxius d'automatització per tal de crear el sistema de cues Slurm per a la comunicació de les plaques, el tallafoc per
la seguretat, l'assignació de les adrecesses IP per a totes les plaques i molt més. A continuació teniu l'enllaç de descàrrega.
 
En aquest últim subapartat, tindreu l'oportunitat de descarregar el manual en PDF per tal de saber com executar el nostre projecte i per tal de saber com fer-lo servir. En cas de no voler
descarregar el manual, no cal que patiu, ja que en la barra de navegació de la plana local, hi ha l'apartat manual on podràs veure el manual sense tindre'l que baixar. A continuació teniu l'enllaç de
descàrrega.
 
En aquesta secció de la plana web, tens l'opció per a descarregar el nostre projecte un altre cop en cas de no recordar l'enllaç o en cas de perdre algun arxiu
necessari pel funcionament correcte de les plaques. Pots descarregar els arxius d'automatització fets pel David Ferrer i tens l'oportunitat de descarregar
la plana web local que et permet monitorar i mantenir les plaques Odroid. A més a més et donem l'enllaç de descàrrega del manual per si no vols seguir el manual de la plana web i el vols en PDF.
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
 A continuació disposa d'un enllaç per a visitar la pàgina de les plaques/ordinadors que utilitzem. A continuació, podreu veure informació sobre els professors implicats en el nostre projecte, tot i què el nostre professor principal ha estat en Carles Aliagas ja que ens ha fet de tutor del treball de fi de carrera. A més a més, nosaltres busquem i tenim l'objectiu que el nostre projecte ajudi a gent en l'àmbit de l'educació. Adaptador de USB a Ethernet Aplicació web Ara haureu de descomprimir el fitxer master.zip amb la següent comanda: Automatització Cables Ethernet (tants com plaques + 1 per el router) Connect Continue Monitoring Contrasenya Contrasenya: Delay en segons per la obtenció de dades: Descripció Descàrrega del manual Descàrrega pel manteniment i monitorització Descàrrega per la automatització Descàrrega, descompressió i instal·lació d’arxius Descàrregues En aquesta secció, pots dedicar-te a mantenir els sistemes Odroid sempre que no hi hagi problemes amb el SSH. En cas contrari hauràs de connectar un HDMI a la placa master Odroid cap a un monitor i des d'allà arreglar-ho. Entra i descobreix el nostre projecte. Un projecte per a fer paral·lelització de manera fàcil i ràpida amb l'opció de monitoratge i manteniment LAN. Equip Estudiants Fnalment, executeu el script com a sudo de la següent manera: HDMI (opcional) INPUT TERMINAL: Iniciar Sessió Instal·lació Introducció Made with Manteniment Manual Material Menú Monitoring Monitorització Monitorització i manteniment Montar el sistema Nom d'usuari Nom d'usuari: Nombre de punts pels grafics lineals: OUTPUT ERROR TERMINAL: OUTPUT TERMINAL: Pantalla amb connexió HDMI (opcional) Pause Monitoring Per a usar la terminal primer tens de connectar-te a través del botó connectar. A partir d'aquí, només podràs utilitzar comandes que no redirigeixin l'output cap a fitxer. És a dir, no podràs fer un echo 'hola' > file. Plaques Odroid Portada Professors Ratolí (opcional) Remove Output Send Command Si no saps de què es tracta la paral·lelització, no et preocupis perquè nosaltres t'ho expliquem. La paral·lelització tracta de repartir la feina entre una mateixa màquina Sobre nosaltres Som un grup format per dos estudiants de la Universitat Rovira i Virgili, actualment cursant l'últim any de la carrera d'Enginyeria Informàtica. A continuació veureu informació sobre nosaltres, els estudiants. Stop Monitoring Swicth Tancar Tancar Sessió Tecla (opcional) Un cop descomprimit, aneu dintre el directori que heu descomprimit amb la comanda següent: Un cop dintre a la terminal de la nostra placa màster, aneu al directori Documents amb la següent comanda: Un cop dintre el directori, heu de descarregar els arxius per a la automatització. Haureu d’executar la següent comanda: Un router amb connexió a Internet by i i els seus cores o entre diverses màquines. El nostre projecte tracta la paral·lelització entre diverses màquines i de manera fàcil, ja que només necessitaràs plaques Odroid, un  switch i el teu router. Pots saber d'ordinadors o no, ja que nosaltres estarem a la seva disposició i també li oferirem un manual per tal que la instal·lació sigui fàcil. Project-Id-Version: PACKAGE VERSION
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
In this subsection, you can download the local maintenance websiteand monitoring Odroid boards. This page will allow you to see theessential states of the plates as it can be 
entropy, heat, CPU usage and others. Plus,provides a maintenance section where you will have 3 small terminalswhere 1 will be for input, and the others for 
outputs (stdout and stderr) where you can run small commands. Thenyou have the download link. 
 
In this subsection, you will find the link that will allow you to download themautomation files for creating the Slurm queuing system for thecommunication of the boards, the firewall for 
the security status, the ips allocation for all boards and much more. InContinuation you have the download link. 
 
In this last subsection, you will have the opportunity to download the manualin pdf in order to know how to execute our project and in order to knowhow to use it. If you don't want to 
download the manual, you don't have to suffer because in the navigation barthe local page, there is the manual section where you can see the manual withouthave to download it. Below is the link to 
download. 
 
In this section, you can download our project again if you forgot the link or you lost any file 
needed for the correct use of our system. You can download the files of the automation made by David Ferrer and you can download the App Web that let you monitor 
and keep the odroid system. In addition, we give you the link to download the guide or the guide itself in the section Manual/Guide. 
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
 Below is a link to visit the plates/computer we use. Now you can see information about teachers who works in this project eventhough our principal teacher is Carles Aliagas because he is our mentor in our final degree project. In addition, we seek and aim for our projecthelp people in the field of education. USB to Ethernet adapter Web Aplication Now you need to unzip the master.zip file with the following command: Automation Ethernet wires (as much as odroid boards + 1 for the router) Connect Continue Monitoring Password Password: Delay to obtain the information in seconds: Description Manual/guide download Monitoring and maintenance download Automation download Download and file instalation Downloads In this section, you can dedicate yourself to maintaining odroid systems forever andwhen there are no problems with ssh. Otherwise you will need to connect ahdmi on the odroid master board to a monitor and from there fix it. Come in and discover our project. A project to doparallelization easily and quickly with the monitoring option andLAN maintenance. Team Students Finally, run the script as sudo as follows: HDMI (optional) INPUT TERMINAL: Sign in Instalation Introduction Made with Maintenance Guide Material Menu Monitoring Monitoring Monitoring and maintenance Mount the system Username Username: Number of points in a lineal graphic: OUTPUT ERROR TERMINAL: OUTPUT TERMINAL: Screen with HDMI connection (optional) Pause Monitoring To use the terminal you must first connect through the connect button.From here, you can only use commands that do not redirect theoutput to file. That is, you will not be able to echo 'hello'> file. Odroid board Home Teachers Mouse (optional) Remove Output Send Command If you don't know what parallelism is all about, don't worry becauseWe tell you. Parallelization is about sharing the workbetween the same machine About us We are a group of two students of the Rovira and Virgili University. Currently, we are in our last year of Computer Engeenering degree. You can see more information about us. Stop Monitoring Switch Close Sign out Keyboard (optional) Once unzipped, go to the directory you unzipped with thenext command: Once inside the terminal of our master plate, go to the directoryDocuments with the following command: Once inside the directory, you must download the files for theautomation. You must run the following command: Router with internet connection by and and their cores or between various machines. Our project deals with theparallelization between several machines and easily since onlyyou'll need odroid boards, one switch and your router. You may know about computers or not, as we dowe will be at your disposal and we will also offer you a manual so that theinstallation is easy. 