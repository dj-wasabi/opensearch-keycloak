IMAGE_NAME = "ubuntu/bionic64"
K8S_VERSION = "1.20.2"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    config.vm.define "keycloak" do |keycloak|
      keycloak.vm.box = IMAGE_NAME
      keycloak.vm.network "private_network", ip: "10.10.1.10"
      keycloak.vm.hostname = "keycloak.example.com"
      keycloak.vm.synced_folder "./keycloak", "/opt/resources"
      keycloak.vm.provision "shell", path: "./runme.sh"
      keycloak.vm.network "forwarded_port", guest: 443, host: 443
    end

    # config.vm.define "grafana" do |grafana|
    #   grafana.vm.box = IMAGE_NAME
    #   grafana.vm.network "private_network", ip: "10.10.1.11"
    #   grafana.vm.hostname = "grafana.example.com"
    #   grafana.vm.synced_folder "./grafana", "/opt/resources"
    #   grafana.vm.provision "shell", path: "./runme.sh"
    #   grafana.vm.network "forwarded_port", guest: 3000, host: 3000
    # end

    config.vm.define "opensearch" do |opensearch|
      opensearch.vm.provider "virtualbox" do |v|
        v.memory = 3072
        v.cpus = 2
      end

      opensearch.vm.box = IMAGE_NAME
      opensearch.vm.network "private_network", ip: "10.10.1.12"
      opensearch.vm.hostname = "opensearch.example.com"
      opensearch.vm.synced_folder "./opensearch", "/opt/resources"
      opensearch.vm.provision "shell", path: "./runme.sh"
      opensearch.vm.network "forwarded_port", guest: 5601, host: 5601
    end
end
