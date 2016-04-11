#!/usr/bin/env bash

set -e
set -x

if [ -z "$TEST" ]; then
    # deps
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # let's go
    git clone https://github.com/tobywf/dotfiles.git ~/.local/share/dotfiles/
    cd ~/.local/share/dotfiles/
fi
brew install ansible || true
if [ -z "$TEST" ]; then
    ASK_PASS="--ask-become-pass"
else
    ASK_PASS=""
fi
ansible-playbook $ASK_PASS -i inventory osx.yml
