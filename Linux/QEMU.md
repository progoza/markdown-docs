# QEMU

based on Chris Titus Tech article: https://christitus.com/vm-setup-in-linux/ and arch wiki: https://wiki.archlinux.org/title/QEMU 

Install: 
 - qemu-full
 - libvirt
 - dnsmasq

## Start libvirt service:

```
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
```


## Start default network

```
sudo virsh net-start default
sudo virsh net-autostart default
```

## Allow access to VMs to user

```
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER
```

## install GUI

```
sudo pacman -S virt-manager 
```

## install TPM simulator (for Win 11)

```
sudo pacman -S swtpm
```

To install Win11:
- in overview section, UEFI (not BIOS) needs to be selected
- emulated TPM module needs to be added in virtual machine settings
- for best performance, it is recommended to use hdd pass-throuh

## optimizing windows 

To install guest additions for Windows:
- on VM you can open https://github.com/virtio-win/virtio-win-pkg-scripts and install an exe file from there.

Next, shut down the VM and:
 - add a new device in VM settings: Add Hardware -> Channel, Select org.qemu.guest_agent.0 and check "Auto socket".
 - change video driver to 'virtio' wih 3d acceleration, additionally to make 3d accelearation work in "Display spice", the "Listen type" option needs to be set to none and "OpenGL" option checked.
 - change processor topology, by default virt-manager simulates n sockets, but consumer wndows (home, pro) support only up to 2 sockets. Therefore it is better to set socet to 1 and bump up the cores number instead.

## Creating bridged vetwork (to avoid NAT-ting)

First create a bridge:

```shell
sudo ip link add br0 type bridge
```

to verify if ir was created successfully, we can run:

```shell
sudo ip link show type bridge
```

Next, a physical ethernet needs to be added to the bridge. But it cannot be the main ethernet interface (otherwise connectivity will be lost)