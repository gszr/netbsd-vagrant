# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "gszr/netbsd-8.0"
  config.ssh.shell = "sh"

  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder ".", "/work", type: "nfs"

  memory = ENV["NETBSD_MEMORY"] || 4096
  cpus = ENV["NETBSD_CPU"] || 8

  config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
      vb.memory = memory
      vb.cpus = cpus
  end

  config.vm.provision "shell", path: "provision.sh",
    env: {"NETBSD_PACKAGES": ENV["NETBSD_PACKAGES"],
          "NETBSD_NO_PACKAGES": ENV["NETBSD_NO_PACKAGES"]}
end
