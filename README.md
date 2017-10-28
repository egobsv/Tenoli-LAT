## Tenoli-LAT

Plataforma de interoperabilidad distribuida usando firma electrónica. Esta repositorio contiene la documentación para facilitar la implementación de es plataforma, basada en [X-Road](https://github.com/ria-ee/X-Road/) de Estonia, en Latinoamérica y el Caribe.  

## Sobre la plataforma
La plataforma tiene tres componentes principales:

1- Un servidor Central encargado registrar miembros en la red de intercambio seguro de datos y de mantener un catalogo de los servicios disponibles.

2-Uno o más servidores de seguridad instalados en cada institución participante que actúa como pasarela de conexión con la red de intercambio.

3-Una autoridad de certificación y sellado de tiempo encargada de emitir certificados y validar los certificados de identidad y firma en cada transacción realizada en la plataforma. 

**Nota**: La instalación inicial usa OpenSSL como Autoridad Certificadora para hacer pruebas. Para usar la plataforma en producción se recomienda usar un proveedor comercial o una Autoridad Certifcadora interna mas robusta.
 

## Instalar versión en Inglés

Un resumen de la instalación de prueba usando Ansible y el repositorio oficial del proyecto [está disponible en este enlace](https://github.com/ria-ee/X-Road/blob/develop/ansible/README.md)

## Instalar versión en Español

Por ahora la traducción al Español no esta incluida en el código del proyecto. Para usar la plataforma en idioma Español existen dos opciones:

1. Descargar paquetes compilados que incluyen la traducción al Español desde [esta dirección](http://tenoli.gobiernoelectronico.gob.sv/debs/) 

La instalación de los paquetes DEB está [documentada en este enlace](https://github.com/egobsv/Tenoli-LAT/blob/master/Instalar-DEBS.md).

2. Compilar los paquetes incluyendo la traducción al Español. Antes de iniciar asegúrese de descargar a su maquina todos los archivos de este repositorio. En adelante se asume que esa copia existe en la carpeta 'copiaRepo'. A continuación se detallan cada uno de los pasos

* Descargar el código fuente de X-Road dentro de la carpeta 'xroad-code'. La traducción corresponde a la versión 6.16 [disponible en este enlace](https://github.com/ria-ee/X-Road/releases)

* Descargar el archivo ESfiles-6.16.zip expandirlo, luego copiar los archivos de traducción al código fuente

```
cp copiaRepo/ESfiles-6.16/center-ui/* xroad-code/src/center-ui/config/locales/;
cp copiaRepo/ESfiles-6.16/common-ui/* xroad-code/src/common-ui/config/locales/;
cp copiaRepo/ESfiles-6.16/proxy-ui/* xroad-code/src/proxy-ui/config/locales/;
cd xroad-code/src;
```
* Cambiar el idioma de la plataforma modificando la variable config.i18n.default_locale (':en' por ':es') dentro de los archivos: 

```
xroad-code/src/center-service/config/application.rb 
xroad-code/src/center-ui/config/application.rb
xroad-code/src/proxy-ui/config/application.rb
```

* Compilar el código fuente siguiendo las instrucciones del proyecto X-Road [disponible en este enlace](https://github.com/ria-ee/X-Road/blob/44d69e017541fe25f7cdfcd541a5d74d66ff5566/src/BUILD.md)

* Una vez terminada la compilación los paquetes de instalación en las siguientes rutas: 

```
Paquetes .DEB en xroad-code/src/packets/ 
Paquetes  .RPM en xroad-code/src/packets/xroad/redhat/RMPS/
```

La instalación de los paquetes DEB está [documentada en este enlace](https://github.com/egobsv/Tenoli-LAT/blob/master/Instalar-DEBS.md).




## Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  

