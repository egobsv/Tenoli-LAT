#!/usr/bin/env bash
    timedatectl set-timezone America/El_Salvador;
    useradd -m xroad;
    cp /vagrant/paquetes_ES/*deb /home/xroad/;
    
    ###Para evitar descargar varias veces puede copiar los paquetes
    ###de dependencias y guardarlas en la carpeta de la maquina virtual  
    #cp /vagrant/dependencias/* /var/cache/apt/archives/;
    
    add-apt-repository ppa:nginx/stable;
    add-apt-repository ppa:openjdk-r/ppa;
    apt-get update;

    ##Instalar dependencias de Xroad
    apt-get install --force-yes -y python-iniparse rlwrap ssl-cert authbind ntp crudini libnspr4 dpkg-dev \
            libnss3 libnss3-nssdb libopts25 libossp-uuid16 libpcsclite1 libpq5 libxslt1.1 \
            libnginx-mod-http-echo nginx-common nginx-light java-common ca-certificates-java \
            openjdk-8-jre-headless postgresql postgresql-9.3 postgresql-client-9.3 unzip libmhash2 \
            postgresql-client-common postgresql-common postgresql-contrib postgresql-contrib-9.3;

  ## Crear Repositorio local usando nuestros paquetes DEB
     cd /home/xroad;
     dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz;
     touch /etc/apt/sources.list.d/local.list;
     echo "deb file:/home/xroad ./" >>  touch /etc/apt/sources.list.d/local.list; 
     apt-get update;

   ##Agregar nombres de dominio para Servidor Central, 
   ##Servidores de Seguridad y Autoridad Certificadora
  
   echo "10.0.0.10 sc.tenoli.gob.sv" >> /etc/hosts;
   echo "10.0.0.11 ss1.tenoli.gob.sv" >> /etc/hosts;
   echo "10.0.0.12 ss2.tenoli.gob.sv" >> /etc/hosts;
   echo "10.0.0.13 ac.tenoli.gob.sv" >> /etc/hosts;
   echo "10.0.0.13 ocsp.tenoli.gob.sv" >> /etc/hosts;
   echo "10.0.0.13 tsa.tenoli.gob.sv" >> /etc/hosts;