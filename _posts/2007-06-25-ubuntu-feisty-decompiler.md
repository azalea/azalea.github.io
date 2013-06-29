---
layout: post
title: Ubuntu Feisty安装多媒体解码器
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '743'
  _wp_old_slug: ubuntu-feisty-demodifier
---
按照快速设置指南/FeistyFawn的方法，从cn.archive.ubuntu.com/ubuntu的源无法下载libdvdcss2和w32codecs，只好手动下载。
libdvdcss2<a href="download.videolan.org/pub/libdvdcss/1.2.9/" target="_blank">在此下载</a><font size="-1"><span class="a">
</span></font>w32codecs<a href="http://www.debian-multimedia.org/pool/main/w/w32codecs/w32codecs_20061022-0.0_i386.deb" target="_blank">在此下载</a>
下载后解压缩
tar xvfj 文件名.tar.bz2
tar xvfz 文件名.tar.gz
在解压后的文件夹中
sudo ./configure
sudo make
sudo make install
