#Servidor de Seguridad basado en Ubuntu-Bionic
#
timedatectl set-timezone America/El_Salvador;
hostnamectl set-hostname ss1.tenoli.gob.sv
useradd -m xroad;
echo 'xroad:xroad' | chpasswd;
cp /vagrant/dependencias/* /var/cache/apt/archives/;
mkdir /opt/tenoli;
cp /vagrant/debs6.22/deb/* /opt/tenoli/;
apt-get update;
apt-get install -y openjdk-8-jre-headless ca-certificates-java ntp unzip expect net-tools \
                   postgresql postgresql-contrib postgresql-client crudini rlwrap \
                   nginx-light curl debconf rlwrap rsyslog unzip libmhash2 authbind;
cd /vagrant/scripts;
debconf-set-selections ss-respuestas.txt;
cd /opt/tenoli;

dpkg -i xroad-base_6.22.0-1.22.0.ubuntu18.04_amd64.deb xroad-jetty9_6.22.0-1.22.0.ubuntu18.04_all.deb \
	 xroad-signer_6.22.0-1.22.0.ubuntu18.04_amd64.deb xroad-nginx_6.22.0-1.22.0.ubuntu18.04_amd64.deb \
         xroad-confclient_6.22.0-1.22.0.ubuntu18.04_amd64.deb;
service postgresql restart;

dpkg -i xroad-proxy_6.22.0-1.22.0.ubuntu18.04_all.deb xroad-monitor_6.22.0-1.22.0.ubuntu18.04_all.deb \
        xroad-opmonitor_6.22.0-1.22.0.ubuntu18.04_all.deb \
        xroad-addon-opmonitoring_6.22.0-1.22.0.ubuntu18.04_all.deb; 

dpkg -i xroad-addon-metaservices_6.22.0-1.22.0.ubuntu18.04_all.deb \
		xroad-addon-messagelog_6.22.0-1.22.0.ubuntu18.04_all.deb \
		xroad-addon-proxymonitor_6.22.0-1.22.0.ubuntu18.04_all.deb \
		xroad-addon-wsdlvalidator_6.22.0-1.22.0.ubuntu18.04_all.deb;

dpkg -i xroad-securityserver_6.22.0-1.22.0.ubuntu18.04_all.deb xroad-autologin_6.22.0-1.22.0.ubuntu18.04_all.deb;
##NUMERO PIN
touch /etc/xroad/autologin;
chown xroad:xroad /etc/xroad/autologin;
echo "1234" >> /etc/xroad/autologin;


echo "10.0.10.10        tenoli.gob.sv" >>/etc/hosts;
echo "10.0.10.13         tsa.gob.sv" >>/etc/hosts;
echo "10.0.10.13         ocsp.gob.sv" >>/etc/hosts;
echo "127.0.0.1         ss1.tenoli.gob.sv" >>/etc/hosts;
