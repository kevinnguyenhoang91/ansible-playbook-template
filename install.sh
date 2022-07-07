#!/bin/bash

which brew

if ! which brew; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

if ! which python3; then
    # Install Ansible
    brew install python3
fi

if ! which ansible; then
    # Install Ansible
    pip3 install ansible
fi

pip3 install openshift --user

./ansible-galaxy.sh role install -r ./requirements.yml
./ansible-galaxy.sh collection install -r ./requirements.yml
