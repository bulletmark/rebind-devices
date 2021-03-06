## REBIND-DEVICES

This is a simple Linux service to automatically reset one or more
devices whenever your system resumes from sleep. The devices are
specified as [sysfs](https://man7.org/linux/man-pages/man5/sysfs.5.html)
BUS ID paths in the configuration file `/etc/rebind-devices.conf`. It
works by writing the BUS ID of the device to the [unbind and bind
files](https://lwn.net/Articles/143397/) pertaining to the associated
device driver. Your system must be using
[systemd](https://www.freedesktop.org/wiki/Software/systemd/).

I use it to reset the USB controller on my external dock whenever my
system resumes, to fix a faulty USB keyboard that otherwise does not
restore.

### INSTALLATION

Arch Linux users can install [rebind-devices from the
AUR](https://aur.archlinux.org/packages/rebind-devices/).
Alternatively, do the following to install from the source repository.

    git clone http://github.com/bulletmark/rebind-devices
    cd rebind-devices
    sudo ./rebind-devices-setup install

### CONFIGURATION

    sudo cp /usr/share/rebind-devices/rebind-devices.conf /etc/
    sudo vim /etc/rebind-devices.conf # Add the devices you want to rebind
    sudo systemctl enable rebind-devices

### UPGRADE

    cd rebind-devices  # Source dir, as above
    git pull
    sudo ./rebind-devices-setup install

### UNINSTALL

    sudo systemctl disable rebind-devices
    cd rebind-devices  # Source dir, as above
    sudo ./rebind-devices-setup uninstall
    sudo rm /etc/rebind-devices.conf

### LOGGING

    journalctl -u rebind-devices

### LICENSE

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
