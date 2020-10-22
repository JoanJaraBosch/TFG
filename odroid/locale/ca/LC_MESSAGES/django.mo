��    <      �  S   �      (  I  )  �  s  ?  g  �  �	    A  �  U  �    e   �  �   =  v        �     �  H   �       5        J     W     c  -   z  "   �  7   �       �     �   �     �  
   �  >   �     �     �     �     	          %     1     8     A     G     W     u     �  &   �  �   �     �     �  
   �     �  �   �     }     �  �   �     j     y  [   �  l   �  |   S  "   �     �  �   �  �   �  B  `  I  �   �  �!  ?  �#  �  !%    �&  �  �(  �  �,  e   Q/  �   �/  v   �0     
1     &1  H   51     ~1  5   �1     �1     �1     �1  -   �1  "   "2  7   E2     }2  �   �2  �   l3     4  
   4  >   4     [4     k4     s4     �4     �4     �4     �4     �4     �4     �4     �4     �4     5  &   5  �   65     6     6  
   '6     26  �   E6     �6     7  �   7     �7     �7  [   8  l   `8  |   �8  "   J9     m9  �   o9  �   ':     $             !   <   
   	   4                          +   &             :       6                      8   1   ;   (                 ,           3                                   -   9                7      5   *         "       )   '   0          .   %           #             2            /    
Aquest manual té el propòsit de permetre a l'usuari instal·lar de manera
automatitzada un sistema de cues anomenat Slurm el qual permetrà que es
pugui paral·lelitzar de manera adequada i eficient.
A més a més, també automatitzarà la instal·lació de l'aplicació web per tal de
monitorar i mantenir el nostre sistema.
 
En aquest subapartat, pots decarregar la plana web local per al manteniment i monitorització de les plaques odroid. Aquesta plana et permetrà veure els estats essencials de les plauqes com pot ser
la entropia, la calor, el usage de les cpus i altres. A més a més, proporciona un apartat de manteniment on disposaràs de 3 petites terminals on 1 serà per el input, i les altres pels 
outputs (stout i stderr) on podràs executar petites comandes. A continuació teniu l'enllaç de descàrrega.
 
En aquest subapartat, trobaràs l'enllaç que et permetrà descarregar els arxius d'automatització per tal de crear el sistema de cues Slurm per a la comunicació de les plaques, el tallafocs per 
la seguretat, la assignació de ips per a totes les plaques i molt més. A continuació teniu l'enllaç de descàrrega.
 
En aquest últim subapartat, tindreu la oportunitat de descarregar el manual en pdf per tal de saber com executar el nostre projecte i per tal de saber com fer-lo servir. En cas de no voler 
descarregar el manual, no cal que patiu ja que en la barra de navegació de la plana local, hi ha l'apartat manual on podràs veure el manual sense tindre'l que baixar. A continuació teniu l'enllaç de 
descàrrega.
 
En aquesta secció de la plana web, tens la opció per a descarregar el nostre projecte un altre cop en cas de no recordar l'enllaç o en cas de perdre algún arxiu 
necessari per el funcionament correcte de les plaques. Pots descarregar els arxius d'automatització fets pel David Ferrer i tens la oportunitat de descarregar 
la plana web local  que et permet monitoritzar i mantenir les plaques odroid. A més a més et donem l'enllaç de descàrrega del manual per si no vols seguir el manual de la plana web i el vols en pdf.
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
 A continuació disposa d'un enllaç per a visitar la pàgina de les plaques/ordinadors que utilitzem. A continuació, podreu veure informació sobre els professors implicats en el nostre projecte, tot i què el nostre professor principal ha estat en Carles Aliagas ja que ens ha fet de tutor del treball de fi de carrera. A més a més, nosaltres busquem i tenim l'objectiu de que el nostre projecte ajudi a gent en l'ambit de la educació. Adaptador de USB a Ethernet Aplicació web Ara haureu de descomprimir el fitxer master.zip amb la següent comanda: Automatització Cables Ethernet (tants com plaques + 1 per el router) Contrasenya: Descripció Descàrrega del manual Descàrrega pel manteniment i monitorització Descàrrega per la automatització Descàrrega, descompressió i instal·lació d’arxius Descàrregues En aquesta secció, pots dedicar-te a mantenir els sistemes odroid sempre i quan no hi hagi problemes amb el ssh. En cas contrari hauras de conectar un hdmi a la placa master odroid cap a un monitor i desde alla arreglar-ho. Entra i descobreix el nostre projecte. Un projecte per a fer paral·lelització de manera fàcil i ràpida amb la opció de monitorització i manteniment LAN. Equip Estudiants Fnalment, executeu el script com a sudo de la següent manera: HDMI (opcional) Idiomes Iniciar Sessió Instal·lació Introducció Manteniment Manual Material Menú Monitorització Monitorització i manteniment Montar el sistema Nom d'usuari: Pantalla amb connexió HDMI (opcional) Per a usar la terminal primer has de conectar-te a traves del boto connect. A partir d'aqui, només podràs utilitzar comandes que no redirigeixin el output cap a fitxer. Es a dir, no podras fer un echo 'hola' > file. Plaques Odroid Portada Professors Ratolí (opcional) Si no saps de que es tracta la paral·lelització, no et preocupis perquè nosaltres t'ho expliquem. La paral·lelització tracta de repartir la feina entre una mateixa màquina Sobre nosaltres Swicth Sóm un grup format per dos estudiants de la Universitat Rovira i Virgili, actualment cursant lúltim any de la carrera d'Enginyeria Informàtica. A continuació veureu informació sobre nosaltres, els estudiants. Tancar Sessió Tecla (opcional) Un cop descomprimit, aneu dintre el directori que heu descomprimit amb la comanda següent: Un cop dintre a la terminal de la nostra placa màster, aneu al directori Documents amb la següent comanda: Un cop dintre el directori, heu de descarregar els arxius per a la automatització. Haureu d’executar la següent comanda: Un router amb connexió a Internet i i els seus cores o entre diverses màquines. El nostre projecte tratca la paral·lelització entre diverses màquines i de manera fàcil ja que només necessitaras plaques odroid, un  switch i el teu router. Pots saber d'ordinadors o no, ja que nosaltres estarem a la seva disposició i també li oferirem un manual per tal de que la instal·lació sigui fàcil. Project-Id-Version: PACKAGE VERSION
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
En aquest subapartat, pots decarregar la plana web local per al manteniment i monitorització de les plaques odroid. Aquesta plana et permetrà veure els estats essencials de les plauqes com pot ser
la entropia, la calor, el usage de les cpus i altres. A més a més, proporciona un apartat de manteniment on disposaràs de 3 petites terminals on 1 serà per el input, i les altres pels 
outputs (stout i stderr) on podràs executar petites comandes. A continuació teniu l'enllaç de descàrrega.
 
En aquest subapartat, trobaràs l'enllaç que et permetrà descarregar els arxius d'automatització per tal de crear el sistema de cues Slurm per a la comunicació de les plaques, el tallafocs per 
la seguretat, la assignació de ips per a totes les plaques i molt més. A continuació teniu l'enllaç de descàrrega.
 
En aquest últim subapartat, tindreu la oportunitat de descarregar el manual en pdf per tal de saber com executar el nostre projecte i per tal de saber com fer-lo servir. En cas de no voler 
descarregar el manual, no cal que patiu ja que en la barra de navegació de la plana local, hi ha l'apartat manual on podràs veure el manual sense tindre'l que baixar. A continuació teniu l'enllaç de 
descàrrega.
 
En aquesta secció de la plana web, tens la opció per a descarregar el nostre projecte un altre cop en cas de no recordar l'enllaç o en cas de perdre algún arxiu 
necessari per el funcionament correcte de les plaques. Pots descarregar els arxius d'automatització fets pel David Ferrer i tens la oportunitat de descarregar 
la plana web local  que et permet monitoritzar i mantenir les plaques odroid. A més a més et donem l'enllaç de descàrrega del manual per si no vols seguir el manual de la plana web i el vols en pdf.
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
 A continuació disposa d'un enllaç per a visitar la pàgina de les plaques/ordinadors que utilitzem. A continuació, podreu veure informació sobre els professors implicats en el nostre projecte, tot i què el nostre professor principal ha estat en Carles Aliagas ja que ens ha fet de tutor del treball de fi de carrera. A més a més, nosaltres busquem i tenim l'objectiu de que el nostre projecte ajudi a gent en l'ambit de la educació. Adaptador de USB a Ethernet Aplicació web Ara haureu de descomprimir el fitxer master.zip amb la següent comanda: Automatització Cables Ethernet (tants com plaques + 1 per el router) Contrasenya: Descripció Descàrrega del manual Descàrrega pel manteniment i monitorització Descàrrega per la automatització Descàrrega, descompressió i instal·lació d’arxius Descàrregues En aquesta secció, pots dedicar-te a mantenir els sistemes odroid sempre i quan no hi hagi problemes amb el ssh. En cas contrari hauras de conectar un hdmi a la placa master odroid cap a un monitor i desde alla arreglar-ho. Entra i descobreix el nostre projecte. Un projecte per a fer paral·lelització de manera fàcil i ràpida amb la opció de monitorització i manteniment LAN. Equip Estudiants Fnalment, executeu el script com a sudo de la següent manera: HDMI (opcional) Idiomes Iniciar Sessió Instal·lació Introducció Manteniment Manual Material Menú Monitorització Monitorització i manteniment Montar el sistema Nom d'usuari: Pantalla amb connexió HDMI (opcional) Per a usar la terminal primer has de conectar-te a traves del boto connect. A partir d'aqui, només podràs utilitzar comandes que no redirigeixin el output cap a fitxer. Es a dir, no podras fer un echo 'hola' > file. Plaques Odroid Portada Professors Ratolí (opcional) Si no saps de que es tracta la paral·lelització, no et preocupis perquè nosaltres t'ho expliquem. La paral·lelització tracta de repartir la feina entre una mateixa màquina Sobre nosaltres Switch Sóm un grup format per dos estudiants de la Universitat Rovira i Virgili, actualment cursant lúltim any de la carrera d'Enginyeria Informàtica. A continuació veureu informació sobre nosaltres, els estudiants. Tancar Sessió Tecla (opcional) Un cop descomprimit, aneu dintre el directori que heu descomprimit amb la comanda següent: Un cop dintre a la terminal de la nostra placa màster, aneu al directori Documents amb la següent comanda: Un cop dintre el directori, heu de descarregar els arxius per a la automatització. Haureu d’executar la següent comanda: Un router amb connexió a Internet i i els seus cores o entre diverses màquines. El nostre projecte tratca la paral·lelització entre diverses màquines i de manera fàcil ja que només necessitaras plaques odroid, un  switch i el teu router. Pots saber d'ordinadors o no, ja que nosaltres estarem a la seva disposició i també li oferirem un manual per tal de que la instal·lació sigui fàcil. 