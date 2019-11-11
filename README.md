## Tenoli-LAT 

Plataforma de interoperabilidad distribuida usando firma electrónica. Este repositorio contiene la documentación para facilitar la implementación de esta plataforma, basada en [X-Road](https://e-estonia.com/solutions/interoperability-services/x-road/) de Estonia, en Latinoamérica y el Caribe.  La plataforma aplica los siguientes estándares:

* PKI - Perfil de certificado de identidad/autorización IETF RFC-5280
* OCSP - Verificación de Certificados IETF RFC 6960 y RFC 2560.
* TSA - Sellado electrónico de mensajes  IETF RFC 3161.
* XaDES - Firma de mensajes electrónicos ETSI EN 319 132
* eIDAS - Gestión segura de certificados ETSI EN 419 211 (UNE-EN 419211-1:2016)
* ASiCE - Contenedores firmados y sellados electrónicamente ETSI EN 319 162 

## Sobre la plataforma
La plataforma X-Road (Versión 6.22) crea una red segura de intercambio de datos entre instituciones de gobierno y tiene tres componentes principales:

1- Un servidor Central encargado registrar miembros en la red de intercambio y de mantener un catálogo de servicios disponibles.

2-Uno o más servidores de seguridad instalados en cada institución participante que actúa como pasarela de conexión con la red de intercambio.

3-Una PKI, autoridad de certificación y sellado de tiempo encargada de emitir certificados y validar los certificados de identidad y firma en cada transacción realizada en la plataforma. 

El archivo Vagrantfile de este repositorio instala automáticamente un servidor central, una autoridad certificadora y dos servidores de seguridad usando maquinas virtuales. 

**Nota**: La instalación inicial usa OpenSSL para simular los servicios de una PKI y hacer pruebas. Para usar la plataforma en producción se recomienda usar un proveedor comercial o una Autoridad Certificadora interna más robusta. Como ejemplo, [puede usar EJBCA](https://github.com/egobsv/certificadora) e importar los perfiles de certificados EJBCAcertprofiles-TENOLI.zip, EJBCAentityprofiles-TENOLI.zip. 

Actualmente, la documentación de este repositorio solo comprende la instalación de la plataforma. La configuración de la plataforma está disponible en la sección Manuales de la [documentación de X-Road](https://github.com/nordic-institute/X-Road/blob/6.22.0/doc/README.md) 
 
## Instalación 

Actualmente el código de [X-Road publicado en Github](https://github.com/nordic-institute/X-Road/tree/6.22.0) es administrado por un equipo de desarrolladores de Estonia y Finlandia. Los paquetes oficiales, compilados por el equipo de X-Road, solo están disponibles en Inglés y utilizan la PKI de Finlandia. Sin embargo es posible descargar el código fuente y adecuarlo para usar la PKI de otro país.

### Modificación del país
  La plataforma necesita los servicio de una PKI,  las rutinas de verificación de certificados validan que dentro del sujeto exista el valor C=FI, es decir que el país  de origen sea Finlandia. Para usar la PKI de otro país es necesario definir y agregar la estrucutra de los certificados nacionales de su país a la plataforma [según lo explica esta página](https://confluence.niis.org/pages/viewpage.action?pageId=4293076).  En este repositorio econtrará la estrucutra de los crear cuatro archivos, clases de Java, con las rutinas necesarias para trabajar con los certificados del proveedor PKI de sus país. Para mayores detalles revise las [indicaciones de compilación](compilar/) de la plataforma

### Modificación del idioma

El código fuente de X-Road solo incluye los idiomas Inglés y Finlandés. Se han hecho consultas y no es posible incluir la traducción al Español en el código oficial del proyecto. Para compilar los paquetes incluyendo la traducción al Español puede seguir las instrucciones disponibles en [esta página](compilar/)


### Probar la plataforma
Si desea probar la plataforma sin hacer modificaciones al código puede descargar los paquetes DEB compilados del proyecto TENOLI de El Salvador disponibles desde [esta dirección](http://tenoli.gobiernoelectronico.gob.sv/debs/).  

La instalación está documentada en la [sección instalar](instalar/README.md)

La documentación  del proyecto TENOLI  de El Salvador sobre la publicación y gestión de servicios está disponible en [esta página](http://tenoli.gobiernoelectronico.gob.sv/) 

### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  
