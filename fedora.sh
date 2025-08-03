#!/usr/bin/env bash

set -euo pipefail

read -s -r -p "Enter your sudo password: " pwd
echo

printf "==> Installing ansible and git...\n"
echo "$pwd" | sudo -S dnf install -y ansible git

printf "==> Creating directory for ansible-fedora...\n"
mkdir -p "$HOME"/Projects/ansible-fedora

printf "==> Cloning ansible-fedora...\n"
git clone https://github.com/JanCoe/ansible-fedora.git "$HOME"/Projects/ansible-fedora
cd "$HOME"/Projects/ansible-fedora

printf "==> Running playbook...\n"
echo "$pwd" | sudo ansible-playbook fedora.yml --verbose --inventory localhost
