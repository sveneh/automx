# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
  end
  
  config.vm.define 'workstation' do |machine|
      machine.vm.box = "box-cutter/ubuntu1404-desktop"
      machine.vm.network "private_network", ip: "172.17.177.20"

      # NetworkManager borks network configuration, although it is configured not to do so. 
      # this is a hack around it.
      machine.vm.provision "fixup", type: "shell" do |s|
          s.inline = "sudo service network-manager stop && ifdown eth1 && ifup eth1"
      end
  end

  config.vm.define 'controller' do |machine|
      machine.vm.network "private_network", ip: "172.17.177.10"

      machine.vm.provision "bootstrap", type: "shell", path: "./ansible-install.sh"
      machine.vm.provision "ansible", type: "shell" do |s|
          s.env = {"ANSIBLE_CONFIG" => "ansible-vagrant.cfg"}
          s.inline ="cd /vagrant && ansible-playbook -i inventory/vagrant devel.yml -u vagrant"
      end
  end

end
