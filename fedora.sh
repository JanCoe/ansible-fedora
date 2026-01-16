#!/usr/bin/env bash

set -euo pipefail

directory="$HOME"/Projects/ansible-fedora
playbook=$1
command=(ansible-playbook -K -u "$USER" "$playbook")

echo "==> Installing ansible and git..."
sudo -v
sudo dnf install -y ansible git

if [[ ! -d "$directory" ]]; then
    echo "==> Cloning ansible-fedora..."
    mkdir -p "$directory"
    git clone https://github.com/JanCoe/ansible-fedora.git "$directory"
fi

cd "$directory"

read -r -p "Run playbook in check mode? [Y/n]" ans
ans=${ans:-yes}
case "$ans" in
    [yY][eE][sS]|[yY])
        command_check=("${command[@]}" --check)
        "${command_check[@]}" ;;
esac

read -r -p "Run playbook for real? [Y/n]" ans
ans=${ans:-yes}
case "$ans" in 
    [yY][eE][sS]|[yY])
        "${command[@]}" ;;
    *)
        echo "Exiting without running playbook." ;;
esac
