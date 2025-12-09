# -*- mode: ruby -*-
# vi: set ft=ruby :

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
    machine.vm.provision 'shell', path: 'scripts/kubeconfig.sh'
  end
end
