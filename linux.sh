#!/usr/bin/env bash

set -e
set -x

# messy, cause ansible in apt might be ancient
sudo apt-get update
sudo apt-get install -y git build-essential python-virtualenv python-dev

if [ -z "$TEST" ]; then
    git clone https://github.com/tobywf/dotfiles.git ~/.local/share/dotfiles/
    cd ~/.local/share/dotfiles/
fi

# install ansible in a virtualenv, so it's not ancient
virtualenv env
source env/bin/activate
pip install ansible markupsafe
if [ -z "$TEST" ]; then
    ASK_PASS="--ask-become-pass"
else
    ASK_PASS=""
fi
# Use `ANSIBLE_NOCOWS`, because Linux Mint ships with `cowsay` -.-
ANSIBLE_NOCOWS=1 ansible-playbook $ASK_PASS -i inventory linux.yml
