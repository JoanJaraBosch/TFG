��    L      |  e   �      p  I  q  �  �  J  �	  �  �
    �  �  �  �  U  e     �   �  s   `     �     �  H   �     H  5   X     �     �     �     �  *   �     �     �  -     "   ?  7   b     �  �   �  �   �     #  
   )  >   4     s     �     �     �     �  	   �     �     �     �     �  
   �     �          $     6     C  %   Q     w     �  &   �     �  �   �     �     �  
   �     �     �     �  �   	     �  �   �     �     �     �     �     �  [   �  l   <  |   �  "   &      I      L   �   N   �   !  B  �!  M  �"    I$  K  U&  �  �'    5)  �  O+  �  �.  h   �1  �   F2  s   +3     �3     �3  M   �3     4  6   )4  	   `4     j4     �4     �4  0   �4     �4     �4  3   �4      $5  3   E5  
   y5  �   �5  �   d6      7     7  P   7     d7     t7     �7     �7     �7  	   �7     �7     �7     �7     �7  	   �7     �7     �7     8     +8     =8  -   P8     ~8     �8  &   �8     �8  �   �8     �9     �9  
   �9     �9     �9     :  �   :     �:  �   �:     �;     �;     �;     �;     �;  i   �;  e   ]<  �   �<  "   P=     s=     w=  �   y=  �   %>        3                   )   /   &          7   +       K       J   $       I             L       H             ;   "   8      %      -          '   #                         9   5   (   	   2   4             E                 @   C   *       .       :   D         A   
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
Este manual tiene el propósito de pemitir al usuario inntalar de manera 
automatitzada un sistema de colas llamado Slurm el cual permitirá que se
pueda paralelizar de manera adecuada y eficiente.
Además, tambien automatitzará la instalación de la aplicación web para poder hacer
la monitorización y mantener nuestro sistema.
 
En este subapartado, puedes descargar la llanura web local para el mantenimiento y monitorización de las placas Odroid. Esta llanura te permitirá ver los estados esenciales de las placas como puede ser
la entropía, el calor, la utilización de las CPUs y otras. Además, proporciona un apartado de mantenimiento donde dispondrás de 3 pequeñas terminales donde 1 será por el input, y las otras por los
outputs (stdout y stderr) donde podrás ejecutar pequeños pedidos. A continuación tenéis el enlace de descarga.
 
En este subapartado, encontrarás el enlace que te permitirá descargar los archivos de automatización para crear el sistema de colas Slurm para la comunicación de las placas, el cortafuego por
la seguridad, la asignación de las direcciones IP para todas las placas y mucho más. A continuación tenéis el enlace de descarga.
 
En este último subapartado, tendréis la oportunidad de descargar el manual en PDF para saber como ejecutar nuestro proyecto y para saber como usarlo. En caso de no querer
descargar el manual, no hace falta que sufráis, puesto que en la barra de navegación de la llanura local, hay el apartado manual donde podrás ver el manual sin tenerlo que bajar. A continuación tenéis el enlace de
descarga.
 
En esta sección de la llanura web, tenso la opción para descargar nuestro proyecto otra vez en caso de no recordar el enlace o en caso de perder algún archivo
necesario por el funcionamiento correcto de las placas. Puedes descargar los archivos de automatización hechos por David Ferrer y tenso la oportunidad de descargar
la llanura web local que te permite monitorizar y mantener las placas Odroid. A más además te damos el enlace de descarga del manual por si no quieres seguir el manual de la llanura web y lo quieres en PDF.
 
Para poder ver la plana web, teneis que ir a un navegador web de un ordenador
que este en la misma zona LAN y poner la sigueinte dirección
https://ipOdroid.
Donde ipOdroid será la ip de la LAN Odroid. Seguidamente debereis aceptar los
permisos porque hemos generado certificados autofirmados para establecer una
conexión segura en nuestro servidor. Ahora debería poder ver la aplicación
web. En caso de que este utilitzando Firefox, deberá acceder al siguiente enlace
 https://ipOdroid:3000 para aceptar los permisos del servidor node
encargado de enviar los datos para los gráficos.
Finalmente, necessitará entrar con usuario y contraseña odroid odroid para
poder monitoritzar y mantener las placas. Para usar la placa con más de un usuario
, tendrá que acceder al siguiente enlace  https://ipOdroid/admin donde estaráa la plana
de administrador para poder crear más usuarios y administrarlos
para así monitoritzar las placas.
 
Primero de todo necesitarñas un lugar donde poner tus placas Odroid de manera
que el cada cable Ethernet irá de un puerto ethernet del switch a un puerto ethhernet de las
placas. Después tendrás que conectar el adaptador USB a Ethernet y el cable
Ethernet del USB al router. De manera opcional podrás poner el HDMI, el
ratolón y el teclado a la placa master para poder configurarla con la ayuda de una
pantalla. En caso de no querer poner el material opcional, tendreis que ir a la 
configuración del router pera saber la IP de la placa master de manera LAN y
connectarse por SSH de la siguiente manera:
ssh odroid@ip
Donde tendras que poner de contraseña Odroid. Ahora ya estas listo para pasar al
apartado  de descárgas.
 A continuación dispone de un enlace para visitar la página de las placas/ordinadores que utilizaremos. A continuación, podréis ver información sobre los profesores implicados en el nuestro proyecto, todo y que nuestro profesor principal ha estado en Carles Aliagas puesto que nos ha hecho de tutor del trabajo de fin de carrera. Además, nosotros buscamos y tenemos el objetivo que nuestro proyecto ayude a gente en el ámbito de la educación. Adaptador de USB a Ethernet Aplicación web Ahora tendreis que descomprimir el archivo master.zip de la siguiente manera: Automatización Cables Ethernet (tantos como placas +1 para el router) Connectar Continuar con el monitoreo Contraseña Contraseña: Retraso para la obtención de datos en segundos: Descripción Descarga del manual Descarga para el mantenimiento y la monitorización Descarga para la automatización Descarga, descompresión y instalación de archivos Descárgas En esta sección, puedes dedicarte a mantener los sistemas Odroid siempre que no haya problemas con el SSH. En caso contrario tendrás que conectar un HDMI a la placa master Odroid hacia un monitor y desde allá arreglarlo. Entra y descubre nuestro proyecto. Un proyecto para hacer paralelización de manera fácil y rápida con la opción de monitorización y mantenimiento LAN. Equipo Estudiantes Finalmente, solo teneis que ejecutar el script como sudo de la siguiente manera: HDMI (opcional) TERMINAL DE INPUT: Iniciar sesión Intalación Introducción Hecho con Mantenimiento Manual Material Menú Monitoreo Monitorización Monitorización y mantenimiento Montar el sistema Nombre de usuario Nombre de usuario: Nombre de puntos para los gráficos lineales: TERMINAL DE ERROR: TERMINAL DE OUTPUT: Pantalla con conexión HDMI (opcional) Pausar el monitoreo Para usar la terminal primero tenso de conectarte a través del botón conectar. A partir de aquí, solo podrás utilizar pedidos que no redirijan el output hacia fichero. Es decir, no podrás hacer un echo 'hola' > file. Placas Odroid Portada Profesores Ratón (opcional) Eliminar output Enviar commando Si no sabes de que se trata la paralelización, no te preocupes porque nosotros te lo explicamos. La paralelización trata de repartir el trabajo entre una misma máquina Sobre nosotros Somos un grupo formado por dos estudiantes de la Universitat Rovira i Virgili, actualmente cursando el último año de la carrera de Ingeniería Informática. A continuación veréis información sobre nosotros, los estudiantes. Parar el monitoreo Switch Cerrar Cerrar sesión Teclado (opcional) Una vez descomprimido, teneis que ir al directorio creado con la descompresión con la siguiente comanda: Una vez esteis dentro en la terminal, teneis que ir al directorio Documents con la siguiente comanda: Una vez dentro del directorio, teneis que descargar los archivos para hacer la automatitzación. Tendreis que ejecutar la siguiente comanda: Un router con conexión a Internet por y y sus cores o entre varias máquinas. Nuestro proyecto trata la paralelización entre varias máquinas y de manera fácil, puesto que solo necesitarás placas Odroid, uno  switch y tu router. Puedes saber de ordenadores o no, puesto que nosotros estaremos a su disposición y también le ofreceremos un manual para que la instalación sea fácil. 