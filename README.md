## REBIND-DEVICES
[![AUR](https://img.shields.io/aur/version/rebind-devices)](https://aur.archlinux.org/packages/rebind-devices/)

This is a simple Linux service to automatically reset one or more
devices whenever your system resumes from sleep. The devices are
specified as [sysfs](https://man7.org/linux/man-pages/man5/sysfs.5.html)
BUS ID paths in the configuration file `/etc/rebind-devices.conf`. It
works by writing the BUS ID of the device to the [unbind and bind
files](https://lwn.net/Articles/143397/) pertaining to the associated
device driver. Use `lspci`, `lsusb -v`, etc to find the BUS ID path of a
device you want to reset, so you can add that BUS ID to your
configuration file. Your system must be using
[systemd](https://www.freedesktop.org/wiki/Software/systemd/).

I use it to reset the USB controller on my external dock whenever my
system resumes, to fix a faulty USB keyboard that otherwise does not
restore. I used `lspci | grep USB` to determine it's BUS ID.

The latest version and documentation for this utility is available at
https://github.com/bulletmark/rebind-devices.

## INSTALLATION

Arch Linux users can install [rebind-devices from the
AUR](https://aur.archlinux.org/packages/rebind-devices/) and just follow
the CONFIGURATION, ENABLE, and LOGGING sections below.

Other users should do the following to install from the source repository.

    git clone http://github.com/bulletmark/rebind-devices
    cd rebind-devices
    sudo ./rebind-devices-setup install

## CONFIGURATION

    sudo cp /usr/share/rebind-devices/rebind-devices.conf /etc/

    # Add the devices you want to rebind:
    sudoedit /etc/rebind-devices.conf

## ENABLE

    sudo systemctl enable rebind-devices

## LOGGING

    journalctl -u rebind-devices

## UPGRADE

    # cd to source dir
    cd rebind-devices
    git pull
    sudo ./rebind-devices-setup install
    sudo systemctl restart rebind-devices

## DISABLE

    sudo systemctl disable rebind-devices

## UNINSTALL

    # cd to source dir
    cd rebind-devices

    sudo ./rebind-devices-setup uninstall
    sudo rm /etc/rebind-devices.conf

## LICENSE

Copyright (C) 2021 Mark Blakeney. This program is distributed under the
terms of the GNU General Public License.

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later
version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License at <http://www.gnu.org/licenses/> for more details.

<!-- vim: se ai syn=markdown: -->
