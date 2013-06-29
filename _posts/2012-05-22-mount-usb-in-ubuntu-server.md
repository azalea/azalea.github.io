---
layout: post
title: Mount USB in Ubuntu Server
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _oembed_1d530d0a3bb78d782ea2f0d89842af7b: '{{unknown}}'
  _oembed_c48301e14c2b60b8d9a26144975cb6e4: '{{unknown}}'
  _oembed_1ca42f2a5171fcb1b130ac44fa23bd99: '{{unknown}}'
  _oembed_5a5dcf3080f205003c800be91df75648: '{{unknown}}'
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

&nbsp;</blockquote>
References:

https://help.ubuntu.com/community/Mount/USB

http://askubuntu.com/questions/90976/usb-drive-not-mounting

&nbsp;
