## Modificar y Compilar X-Road
Antes de iniciar asegúrese de descargar descargar el código fuente de X-Road dentro de la carpeta 'xroad-code'.  La versión 6.22 es la ultima disponible por le momento y puede [descargarla en este enlace](https://github.com/nordic-institute/X-Road/releases/tag/6.22.0)

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
* 4- CertificateProfileInfoProvider: Información del proveedor de certificados, incluye la información del certificado de firma y Autenticación, Ejemplo TENOLICertificateProfileInfoProvider.java. Este Archivo debe incluirse en la carpeta 
```
xroad-code/src/common-util/src/main/java/ee/ria/xroad/common/certificateprofile/impl/
```

 ### Agregar Idioma Español


Los archivos de traducción al Español están incluidos en el comprimido ESfiles-6.22.zip. Luego de descargarlo y expandirlo tendrá una carpeta ESfiles-6.22; debe copiar los archivos de traducción al código fuente como se muestra a continuación:
```
cp ESfiles-6.22/center-ui/* xroad-code/src/center-ui/config/locales/;
cp ESfiles-6.22/common-ui/* xroad-code/src/common-ui/config/locales/;
cp ESfiles-6.22/proxy-ui/* xroad-code/src/proxy-ui/config/locales/;
cp ESfiles-6.22/es.yml xroad-code/src/center-common/config/locales/es.yml
cd xroad-code/src;
```
Modifique la variable 'cert_profile_info_hint' dentro del archivo xroad-code/code/src/center-ui/config/locales/views_es.yml para mencionar la clase que usa su PKI, ejemplo:
```
cert_profile_info_hint: "(Nombre de dominio que implementa la interfaz \n ee.ria.xroad.common.certificateprofile.impl.TENOLICertificateProfileInfoProvider)"
```
Luego de copiar los archivos debe cambiar el idioma por defecto; para esto reemplace la línea:
```
config.i18n.default_locale = :en
```
Con estas dos líneas:
```
  config.i18n.default_locale = :es
```

Este mismo cambio debe aplicarse en los siguientes tres archivos: 

```
xroad-code/src/center-service/config/application.rb 
xroad-code/src/center-ui/config/application.rb
xroad-code/src/proxy-ui/config/application.rb
```

### Compilar la Plataforma
Para compilar el código fuente debe seguir las instrucciones del proyecto X-Road [disponible en este enlace](https://github.com/nordic-institute/X-Road/blob/6.22.0/src/BUILD.md)

Una vez terminada la compilación los paquetes de instalación estarán disponibles en las siguientes rutas: 
```
Paquetes .DEB en xroad-code/src/packets/ 
Paquetes  .RPM en xroad-code/src/packets/xroad/redhat/RMPS/
```
La instalación de los paquetes DEB está [documentada en este enlace](https://github.com/egobsv/Tenoli-LAT/tree/master/ubuntu-xenial).


## Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  

