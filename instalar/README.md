
## Instalar Plataforma

Los paquetes oficiales de X-Road solo pueden ser usados con certificados de Finlandia o estonia y pueden ser instalados en Ubuntu Bionic o RHEL7. Para usar la autoridad certificadora de su país es necesario [compilar la plataforma](https://github.com/egobsv/Tenoli-LAT/tree/master/compilar). Opcionalmente puede  [descargar los paquetes DEB](http://tenoli.gobiernoelectronico.gob.sv/debs/) de TENOLI - El Salvador para crear un ambiente de pruebas. 


### Instalación usando Paquetes DEB
En una nueva instalación de Ubuntu bionic o Debian Buster, descargue la carpeta 'instalar' de este repositorio y cópiela en la carpeta /opt. Cree la carpeta /opt/debs y copie sus paquetes DEB dentro de esta carpeta. Dentro de la carpeta scripts, edite los archivos de respuestas (sc-respuestas.txt y ss-respuestas.txt) que contienen los valores que se usan en la instalación.  Luego, con privilegios de Administrador/Root, ejecute los siguientes comandos:

- Para instalar el servidor central
```
chmod +x servidorCentral.sh
./servidorCentral.sh
```
La configuración del servidor central esta descrita en la [documentación oficial de X-Road](https://github.com/nordic-institute/X-Road/blob/6.22.0/doc/Manuals/ig-cs_x-road_6_central_server_installation_guide.md#33-configuring-the-central-server-and-the-management-services-security-server) 

- Para instalar el servidor de seguridad
```
chmod +x servidorSeguridad.sh
./servidorSeguridad.sh
```

### Instalacion usando Paquetes RPM
La plataforma puede ser instalada en Red Hat Enterprise Linux 7 (RHEL7) o superior.
Cree la carpeta /opt/rpms y copie sus paquetes dentro de esta carpeta, luego cree el archivo /etc/yum.repos.d/tenoli.local con este contenido:
```
[centos7]
name=tenoli
baseurl=file:///opt/rpms/
enabled=1
gpgcheck=0
```
Active su nuevo respotiorio con estos comandos:
```
~# yum clean all
~# yum repolist all
```

Las [instrucciones de instalación estan dipsonibles en la documentación oficial](https://github.com/nordic-institute/X-Road/blob/6.22.0/doc/Manuals/ig-ss_x-road_v6_security_server_installation_guide_for_rhel7.md). Asegurese de usar su repositorio local durante la instalación;



### Instalación usando Vagrant

El archivo Vagrantfile de esta carpeta instala los paquetes DEB de la plataforma en un ambiente de prueba con todos sus componentes usando Vagrant y Ubuntu bionic. El script de Vagrant instala automáticamente un servidor central, una autoridad certificadora y dos servidores de seguridad usando maquinas virtuales.


### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  
