This repo contains roles for setting up a Fedora installation.

I start with the Sway Spin and add hyprland from there. In future, investigate doing a minimal netinstall instead, and specifying all the required packages.

The process for installing a new machine is:
- Install Fedora image from USB, run liveinst and reboot.
- Set up internet connection (ethernet or wifi).
- Run fedora.sh script (run chmod +x on it if necessary) that is located in the root directory of this repo with an argument for the playbook to use e.g.
~~~shell
./fedora.sh fedora.yml  # full hyprland set-up with development tools and applications
./fedora.sh server.yml  # cut down for server set-up
~~~

Pre-steps:
- Set up .smbcredentials file in home directory for NAS automounting

Post-steps:
- tailscale up (because it requires authentication)
- gh auth login (because it requires authentication)
- Edit /etc/hosts to reflect IP addresses on network
- Log into Obsidian and connect to vault (themes are stored inside vault)
- Set Vivaldi theme
