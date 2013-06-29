---
layout: post
title: Linux下的屏幕录制工具XVidCap
tags:
- software
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1034'
---
XVidCap是Linux下的屏幕录制工具，是讲解软件使用方法、演示电脑操作的必备秘技。

XVidCap大概是X windows Video Capture的缩写，未经考证。

之前是在<a href="http://www.osalt.com/search?q=screencast" target="_blank">Open Source Alternative</a>这个网站搜索screencast找到的，准备动笔介绍一下时发现<a href="http://linuxdesktop.cn/2007/04/28/install-xvidcap-on-feisty/" target="_blank">keke已经介绍过了</a>。

文章中说下载个deb包安装就好了，我之前下载的是tar.gz，安装也着实非常麻烦，于是再罗嗦几句。

首先在<a href="http://sourceforge.net/project/showfiles.php?group_id=81535" target="_blank">这里下载</a>，deb和tar.gz文件都有。好吧，按我的方法下载的tar.gz文件，解压后<font color="#3366ff">./configure</font>，报错说需要gtk+-2.0 &gt;= 2.4.0 和 libglade-2.0

幸运地发现Ubuntu源里有libglade，于是

<font color="#3366ff">sudo apt-get install libglade2-0</font>

<font color="#3366ff">sudo apt-get install libglade2-dev</font>

但是Ubuntu源里死活也找不到gtk+，郁闷的跑到<a href="http://www.gtk.org/" target="_blank">http://www.gtk.org/</a> ，找到了<a href="http://ftp.gnome.org/pub/gnome/sources/gtk+/2.12/" target="_blank">下载页面</a>。下载解压后<font color="#3366ff">./configure</font>，又报错说需要libtiff，于是跑到<a href="http://www.libtiff.org/" target="_blank">http://www.libtiff.org/</a>，<a href="ftp://ftp.remotesensing.org/pub/libtiff" target="_blank">下载</a>解压<font color="#3366ff">./configure;make;sudo make install</font>，总算没有问题了。

gtk+的Install文件里说，安装gtk+时可能会缺少TIFF, PNG, and JPEG image loading libraries，分别在以下地方找：

<a href="http://www.libtiff.org/" target="_blank">http://www.libtiff.org/</a>
<a href="http://www.libpng.org/" target="_blank"> http://www.libpng.org/</a>
<a href="http://www.ijg.org/" target="_blank"> http://www.ijg.org/</a>

好吧，要找的东西都齐了，下面按倒叙方法重复一遍：

首先，看看libtiff,libpng,libjpeg有没有，没有的话先安装

然后，看看gtk+和libglade有没有，没有继续乖乖的装先

最后，终于可以安装 xvidcap了，照样是<font color="#3366ff">./configure;make;sudo make install</font>  Good luck啦~

安装好后XVidCap自动放在Applications-&gt;Sound &amp; Video目录下，使用很简单，一看就会啦，或者参考下<a href="http://linuxdesktop.cn/2007/04/28/install-xvidcap-on-feisty/" target="_blank">上面提到的文章</a>。Have fun!
