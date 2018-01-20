#
#Servidor Central basado en Ubuntu-Xenial
#
timedatectl set-timezone America/El_Salvador;
useradd -m xroad;
echo 'xroad:xroad' | chpasswd;
cp /vagrant/dependencias/* /var/cache/apt/archives/;
apt-get update;
apt-get install -y openjdk-8-jre-headless ca-certificates-java crudini rlwrap ntp authbind unzip;
apt-get install -y nginx-light postgresql postgresql-contrib postgresql-9.5 postgresql-client-9.5 libmhash2;
cd /vagrant/scripts;
debconf-set-selections sc-respuestas.txt;

dpkg -i debs/xroad-common_6.16.0-1_amd64.deb debs/xroad-jetty9_6.16.0-1_all.deb;
cp jetty.conf /etc/xroad/services/;
cp xroad-jetty.service /etc/systemd/system/;
cp xroad-jetty9 /usr/bin/; 
chmod +x /usr/bin/xroad-jetty9;
systemctl enable xroad-jetty.service;
systemctl start xroad-jetty.service;

cp xroad-signer /usr/share/xroad/bin;
chmod +x /usr/share/xroad/bin/xroad-signer;
cp xroad-signer.service /etc/systemd/system/;
systemctl enable xroad-signer.service;
systemctl start xroad-signer.service;

#dpkg -i debs/xroad-center-XENIAL-6.16.deb;
dpkg -i debs/xroad-center_6.16.0-1_all.deb;

cp xroad-confclient /usr/share/xroad/bin;
chmod +x /usr/share/xroad/bin/xroad-confclient;
cp xroad-confclient.service /etc/systemd/system/;
systemctl enable xroad-confclient.service;

dpkg -i debs/xroad-centralserver-monitoring_6.16.0-1_all.deb debs/xroad-centralserver_6.16.0-1_all.deb;
systemctl start xroad-confclient.service;
