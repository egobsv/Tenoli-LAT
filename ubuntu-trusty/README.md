## Instalar Servidor usando Unbuntu Trusty

Antes de iniciar asegurese de [descargar los paquetes DEB](http://tenoli.gobiernoelectronico.gob.sv/debs/), estos paquetes se compilaron usando la traduccion al Español. A continuacion en una nueva instalacion de Ubuntu Trusty con privilegios de Administrador/Root, ejecute los siguientes comandos:
```
useradd -m xroad;    
passwd xroad;
add-apt-repository ppa:nginx/stable;
add-apt-repository ppa:openjdk-r/ppa;
apt-get update;
apt-get install --force-yes -y python-iniparse rlwrap ssl-cert authbind ntp crudini libnspr4 dpkg-dev libnss3 libnss3-nssdb libopts25 libossp-uuid16 libpcsclite1 libpq5 libxslt1.1 libnginx-mod-http-echo nginx-common nginx-light java-common ca-certificates-java openjdk-8-jre-headless postgresql postgresql-9.3 postgresql-client-9.3 unzip libmhash2 postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib-9.3;
```

Copie los paquetes descargados en /home/xroad/.  Para facilitar la instalción crearemos un repositorio local usando los paquetes DEB descargados. Este repositorio local permitirá que el sistema resuelva dependencias entre paquetes de forma automatica.
 
 ```
 cd /home/xroad;
 dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz;
 touch /etc/apt/sources.list.d/local.list;
 echo "deb file:/home/xroad ./" >> /etc/apt/sources.list.d/local.list; 
 apt-get update;
  ````

Para instalar el Servidor Central, utilice el siguiente comando:
```
apt-get install --allow-unauthenticated -y xroad-centralserver;
```
Para instalar cada Servidor de Seguridad, utilice el siguiente comando:
```
apt-get install --allow-unauthenticated -y xroad-securityserver;
```
La instalación de la plataforma con todos sus componentes usando Vagrant [esta documentada aquí](instalar-vagrant.md)

### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  