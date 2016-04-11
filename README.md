Workstation provisioning via Ansible
====================================

These are my private provisioning scripts, which I use to provision my
Macbook and Thinkpad.

Testing with Vagrant
--------------------

The vagrant file boots an OSX and Mint box. Please be aware of the OSX
licence restrictions.

```bash
$ mkdir -p ~/.local/share/; ln -s /vagrant/ ~/.local/share/dotfiles; cd ~/.local/share/dotfiles
$ TEST='yes' ./linux.sh
$ TEST='yes' ./osx.sh
```

Mac OS X (10.9 - 10.11)
-----------------------

```bash
$ curl -L https://raw.githubusercontent.com/tobywf/dotfiles/master/osx.sh | bash
```

Linux (Ubuntu 14.04 and Mint 17.3)
----------------------------------

```bash
$ curl -L https://raw.githubusercontent.com/tobywf/dotfiles/master/linux.sh | bash
```

Misc Commands
-------------

```bash
$ ansible all -i inventory -m setup -a 'filter=ansible_distribution'
$ openssl rand -base64 512 > vault-password.txt
```
