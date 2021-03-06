# vi: set ft=ruby :

# nice and simple
ENV["VAGRANT_DEFAULT_PROVIDER"] = "virtualbox"

Vagrant.configure("2") do |config|
  # local variables for maintainability
  box_name = "gentoo-amd64-stage3-virtualbox.box"
  box_host = "https://dl.dropboxusercontent.com/s/khura7ni0b6thx8"

  # using a gentoo install as the docker host
  config.vm.box     = "gentoo-virtualbox"
  config.vm.box_url = "#{box_host}/#{box_name}"

  # internal ip to avoid needing nat
  config.vm.network :private_network, ip: "192.168.21.3"

  # share a folder to hold projects into the vm
  config.vm.synced_folder "./", "/vagrant",
    type:          "nfs",
    create:        true,
    mount_options: ["vers=3", "udp", "nolock"]

  # use agent forwarding for ssh/git etc
  config.ssh.forward_agent = true

  # provisioner script, using skittle internally
  config.vm.provision :shell,
    privileged: false,
    keep_color: true,
    inline:     "(cd /vagrant && ./skittle vm)"

  # enable the sound card on the vm
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--audio",           "coreaudio",
      "--audiocontroller", "ac97"
    ]
  end
end
