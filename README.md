## Tenoli-LAT 

Plataforma de interoperabilidad distribuida usando firma electrónica. Este repositorio contiene la documentación para facilitar la implementación de esta plataforma, basada en [X-Road](https://github.com/ria-ee/X-Road/) de Estonia, en Latinoamérica y el Caribe.  La plataforma aplica los siguientes estándares:

* PKI - Perfil de certificado de identidad/autorización IETF RFC-5280
* OCSP - Verificación de Certificados IETF RFC 6960 y RFC 2560.
* TSA - Sellado electrónico de mensajes  IETF RFC 3161.
* XaDES - Firma de mensajes electrónicos ETSI EN 319 132
* eIDAS - Gestión segura de certificados ETSI EN 419 211 (UNE-EN 419211-1:2016)
* ASiCE - Contenedores firmados y sellados electrónicamente ETSI EN 319 162 

## Sobre la plataforma
La plataforma tiene tres componentes principales:

1- Un servidor Central encargado registrar miembros en la red de intercambio seguro de datos y de mantener un catalogo de los servicios disponibles.

2-Uno o más servidores de seguridad instalados en cada institución participante que actúa como pasarela de conexión con la red de intercambio.

3-Una autoridad de certificación y sellado de tiempo encargada de emitir certificados y validar los certificados de identidad y firma en cada transacción realizada en la plataforma. 

El archivo Vagrantfile de este repositorio instala automáticamente un servidor central, una autoridad certificadora y dos servidores de seguridad usando maquinas virtuales. 

**Nota**: La instalación inicial usa OpenSSL como Autoridad Certificadora para hacer pruebas. Para usar la plataforma en producción se recomienda usar un proveedor comercial o una Autoridad Certificadora interna más robusta. Como ejemplo, [puede usar EJBCA](https://github.com/egobsv/certificadora). 

Actualmente, la documentación de este repositorio solo comprende la instalación de la plataforma. La configuración de la plataforma está disponible en la sección Manuales de la [documentación de X-Road](https://github.com/ria-ee/X-Road/blob/develop/doc/README.md) 
 
## Instalación 

### Instalar versión en Inglés

Los paquetes oficiales, compilados por el equipo de X-Road, solo están disponibles en Inglés, un resumen de la instalación de prueba usando Ansible y el repositorio oficial del proyecto [está disponible en este enlace](https://github.com/ria-ee/X-Road/blob/develop/ansible/README.md). La instalación solo esta disponible para Ubuntu-Trusty.

### Instalar versión en Español

La traducción al Español no está incluida en el código oficial del proyecto. Para usar la plataforma en idioma Español existen dos opciones:

OPCIÓN 1. Descargar paquetes compilados que incluyen la traducción al Español desde [esta dirección](http://tenoli.gobiernoelectronico.gob.sv/debs/). 


La instalación de los paquetes DEB está documentada para:

[Instalar en Ubuntu-Trusty](ubuntu-trusty/README.md)

[Instalar en Ubuntu-Xenial](ubuntu-trusty/README.md)

OPCIÓN 2. Compilar los paquetes incluyendo la traducción al Español. Puede seguir las instrucciones disponibles en [esta página](compilar/README.md)


### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  