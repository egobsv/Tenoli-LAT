#Servidor de Seguridad basado en Ubuntu-Xenial
#
timedatectl set-timezone America/El_Salvador;
useradd -m xroad;
echo 'xroad:xroad' | chpasswd;
cp /vagrant/dependencias/* /var/cache/apt/archives/;
apt-get update;
apt-get install -y openjdk-8-jre-headless ca-certificates-java crudini rlwrap ntp unzip expect authbind;
apt-get install -y nginx-light postgresql postgresql-contrib postgresql-client libmhash2;
cd /vagrant/scripts;
debconf-set-selections ss-respuestas.txt;

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
cp xroad-confclient /usr/share/xroad/bin;
chmod +x /usr/share/xroad/bin/xroad-confclient;
cp xroad-confclient.service /etc/systemd/system/;
systemctl enable xroad-signer.service;
systemctl enable xroad-confclient.service;
systemctl start xroad-confclient.service;
systemctl start xroad-signer.service;

cp xroad-proxy-port-redirect.sh /usr/share/xroad/scripts/;
cp xroad-proxy /usr/share/xroad/bin/;
cp xroad-monitor /usr/share/xroad/bin/;
cp xroad-opmonitor /usr/share/xroad/bin/;
mkdir -p /usr/share/xroad/autologin/;
cp xroad-autologin-retry.sh /usr/share/xroad/autologin/;
chmod +x /usr/share/xroad/scripts/xroad-proxy-port-redirect.sh \
/usr/share/xroad/bin/xroad-proxy /usr/share/xroad/bin/xroad-monitor \
/usr/share/xroad/bin/xroad-opmonitor /usr/share/xroad/autologin/xroad-autologin-retry.sh;
cp xroad-proxy.service /etc/systemd/system/;
cp xroad-monitor.service /etc/systemd/system/;
cp xroad-opmonitor.service /etc/systemd/system/;
cp xroad-autologin.service /etc/systemd/system/;
systemctl enable xroad-proxy.service;
systemctl enable xroad-monitor.service;
systemctl enable xroad-opmonitor.service;

dpkg -i --force-confnew debs/xroad-proxy_6.16.0-1_all.deb debs/xroad-addon-wsdlvalidator_6.16.0-1_all.deb;
dpkg -i debs/xroad-monitor_6.16.0-1_all.deb  debs/xroad-opmonitor_6.16.0-1_all.deb debs/xroad-addon-proxymonitor_6.16.0-1_all.deb; 
dpkg -i debs/xroad-addon-messagelog_6.16.0-1_all.deb debs/xroad-addon-metaservices_6.16.0-1_all.deb;
dpkg -i debs/xroad-securityserver_6.16.0-1_all.deb debs/xroad-autologin_6.16.0-1_all.deb;

touch /etc/xroad/autologin;
chown xroad:xroad /etc/xroad/autologin;
systemctl start xroad-proxy.service;
systemctl start xroad-monitor.service;
systemctl start xroad-opmonitor.service;

###OPCIONAL 
# Al reiniciar el servidor es necesario ingresar el PIN del SoftToken
# para poder pocesar peticiones, este paquete automaiza esa funcion.

##NUMERO PIN 
#echo "12345" >> /etc/xroad/autologin;
#systemctl enable xroad-autologin.service;
#systemctl start xroad-autologin.service;
