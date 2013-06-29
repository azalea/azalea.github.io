---
layout: post
title: Synchronize time in Linux
tags:
- linux
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _wp_old_slug: '1736'
  _efficient_related_posts: a:10:{i:0;a:4:{s:2:"ID";s:3:"252";s:10:"post_title";s:23:"Linux恶意命令大全";s:7:"matches";s:1:"2";s:9:"permalink";s:58:"http://azaleasays.com/2008/03/17/linux-malicious-commands/";}i:1;a:4:{s:2:"ID";s:2:"98";s:10:"post_title";s:18:"查看内核版本";s:7:"matches";s:1:"2";s:9:"permalink";s:48:"http://azaleasays.com/2007/10/05/kernel-version/";}i:2;a:4:{s:2:"ID";s:4:"1693";s:10:"post_title";s:39:"Ubuntu
    + Nvidia显卡实现双显示器";s:7:"matches";s:1:"1";s:9:"permalink";s:66:"http://azaleasays.com/2010/09/03/ubuntu-dual-moditors-with-nvidia/";}i:3;a:4:{s:2:"ID";s:4:"1415";s:10:"post_title";s:40:"Install
    IBM TSM Client on Ubuntu (amd64)";s:7:"matches";s:1:"1";s:9:"permalink";s:72:"http://azaleasays.com/2010/07/15/install-ibm-tsm-client-on-ubuntu-amd64/";}i:4;a:4:{s:2:"ID";s:4:"1400";s:10:"post_title";s:54:"Linux
    Force DHCP client (dhclient) to renew ip address";s:7:"matches";s:1:"1";s:9:"permalink";s:77:"http://azaleasays.com/2010/05/17/linux-force-dhcp-client-to-renew-ip-address/";}i:5;a:4:{s:2:"ID";s:4:"1009";s:10:"post_title";s:29:"Ubuntu9.04安装ibus输入法";s:7:"matches";s:1:"1";s:9:"permalink";s:56:"http://azaleasays.com/2009/06/09/ubuntu904-install-ibus/";}i:6;a:4:{s:2:"ID";s:3:"990";s:10:"post_title";s:4:"Sudo";s:7:"matches";s:1:"1";s:9:"permalink";s:38:"http://azaleasays.com/2009/06/04/sudo/";}i:7;a:4:{s:2:"ID";s:3:"369";s:10:"post_title";s:23:"Linux退回上次目录";s:7:"matches";s:1:"1";s:9:"permalink";s:58:"http://azaleasays.com/2008/06/24/linux-previous-directory/";}i:8;a:4:{s:2:"ID";s:3:"360";s:10:"post_title";s:30:"Ubuntu添加局域网打印机";s:7:"matches";s:1:"1";s:9:"permalink";s:56:"http://azaleasays.com/2008/06/05/ubuntu-add-lan-printer/";}i:9;a:4:{s:2:"ID";s:3:"355";s:10:"post_title";s:36:"Linux下的屏幕录制工具XVidCap";s:7:"matches";s:1:"1";s:9:"permalink";s:67:"http://azaleasays.com/2008/06/05/linux-screencast-software-xvidcap/";}}
  _relation_threshold: '1'
  original_post_id: '1736'
---
ntpdate pool.ntp.org

<a href="http://linux.die.net/man/1/ntpdate" target="_blank">ntpdate</a> sets the local date and time via <a href="http://en.wikipedia.org/wiki/Network_Time_Protocol" target="_blank">NTP</a>.

The command automatically runs at startup. But for a server which rarely reboots, you can manually run it to synchronize the local date and time.
