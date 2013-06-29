---
layout: post
title: Gaim Internet Messenger2.0.0beta4安装方法
tags:
- linux
- ubuntu
status: publish
type: post
published: true
meta:
  _oembed_4b1aa82387ec38890899097a39f3f45b: '{{unknown}}'
  _oembed_2b928f0d028409c74c0dd67f373b5183: '{{unknown}}'
  _oembed_39491a38bd9f96e2e1cf5eabee14a50c: '{{unknown}}'
  views: '570'
  _wp_old_slug: gaim-internet-messenger200beta4%e5%ae%89%e8%a3%85%e6%96%b9%e6%b3%95
  _oembed_360fdf7b0a85cea2d99408b070a3de7b: '{{unknown}}'
  _oembed_577134f458086bb8241993ed067d6a40: '{{unknown}}'
  _oembed_20b493b82b7ef4c897e55f8fcad20650: '{{unknown}}'
  _oembed_22b81adf572127df3eecbfe12e376f94: '{{unknown}}'
  _oembed_9b6bb630a8b35893cbef43de1c2c444a: '{{unknown}}'
  _oembed_c66439408b6a27b754fda76f7ec49b7d: '{{unknown}}'
  _oembed_1ea8b49a1465e394bf78ec5959fdf623: '{{unknown}}'
---
先去包子铺下载gaim-2.0.0beta4解压缩后 进入此文件夹

./configure

提示C compiler cannot create executables

于是

sudo apt-get install gcc libc6-dev

又提示You must have the GLib 2.0 development headers installed to build Gaim.

于是

sudo apt-get install libglib2.0-dev

仍然提示GTK+ 2.0 is required to build Gaim

于是

sudo apt-get install libgtk2.0-dev

提示You must have libxml2 &gt;= 2.6.0 development headers installed to build Gaim

于是

sudo apt-get install libxml++2.6-dev

然后

./configure

提示configure complete. please type make

make

sudo make install

由于ubuntu自带gaim

所以安装时指定安装位置

./configure --opt/gaim

运行时输入此gaim的路径

若在此文件夹

./gaim

运行后发现 MSN上不了

原因

SSL support is needed for MSN. Please install a supported SSL library. See <a href="http://gaim.sf.net/faq-ssl.php">http://gaim.sf.net/faq-ssl.php</a> for more information

网上一篇文章有详细解决方案

http://www.ambience.sk/gaim-compile-ssl-linux-msn-google-talk

去http://download.chinaunix.net/download/0008000/7487.shtml下载了nspr4.6.1.tar.gz

http://download.chinaunix.net/download/0008000/7488.shtml下载了nss3.11.1.rat.gz

这个网站相当不错 赞下 http://download.chinaunix.net
