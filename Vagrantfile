# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "eFriends"

  config.vm.network 'forwarded_port', guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.11"

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '1024'
  end

  config.vm.provision "ansible" do |ansible|
        ansible.playbook = "site.yml"
  end
end
