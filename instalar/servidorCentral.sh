#
#Servidor Central basado en Ubuntu-Bionic
#

timedatectl set-timezone America/El_Salvador;
hostnamectl set-hostname sc.tenoli.gob.sv
useradd -m xroad;
echo 'xroad:xroad' | chpasswd;
mkdir /opt/tenoli;

#Sus Paquetes Compilados
cp /vagrant/debs6.22/deb/* /opt/tenoli/;

apt-get update;
apt-get install -y openjdk-8-jre-headless ca-certificates-java ntp unzip expect net-tools \
                   postgresql postgresql-contrib postgresql-client crudini rlwrap \
                   nginx-light curl debconf rlwrap rsyslog unzip libmhash2 authbind;

cd /vagrant/;
debconf-set-selections sc-respuestas.txt;
cd /opt/tenoli;
service ntp restart;

dpkg -i xroad-base_6.22.0-1.local.ubuntu18.04_amd64.deb xroad-jetty9_6.22.0-1.local.ubuntu18.04_all.deb \
xroad-signer_6.22.0-1.local.ubuntu18.04_amd64.deb xroad-nginx_6.22.0-1.local.ubuntu18.04_amd64.deb \
xroad-confclient_6.22.0-1.local.ubuntu18.04_amd64.deb;

dpkg -i xroad-center_6.22.0-1.local.ubuntu18.04_all.deb;
dpkg -i xroad-centralserver_6.22.0-1.local.ubuntu18.04_all.deb \
        xroad-centralserver-monitoring_6.22.0-1.local.ubuntu18.04_all.deb \
        xroad-autologin_6.22.0-1.local.ubuntu18.04_all.deb;

##NUMERO PIN
touch /etc/xroad/autologin;
echo "1234" >> /etc/xroad/autologin;
chown xroad:xroad /etc/xroad/autologin;

echo "10.0.10.10	sc.tenoli.gob.sv" >>/etc/hosts;
echo "10.0.10.13	tsa.gob.sv" >>/etc/hosts;
echo "10.0.10.13	ocsp.gob.sv" >>/etc/hosts;
echo "10.0.10.11	ss1.tenoli.gob.sv" >>/etc/hosts;



