# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # config.vm.provider "virtualbox"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  ##### Default VM for general Linux tests
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

  ##### Linux VM with GUI
  config.vm.define "ubuntu-gui" do |ubuntu|
    ubuntu.vm.box = "ubuntu/jammy64"
    ubuntu.vm.box_version = "20240614.0.0"

    # NOTE: comment this line in case you want to install via GitHub later
    ubuntu.vm.synced_folder ".", "/opt/salt-local-dev", automount: false,
      type: "rsync", rsync__auto: true, rsync__exclude: [ 'Saltfile', 'pillar/personal' ]

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

      echo "#################### Salt install"
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
      sudo systemctl disable salt-minion
      sudo systemctl status salt-minion

      # echo "#################### Configure salt-local-dev project via GitHub"
      # git clone https://github.com/rcmoutinho/salt-local-dev.git /opt/salt-local-dev

      echo "#################### DONE"
      sudo shutdown --reboot +2 “Initial setup is now completed. The VM will reboot in 2 minutes!”
    SHELL

    # local files based on the VM needs
    ubuntu.vm.provision "file", source: "./local/Saltfile.local", destination: "/opt/salt-local-dev/Saltfile"
    ubuntu.vm.provision "file", source: "./local/pillar-personal-init.sls", destination: "/opt/salt-local-dev/pillar/personal/init.sls"

    ubuntu.vm.provision "shell", inline: <<-SHELL
      echo "#################### Applying initial Salt minion config"
      sudo salt-call --local --file-root /opt/salt-local-dev/salt --pillar-root /opt/salt-local-dev/pillar state.sls salt.minion
    SHELL
  end
end
