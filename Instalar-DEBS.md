
## Instalación usando Paquetes DEB

A continuación se detallan los pasos para instalar los paquetes DEB de la plataforma en un ambiente de prueba con todos sus componentes usando Vagrant. Para acelerar el proceso primero crearemos una máquina virtual base con todas las librerías necesarias. En adelante se asume que una copia de este repositorio esta disponible en la carpeta 'copiaRepo'

*Nota: La plataforma solo esta disponible para Ubuntu Trusty.


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
mkdir tenoli
cp copiaRepo/Vagrantfile tenoli/
cp -r copiaRepo/openssl-ca tenoli/
cp  copiaRepo/sc-respuestas.txt tenoli/
cp  copiaRepo/ss-respuestas.txt tenoli/
```

* Editar las variables de la plataforma, los parámetros del: servidor central dentro de  sc-respuestas.txt, del servidor de seguridad dentro de ss-respuestas.txt, de la autoridad certificadora dentro de init.sh.

``
cd tenoli
nano sc-respuestas.txt
nano ss-respuestas.txt
nano openssl-ca/home/ca/CA/init.sh
```

* Aplicar script de creación de maquinas virtuales (Vagrantfile). Este script usa tenoliBase para crear un servidor central (sc), dos servidores de seguridad (ss1 y ss2) y una autoridad certificadora (ca).

```
vagrant up

```
