---
layout: post
title: 编译时找不到makefile的解决办法 zz
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '509'
  _wp_old_slug: '%e7%bc%96%e8%af%91%e6%97%b6%e6%89%be%e4%b8%8d%e5%88%b0makefile%e7%9a%84%e8%a7%a3%e5%86%b3%e5%8a%9e%e6%b3%95-zz'
---
#如果是需要编译的环境，推荐安装"build essential"包
#sudo apt-get install "build-essential"  --azalea注转载自<a href="http://forum.ubuntu.org.cn/post-338831.html&amp;sid=2085a68b90a7dc927017b62c7ab8ccee" target="_blank">这里</a>

<span class="postdetails"/><span class="postbody">在用./configure   ,make     , makeinstall        ,方法安装软件是，经常会发生发生各种错误，
而导致无法声称 makefile
现在我把我安装过程中遇到的问题以及解决办法写下来，希望对大家有点帮助
以我安装  pidgin-2.0.0为例</span>

./configure  出现错误 ：

configure: error: C compiler cannot create executables
按照错误提示安装缺少的包
sudo apt-get install libc6-dev
再次
./configure
出现错误
checking for GLIB... no
no
configure: error:

You must have the GLib 2.0 development headers installed to build.
根据错误提示  用新得立 搜索  GLib 2.0  或者 用命令 apt-cache search GLib 2.0
有个包   libglib2.0-dev - Development files for the GLib library
安装
sudo apt-get install libglib2.0-dev  #这里原文为libglib2.0-0-dev，似乎有误--azalea注

./configure
又出现错误
checking for X... no
checking for GTK... no
no
configure: error:

You must have the GTK+ 2.0 development headers installed to compile Pidgin.
If you only want to build Finch then specify --disable-gtkui when running configure.

用如上同样的方法查找到缺少的包 并安装
sudo apt-get install libgtkmm2.0-dev

./configure 出现错误

checking for LIBXML... no
no
configure: error:

You must have libxml2 &gt;= 2.6.0 development headers installed to build.

于是安装
sudo apt-get install libxml2-dev

经过上面包的安装，在次./configure 没有在出现错误，这次成功的声称了makefile
然后在
make
make install
成功安装软件。
如果在./configure中还出现问题，那么要找到问题所在，安装缺失的包 即可
在配置过程中，config.log文件是很有帮助的。 我们可以在这里面找出错误的根源，从而寻找应对措施。
