��    L      |  e   �      p  I  q  �  �  J  �	  �  �
    �  �  �  �  U  e     �   �  s   `     �     �  H   �     H  5   X     �     �     �     �  *   �     �     �  -     "   ?  7   b     �  �   �  �   �     #  
   )  >   4     s     �     �     �     �  	   �     �     �     �     �  
   �     �          $     6     C  %   Q     w     �  &   �     �  �   �     �     �  
   �     �     �     �  �   	     �  �   �     �     �     �     �     �  [   �  l   <  |   �  "   &      I      L   �   N   �   !  B  �!  I  �"  �  E$  J  ;&  �  �'    )  �  &+  �  �.  e   �1  �   2  s   �2     ^3     z3  H   �3     �3  5   �3  	   4     "4     >4     J4  -   W4     �4     �4  +   �4  !   �4  7   �4     .5  �   <5  �   6     �6  
   �6  >   �6     7     7     /7     ?7     N7     [7     c7     o7     v7     7  
   �7  
   �7     �7     �7     �7     �7  %   �7     8     8  &   88     _8  �   t8     V9     e9  
   m9     x9     �9     �9  �   �9     ^:  �   n:     D;     W;     ^;     e;     t;  [   �;  l   �;  |   N<  "   �<     �<     �<  �   �<  �   �=        3                   )   /   &          7   +       K       J   $       I             L       H             ;   "   8      %      -          '   #                         9   5   (   	   2   4             E                 @   C   *       .       :   D         A   
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
 A continuació disposa d'un enllaç per a visitar la pàgina de les plaques/ordinadors que utilitzem. A continuació, podreu veure informació sobre els professors implicats en el nostre projecte, tot i què el nostre professor principal ha estat en Carles Aliagas ja que ens ha fet de tutor del treball de fi de carrera. A més a més, nosaltres busquem i tenim l'objectiu que el nostre projecte ajudi a gent en l'àmbit de l'educació. Adaptador de USB a Ethernet Aplicació web Ara haureu de descomprimir el fitxer master.zip amb la següent comanda: Automatització Cables Ethernet (tants com plaques + 1 per el router) Connectar Continuar amb el monitoreig Contrasenya Contrasenya: Retràs per a l'obtenció de dades en segons: Descripció Descàrrega del manual Descàrrega pel manteniment i el monitoreig Descàrrega per l'automatització Descàrrega, descompressió i instal·lació d’arxius Descàrregues En aquesta secció, pots dedicar-te a mantenir els sistemes Odroid sempre que no hi hagi problemes amb el SSH. En cas contrari hauràs de connectar un HDMI a la placa master Odroid cap a un monitor i des d'allà arreglar-ho. Entra i descobreix el nostre projecte. Un projecte per a fer paral·lelització de manera fàcil i ràpida amb l'opció de monitoratge i manteniment LAN. Equip Estudiants Fnalment, executeu el script com a sudo de la següent manera: HDMI (opcional) TERMINAL PER A L'INPUT: Iniciar Sessió Instal·lació Introducció Fet amb Manteniment Manual Material Menú Monitoreig Monitoreig Monitoreig i manteniment Montar el sistema Nom d'usuari Nom d'usuari: Nombre de punts pels grafics lineals: TERMINAL PER A L'ERROR: TERMINAL PER A L'OUTPUT: Pantalla amb connexió HDMI (opcional) Pausar el monitoreig Per a usar la terminal primer tens de connectar-te a través del botó connectar. A partir d'aquí, només podràs utilitzar comandes que no redirigeixin l'output cap a fitxer. És a dir, no podràs fer un echo 'hola' > file. Plaques Odroid Portada Professors Ratolí (opcional) Eliminar output Enviar commanda Si no saps de què es tracta la paral·lelització, no et preocupis perquè nosaltres t'ho expliquem. La paral·lelització tracta de repartir la feina entre una mateixa màquina Sobre nosaltres Som un grup format per dos estudiants de la Universitat Rovira i Virgili, actualment cursant l'últim any de la carrera d'Enginyeria Informàtica. A continuació veureu informació sobre nosaltres, els estudiants. Para el monitoreig Switch Tancar Tancar Sessió Tecla (opcional) Un cop descomprimit, aneu dintre el directori que heu descomprimit amb la comanda següent: Un cop dintre a la terminal de la nostra placa màster, aneu al directori Documents amb la següent comanda: Un cop dintre el directori, heu de descarregar els arxius per a la automatització. Haureu d’executar la següent comanda: Un router amb connexió a Internet per i i els seus cores o entre diverses màquines. El nostre projecte tracta la paral·lelització entre diverses màquines i de manera fàcil, ja que només necessitaràs plaques Odroid, un  switch i el teu router. Pots saber d'ordinadors o no, ja que nosaltres estarem a la seva disposició i també li oferirem un manual per tal que la instal·lació sigui fàcil. 