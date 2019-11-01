timedatectl set-timezone America/El_Salvador;
hostnamectl set-hostname ca.tenoli.gob.sv
groupadd ca;
useradd -g ca ocsp;
useradd -g ca ca;
useradd -g ca signer -m -s /bin/bash --system;
echo "signer:signer" | chpasswd; 
apt-get update;
apt-get install -y nginx-light ntp  python-minimal;
cd /vagrant/openssl-ca/;
cp *.service /etc/systemd/system/;
cp -r etc /;
cp -r home /;
cp -r usr /;
chown g+r /home/ca/CA;
chmod +x  /usr/local/bin/*;

cd /home/ca/CA;
chmod +x *sh;
./init.sh;
touch /var/log/ocsp.log;
chown ca:ca /var/log/ocsp.log;
chown -R ca:ca /home/ca/CA;
chmod g+rw /var/log/ocsp.log;

touch /var/log/ocsp.log;
chown ca:ca /var/log/ocsp.log;
chmod 0664 /var/log/ocsp.log;
chmod 0755 /usr/local/bin/sign;
chmod 0755 /usr/local/bin/sign-auth;
chmod 0755 /usr/local/bin/sign-sign;
chmod 0755 /usr/local/bin/ca-revoke;
cd  /home/ca/CA/;

cp  certs/* /var/www/html/;
cp /vagrant/openssl-ca/index.html /var/www/html/;
service ntp restart;
service nginx restart;
service ocsp restart;
service tsa restart;
service ca restart;
systemctl enable ocsp;
systemctl enable tsa;
systemctl enable ca;
