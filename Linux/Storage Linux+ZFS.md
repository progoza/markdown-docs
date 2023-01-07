
# Building storage system on VirtualBox with Debian and ZFS


## Prepare 3 HDDs

On the host I connected 3 separate physical 2TB HDDs

On each disk I created a virtual disk file, with static size (not dynamically growing). I prefered to use VMDK because they can be resized (VDI with static size still does not support resizing). 

Note: when you create VMDK files in VBox GUI it says there is a limit of 2TB for virtual disk file, but according to articles VMDK can be resized to bigger file with cmdline (but I didn't check it) 

## Install Linux

I installed Linux Debian stable - with no GUI. Ubuntu Server or whatever headless (no-gui) distro should also be ok.  I prefere Debian, because it is familiar for me and I can easily tailor it to y needs. 

It is necessary to add the _contrib_ section to your [apt sources](https://wiki.debian.org/SourcesList) configuration to be able to get the packages. Also, it is recommended by to install ZFS related packages from [Backports](https://wiki.debian.org/Backports) archive. Upstream stable patches will be tracked and compatibility is always maintained. 

 ```
/etc/apt/sources.list:

deb http://deb.debian.org/debian $codename-backports main contrib non-free
```

When configured, use following commands to install the packages:

```
sudo apt install linux-headers-amd64
sudo apt install -t bullseye-backports zfsutils-linux
```

## Creating the Pool

- In ZFS, device names with path/id are typically used to identify a disk, because the device names like _/dev/sdX_ may change. These names can be retrieved with: 
  `ls -l /dev/disk/by-id/` or `ls -l /dev/disk/by-path/` 
- I created raidz1 pool (similar to raid-5, used for ≥ 3 disks, 1 disk redundancy) with name "tank"; scsi-35000... are these disks names

```
zpool create tank raidz scsi-35000cca2735cbc38 scsi-35000cca266cc4b3c scsi-35000cca26c108480
```

## Provisioning file systems or volume

-   provision a file system named _data_ under pool _tank_, and have it mounted on _/data_

```
mkdir -p /data
zfs create -o mountpoint=/data tank/data
```

Materials about ZFS read from: https://wiki.debian.org/ZFS

## Check the status of the pool

```
sudo zpool status -v
```

## Extend the pool after enlarging the disks:

When the VMDK is enlarged, then we can easily enlarge to pool, by running these cmds:

```
sudo zpool online -e tank ata-VBOX_HARDDISK_VBa288ce90-d1584da7
sudo zpool online -e tank ata-VBOX_HARDDISK_VB2f467c09-3d9d3979
sudo zpool online -e tank ata-VBOX_HARDDISK_VB6b9a24dc-fb2db03b
```

## Install samba

TBD

## Install and configure dlna

TBD
