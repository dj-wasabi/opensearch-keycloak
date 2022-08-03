sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker restart
sudo sed -i '/example.com/d' /etc/hosts
echo "10.10.1.10 keycloak.example.com" | sudo tee -a /etc/hosts
echo "10.10.1.11 grafana.example.com" | sudo tee -a /etc/hosts
echo "10.10.1.12 opensearch.example.com" | sudo tee -a /etc/hosts
sudo sysctl -w vm.max_map_count=262144

sudo usermod -aG docker vagrant
