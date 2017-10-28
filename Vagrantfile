Vagrant.configure("2") do |config|

  config.vm.define "sc" do |sc|
  sc.vm.box = "tenoliBase"
  sc.vm.hostname="centralserver"
  sc.vm.network "private_network", ip: "10.0.0.10"
  sc.vm.provision "shell", type: "shell", inline: <<-SHELL
  	echo 'xroad:xroad' | chpasswd;
        hostname sc;
  	debconf-set-selections /vagrant/sc-respuestas.txt;
        apt-get install --force-yes -y xroad-centralserver;
     SHELL
  end

  config.vm.define "ss1" do |ss1|
  ss1.vm.box = "tenoliBase"
  ss1.vm.hostname="tenoli1"
  ss1.vm.network "private_network", ip: "10.0.0.11"
  ss1.vm.provision "shell", type: "shell", inline: <<-SHELL
     echo 'xroad:xroad' | chpasswd;
     hostname ss1;
     debconf-set-selections /vagrant/ss-respuestas.txt;
     apt-get install --force-yes -y xroad-securityserver;
    SHELL
  end

  config.vm.define "ss2" do |ss2|
  ss2.vm.box = "tenoliBase"
  ss2.vm.hostname="tenoli2"
  ss2.vm.network "private_network", ip: "10.0.0.12"
  ss2.vm.provision "shell", type: "shell", inline: <<-SHELL
     echo 'xroad:xroad' | chpasswd;
     hostname ss2;
     debconf-set-selections /vagrant/ss-respuestas.txt
     apt-get install --force-yes -y xroad-securityserver;
   SHELL
  end

  config.vm.define "ca" do |ca|
  ca.vm.box = "ubuntu/trusty64"
  ca.vm.hostname="certificadora"
  ca.vm.network "private_network", ip: "10.0.0.13"
  ca.vm.provision "shell", inline: <<-SHELL
     hostname ca;
     apt-get install -y nginx-light;
     cd /vagrant/openssl-ca; chmod +x instalar-ca.sh;
     ./instalar-ca.sh;
   SHELL
  end
end