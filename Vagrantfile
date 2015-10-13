# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"

  # we just want to copy the dotfiles to their correct location,
  # install.sh isn't intended to provision VMs, but be run on
  # dev machines (laptops and so on) to set up the environment
  # correctly
  config.vm.provision :shell, privileged: false, inline: <<-SCRIPT
    cd /vagrant
    mkdir ~/Code
    cp -R . ~/dotfiles
  SCRIPT

end
