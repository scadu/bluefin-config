#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

# systemctl enable podman.socket

### add 1password
chmod +x /tmp/1password.sh && \
  GID_ONEPASSWORD=1500 \
  GID_ONEPASSWORDCLI=1600 \
  /tmp/1password.sh

### activate brcmfmac module on boot
# workaround for broadcom-wl shenanigans in bluefin and aurora
# https://github.com/ublue-os/bluefin/issues/1783#issuecomment-2546018436
touch /usr/lib/{NetworkManager/conf.d/90-broadcom-wl.conf,modprobe.d/broadcom-wl-blacklist.conf}