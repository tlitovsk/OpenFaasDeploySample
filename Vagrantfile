$workers=1

$script_for_docker_swarm_master = <<-SCRIPT
docker swarm init --advertise-addr 192.168.50.10
docker swarm join-token -q worker > /vagrant/token
SCRIPT

$script_for_docker_swarm_worker = <<-SCRIPT
docker swarm join --token $(cat /vagrant/token) 192.168.50.10:2377
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.define "swarm-master" do |docker_config|
    docker_config.vm.network "private_network", ip: "192.168.50.10"
    docker_config.vm.host_name = "swarm-master"
    docker_config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    docker_config.vm.provision "ansible", playbook: "machines/bootstrap.yaml"
    docker_config.vm.provision "ansible", playbook: "machines/master.yaml"
    docker_config.vm.provision "shell", inline: $script_for_docker_swarm_master
  end
  
  (1..$workers).each do |i|
    config.vm.define "docker-#{i}" do |docker_config|
      $ip_sub=100+i
      docker_config.vm.network "private_network", ip: "192.168.50.#{$ip_sub}"
      docker_config.vm.host_name = "docker-#{i}"
      docker_config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end
      docker_config.vm.provision "ansible", playbook: "machines/bootstrap.yaml"
      docker_config.vm.provision "ansible", playbook: "machines/worker.yaml"
      docker_config.vm.provision "shell", inline: $script_for_docker_swarm_worker
    end
  end
end




