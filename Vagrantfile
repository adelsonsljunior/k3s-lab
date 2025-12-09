# -*- mode: ruby -*-
# vi: set ft=ruby :

WORKERS = 2

Vagrant.configure("2") do |config|
  
  config.vm.define 'master' do |machine|
    machine.vm.box = "debian/bookworm64"
    machine.vm.hostname = "master"
    machine.vm.network "private_network", ip: "192.168.56.10"

    machine.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    machine.vm.provision 'shell', path: 'scripts/master.sh'
  end

  (1..WORKERS).each do |i|
    config.vm.define "worker#{i}" do |machine|
      machine.vm.box = "debian/bookworm64"
      machine.vm.hostname = "worker#{i}"

      ip = "192.168.56.2#{i}"
      machine.vm.network "private_network", ip: ip 

      machine.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end

      machine.vm.provision 'shell', 
        path: 'scripts/worker.sh', 
        env: { "NODE_IP" => ip }
    end
  end
end
