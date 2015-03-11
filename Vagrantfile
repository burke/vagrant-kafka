# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.vm.box = "centos7"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: "scripts/init.sh"

  config.vm.define "kafka" do |s|
    s.vm.hostname = "kafka"
    s.vm.network :private_network, ip: "10.30.3.2"
    s.vm.provision "shell", path: "scripts/zookeeper.sh"
    s.vm.provision "shell", path: "scripts/broker.sh"
  end
end

