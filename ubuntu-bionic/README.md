
## Instalar Plataforma usando Ubuntu Bionic

Los paquetes oficiales de X-Road solo pueden ser instalados en Ubuntu Trusty. Para usar bionic necesita [compilar la plataforma](https://github.com/egobsv/Tenoli-LAT/tree/master/compilar) y modificar sus dependencias. Opcionalmente puede  [descargar los paquetes DEB](http://tenoli.gobiernoelectronico.gob.sv/debs/) de TENOLI - El Salvador que ya incluyen estos cambios. 


### Instalación de Servidor
En una nueva instalación de Ubuntu bionic, descargue la carpeta ubuntu-bionic de este repositorio y cópiela en la carpeta /opt. Cree la carpeta /opt/scripts/debs y copie sus paquetes DEB dentro de esta carpeta. Dentro de la carpeta scripts, edite los archivos de respuestas (sc-respuestas.txt y ss-respuestas.txt) que contienen los valores que se usan en la instalación.  Luego, con privilegios de Administrador/Root, ejecute los siguientes comandos:

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
### Instalación de adaptador REST
La plataforma esta diseñada para trabjar con mensajes SOAP/XML, el adaptador REST es un módulo adicional que permite usar mensajes JSON y su código fuente esta disponible en [este sitio](https://github.com/vrk-kpa/REST-adapter-service). Puede descargar el paquete de bionic desde [esta ruta](http://tenoli.gobiernoelectronico.gob.sv/debs/rest-adapter-service.deb). Para instalarlo, descarguelo dentro del Servidor de Seguridad y ejecute el siguiente comando:
```
dpkg -i rest-adapter-service.deb 
```
Los archivos de confirguración del módulo están disponibles en /etc/rest-adapter-service. Puede encontrar ejemplos detallados dentro de [la documentación](https://github.com/vrk-kpa/REST-adapter-service/blob/master/documentation/Rest-Adapter-Service-principles.md). La página del servicio esta disponible en http://[ip servidor]:8080/rest-service-adapter.


### Instalación usando Vagrant

El archivo Vagrantfile de esta carpeta instala los paquetes DEB de la plataforma en un ambiente de prueba con todos sus componentes usando Vagrant y Ubuntu bionic. El script de Vagrant instala automáticamente un servidor central, una autoridad certificadora y dos servidores de seguridad usando maquinas virtuales.

### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  
