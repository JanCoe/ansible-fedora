This repo contains roles for setting up a Fedora installation.

I start with the Sway Spin and add hyprland from there. In future, investigate doing a minimal netinstall instead, and specifying all the required packages.

The process for installing a new machine is:
- Install Fedora image and reboot.
- Run fedora.sh script in the root directory of this repo.

Remaining manual steps:
- gh auth login
- edit /etc/hosts to reflect IP addresses on network
