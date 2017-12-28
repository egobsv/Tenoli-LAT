## Compilar X-Road, agregar traducción al Español

Antes de iniciar asegúrese de descargar a su maquina todos los archivos de este repositorio. En adelante se asume que esa copia existe en la carpeta 'copiaRepo'. A continuación se detallan cada uno de los pasos

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

La instalación de los paquetes DEB está [documentada en este enlace](https://github.com/egobsv/Tenoli-LAT/blob/master/Instalar-Trusty.md).


## Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  

