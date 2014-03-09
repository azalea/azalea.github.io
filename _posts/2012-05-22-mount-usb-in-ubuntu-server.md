---
layout: post
title: Mount USB in Ubuntu Server
tags:
- ubuntu
language: en
---
By default, USB drive does not automount in Ubuntu Server Edition.

You can either install "usb-mount", or mount it manually (see below).

Get the information (what is the device, e.g. /dev/sdb1):
<blockquote>sudo fdisk -l</blockquote>
Create mount point:
<blockquote>sudo mkdir /media/external</blockquote>
Mount the drive:
<blockquote>sudo mount -t vfat /dev/sdb1 /media/external</blockquote>
Here -t is the filesystem type. Most flash drives are FAT16 or FAT32.

Unmount the drive:

Either:
<blockquote>sudo umount /dev/sdb1</blockquote>
Or:
<blockquote>sudo umount /media/external

 </blockquote>
References:

https://help.ubuntu.com/community/Mount/USB

http://askubuntu.com/questions/90976/usb-drive-not-mounting

 
