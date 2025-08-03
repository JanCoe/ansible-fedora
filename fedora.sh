#!/usr/bin/env bash

set -euo pipefail

ansible_dir="$HOME"/Projects/ansible-fedora_xxx

read -s -r -p "Enter your sudo password: " pwd
echo

printf "==> Installing ansible and git...\n"
echo "$pwd" | sudo -S dnf install -y ansible git

printf "==> Creating directory for ansible-fedora...\n"
mkdir -p "$ansible_dir"

printf "==> Cloning ansible-fedora...\n"
git clone https://github.com/JanCoe/ansible-fedora.git "$ansible_dir"
cd "$ansible_dir"

printf "==> Running playbook...\n"
echo "$pwd" | sudo ansible-playbook fedora.yml --verbose --inventory localhost
