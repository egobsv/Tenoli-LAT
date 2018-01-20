## Modificar y Compilar X-Road
Antes de iniciar asegúrese de descargar descargar el código fuente de X-Road dentro de la carpeta 'xroad-code'.  La versión 6.16 es la ultima disponible por le momento y puede [descargarla en este enlace](https://github.com/ria-ee/X-Road/releases)

### Agregar PKI 
La palataforma necesita conocer los campos que utilizan los certificados de su PKI, para esto es necesario crear cuatro classes en Java:

* 1- SubjectClientIdDecoder:  Describe los campos incluidos en el Sujeto de los certificados, Ejemplo SVSubjectClientIdDecoder.java. Este Archivo debe incluirse en la carpeta
```
 xroad-code/src/common-util/src/main/java/ee/ria/xroad/common/util/
```
* 2- SignCertificateProfileInfo: Información del certificado de Firma, Ejemplo TENOLISignCertificateProfileInfo.java. Este Archivo debe incluirse en la carpeta
``` 
xroad-code/src/common-util/src/main/java/ee/ria/xroad/common/certificateprofile/impl/
```
* 3- AuthCertificateProfileInfo: Información del certificado de Autenticación de clientes, Ejemplo TENOLIAuthCertificateProfileInfo.java. Este Archivo debe incluirse en la carpeta 
```
xroad-code/src/common-util/src/main/java/ee/ria/xroad/common/certificateprofile/impl/
```
* 4- CertificateProfileInfoProvider: Información del proveedor de certificados, incluye la información del certificado de firma y Autenticación, Ejemplo TENOLIAuthCertificateProfileInfo.java. Este Archivo debe incluirse en la carpeta 
```
xroad-code/src/common-util/src/main/java/ee/ria/xroad/common/certificateprofile/impl/
```

 ### Agregar Idioma Español


Los archivos de traducción al Español están incluidos en el comprimido ESfiles-6.16.zip. Luego de descargarlo y expandirlo tendrá una carpeta ESfiles-6.16; debe copiar los archivos de traducción al código fuente como se muestra a continuación:
```
cp ESfiles-6.16/center-ui/* xroad-code/src/center-ui/config/locales/;
cp ESfiles-6.16/common-ui/* xroad-code/src/common-ui/config/locales/;
cp ESfiles-6.16/proxy-ui/* xroad-code/src/proxy-ui/config/locales/;
cd xroad-code/src;
```
Modifique la variable 'cert_profile_info_hint' dentro del archivo xroad-code/code/src/center-ui/config/locales/views_es.yml para mencionar la clase que usa su PKI, ejemplo:
```
cert_profile_info_hint: "(Nombre de dominio que implementa la interfaz \n ee.ria.xroad.common.certificateprofile.impl.TENOLICertificateProfileInfoProvider)"
```
Luego de copiar los archivos debe cambiar el idioma por defecto de la plataforma modificando la variable config.i18n.default_locale (':en' por ':es') dentro de los archivos: 

```
xroad-code/src/center-service/config/application.rb 
xroad-code/src/center-ui/config/application.rb
xroad-code/src/proxy-ui/config/application.rb
```
### Ubuntu Xenial
Si desea instalar la plaforma en Unbuntu Xenial debe modificar el archivo 
```
xroad-code/src/packages/xroad/debian/control
```
Y modificar la dependencia: 
 "postgresql|postgresql-9.4, postgresql-contrib|postgresql-contrib-9.4" 
 por "postgresql, postgresql-contrib"

### Compilar la Plataforma
Para compilar el código fuente debe seguir las instrucciones del proyecto X-Road [disponible en este enlace](https://github.com/ria-ee/X-Road/blob/44d69e017541fe25f7cdfcd541a5d74d66ff5566/src/BUILD.md)

Una vez terminada la compilación los paquetes de instalación estarán disponibles en las siguientes rutas: 
```
Paquetes .DEB en xroad-code/src/packets/ 
Paquetes  .RPM en xroad-code/src/packets/xroad/redhat/RMPS/
```
La instalación de los paquetes DEB está [documentada en este enlace](https://github.com/egobsv/Tenoli-LAT/blob/master/Instalar-Trusty.md).


## Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  

