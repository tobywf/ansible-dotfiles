# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.define "osx" do |osx|
        osx.vm.box = "AndrewDryga/vagrant-box-osx"
        # NFS needs private network to work with VirtualBox
        osx.vm.network "private_network", ip: "192.168.1.100"
        osx.vm.synced_folder ".", "/vagrant",
            id: "core",
            :nfs => true,
            :mount_options => ['nolock,vers=3,udp,noatime'],
            # Mac OS x doesn't use reserved ports, so set "insecure" here
            # not sure why setting resvport on mount options doesn't work
            :linux__nfs_options => [
                'insecure',
                'rw',
                'no_subtree_check',
                'all_squash'
            ]
    end
    config.vm.define "mint" do |mint|
        mint.vm.box = "artem-sidorenko/mint-17.3-cinnamon"
    end
    config.vm.provider "virtualbox" do |v|
        # v.linked_clone = true
        v.gui = true
        # mint box seems to have EHCI on by default -.-
        v.customize [
            "modifyvm", :id,
            "--usb", "on",
            "--usbehci", "off"
        ]
    end
end
