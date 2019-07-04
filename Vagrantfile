# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Base Box
  config.vm.box = "ubuntu/trusty64"

  # Hostname and networking
  config.vm.hostname = "vlp.test"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.hostsupdater.remove_on_suspend = true
  config.vm.provision :shell, :path => "bootstrap.sh"

  # Synced folder
  config.vm.synced_folder "www/", "/var/www/html"
end
