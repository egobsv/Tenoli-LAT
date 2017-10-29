
## Instalación usando Paquetes DEB

A continuación se detallan los pasos para instalar los paquetes DEB de la plataforma en un ambiente de prueba con todos sus componentes usando Vagrant. Para acelerar el proceso primero crearemos una máquina virtual base con todas las librerías necesarias. En adelante se asume que una copia de este repositorio esta disponible en la carpeta 'copiaRepo'

**Nota**: La plataforma solo esta disponible para Ubuntu Trusty.


1. Crear Maquina Virtual base 

* Crear carpeta del proyecto, agregar paquetes DEB.

```
mkdir -p tenoli-base/paquetes_ES
cp [RUTA-DEBS]/* tenoli-base/paquetes_ES/
cp copiaRepo/instalar-tenoliBase.sh tenoli/
cd tenoli-base
```

* Crear nueva maquina virtual usando Ubuntu Trusty.

```
vagrant init ubuntu/trusty64
vagrant up

```

* Entrar a la nueva maquina virtual, instalar dependencias/librerías, crear repositorio local, agregar nombres de dominio.

```
vagrant ssh
cd /vagrant
sudo chmod +x instalar-tenoliBase.sh
sudo ./instalar-tenoliBase.sh
```

* Limpiar y reducir tamaño de la maquina 

```
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
```

* Crear nueva maquina (box) de vagrant e instalarla

```
vagrant package --output tenoliBase.box
vagrant box add tenoliBase tenoliBase.box
```

2. Instalar plataforma 

* Crear carpeta del proyecto, copiar archivos. 

```
mkdir -p tenoli/certificados
cp copiaRepo/Vagrantfile tenoli/
cp -r copiaRepo/openssl-ca tenoli/
cp  copiaRepo/sc-respuestas.txt tenoli/
cp  copiaRepo/ss-respuestas.txt tenoli/
```

* Editar las variables de la plataforma, los parámetros del: servidor central dentro de  sc-respuestas.txt, del servidor de seguridad dentro de ss-respuestas.txt, de la autoridad certificadora dentro de init.sh.

```
cd tenoli
nano sc-respuestas.txt
nano ss-respuestas.txt
nano openssl-ca/home/ca/CA/init.sh
```

* Aplicar script de creación de maquinas virtuales (Vagrantfile). Este script usa tenoliBase para crear un servidor central (sc), dos servidores de seguridad (ss1 y ss2) y una autoridad certificadora (ca).

```
vagrant up

```

* Al terminar la instalación la Autoridad Certificadora tendrá activado el servicio de sellado de tiempo disponible en http://10.0.0.13:8899 y el servicio de  OCSP disponible en  http://10.0.0.13:8888. El siguiente paso es obtener certificados de autoridad certificadora, copiarlos a carpeta del proyecto. Estos certificados se usaran durante la configuración de la plataforma. 


```
vagrant ssh ca
cp /home/ca/CA/certs/*pem /vagrant/certificados
exit
vagrant rsync-back
```

Los certificados estarán ahora disponibles en la carpeta tenoli/certifcados, encotrará más detalles en la [guía de la CA de pruebas, capitulo 6](https://github.com/ria-ee/X-Road/blob/develop/ansible/TESTCA.md). Con esto terminamos la instalación de la plataforma. Para iniciar la configuración del servidor central puede hacerlo usando su navegador desde https://10.0.0.10:4000/.

La configuración del Servidor de seguridad puede hacerla usando su navegador desde https://10.0.0.11:4000/.

Actualmente, la documentación de este repositorio solo comprende la instalación de la plataforma. La configuración inicial de la plataforma es parte de la documentación oficial, en la [sección disponible en este enlace](https://github.com/ria-ee/X-Road/blob/develop/doc/Manuals/ig-cs_x-road_6_central_server_installation_guide.md#33-configuring-the-central-server-and-the-management-services-security-server)


  


