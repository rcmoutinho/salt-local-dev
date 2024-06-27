# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # config.vm.provider "virtualbox"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2204"
    ubuntu.vm.box_version = "4.3.12"

    ubuntu.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu"
      vb.memory = 2048
      vb.cpus = 4
    end

    ubuntu.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y
    SHELL
  end

  config.vm.define "ubuntu-gui" do |ubuntu|
    ubuntu.vm.box = "ubuntu/jammy64"
    ubuntu.vm.box_version = "20240614.0.0"
    ubuntu.vm.synced_folder ".", "/opt/salt-local-dev", automount: true

    ubuntu.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu-gui"
      vb.memory = 2048
      vb.cpus = 4
      vb.gui = true

      # https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/configuration
      vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
      vb.customize ['modifyvm', :id, '--vram', '16']
      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    end

    ubuntu.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y

      echo "#################### Ubuntu GUI"
      sudo apt-get install -y ubuntu-desktop

      echo "#################### SALT"
      wget -O /tmp/bootstrap-salt.sh https://bootstrap.saltproject.io
      test $(sha256sum /tmp/bootstrap-salt.sh | awk '{print $1}') \
      = $(wget -qO- https://bootstrap.saltproject.io/sha256) \
      && echo "OK" || echo "File does not match checksum"

      # install salt
      ## -P : Allow pip based installations
      ## -X : Do not start daemons after installation (to favor our masterless approach)
      sudo sh /tmp/bootstrap-salt.sh -X -P stable 3006.8

      # For Debian distros, like Ubuntu, we will need to manually stop the service
      sudo systemctl stop salt-minion
      sudo systemctl status salt-minion

      echo "#################### DONE"
      sudo shutdown --reboot +1 “Initial setup is now completed. The VM will reboot in 1 minute!”
    SHELL
  end
end
