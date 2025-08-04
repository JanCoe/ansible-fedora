#!/usr/bin/env bash

set -euo pipefail

ansible_dir="$HOME"/ansible
ansible_command="ansible-playbook fedora.yml --verbose" 

read -s -r -p "Enter your sudo password: " password
echo

echo "==> Installing ansible and git..."
echo "$password" | sudo -S dnf install -y ansible git

echo "==> Creating directory for ansible-fedora..."
mkdir -p "$ansible_dir"

echo "==> Cloning ansible-fedora..."
git clone https://github.com/JanCoe/ansible-fedora.git "$ansible_dir"
cd "$ansible_dir"

echo "==> Running playbook..."
echo "$password" | sudo -S "$ansible_command" --check

read -r -p "Run again for real (not in check mode)? [Y/n]" ans
ans=${ans:-yes}
case "$ans" in 
    [yY][eE][sS]|[yY])
        echo "$password" | sudo -S "$ansible_command" ;;
    *)
        echo "Exit without running playbook" ;;
esac
