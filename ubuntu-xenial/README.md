
## Instalar Plataforma usando Ubuntu Xenial

Los paquetes oficiales de X-Road solo pueden ser instalados en Ubuntu Trusty. Para usar Xenial necesita [compilar la plataforma](https://github.com/egobsv/Tenoli-LAT/tree/master/compilar) y modificar sus dependencias. Opcionalmente puede  [descargar los paquetes DEB](http://tenoli.gobiernoelectronico.gob.sv/debs/) de TENOLI - El Salvador que ya incluyen estos cambios. 

### Cuál es la diferencia entre Trusty y Xenial?

Los paquetes de Xroad se ejecutan como servicios dentro del servidor. Estos servicios están configurados usando Upstart en Trusty. Xenial usa SystemD en lugar de Upstart. Por ahora es necesario configurar los servicios manualmente (los cambios podrían compilarse dentro de los paquetes, si alguien tiene tiempo de hacerlo sera bienvenido!). 
 

### Instalación de Servidor
En una nueva instalación de Ubuntu Xenial, descargue la carpeta ubuntu-xenial de este repositorio y cópiela en la carpeta /opt. Dentro de la carpeta scripts, edite los archivos de respuestas (sc-respuestas.txt y ss-respuestas.txt) que contienen los valores que se usan en la instalación. Copie los paquetes .DEB dentro de /opt/debs y luego, con privilegios de Administrador/Root, ejecute los siguientes comandos:

- Para instalar el servidor central
```
chmod +x servidorCentral.sh
./servidorCentral.sh
```

- Para instalar el servidor de seguridad
```
chmod +x servidorSeguridad.sh
./servidorSeguridad.sh
```

### Instalación usando Vagrant

El archivo Vagrantfile de esta carpeta instala los paquetes DEB de la plataforma en un ambiente de prueba con todos sus componentes usando Vagrant y Ubuntu Xenial. El script de Vagrant instala automáticamente un servidor central, una autoridad certificadora y dos servidores de seguridad usando maquinas virtuales.

### Licencia

Este trabajo esta cubierto dentro de la estrategia de desarrollo de servicios de Gobierno Electrónico del Gobierno de El Salvador y como tal es una obra de valor público sujeto a los lineamientos de la Política de Datos Abiertos y la licencia [CC-BY-SA](https://creativecommons.org/licenses/by-sa/3.0/deed.es).  
