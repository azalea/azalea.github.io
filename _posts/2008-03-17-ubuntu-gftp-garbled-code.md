---
layout: post
title: Ubuntu7.10下解决gFTP远程乱码 转载
tags:
- gftp
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '752'
  _wp_old_slug: ubuntu710%e4%b8%8b%e8%a7%a3%e5%86%b3gftp%e8%bf%9c%e7%a8%8b%e4%b9%b1%e7%a0%81-%e8%bd%ac%e8%bd%bd
---
<a href="http://www.nuoran.net.cn/?p=110" rel="bookmark" title="Ubuntu7.10下解决gFTP远程乱码">Ubuntu7.10下解决gFTP远程乱码</a> 转载自nuoran's blog

首先安装gFTP：
<font color="#3366ff"> sudo apt-get install gftp</font>

然后编辑/usr/bin/gftp：
<font color="#3366ff"> sudo gedit /usr/bin/gftp</font>

在#!/bin/sh之后添加
<font color="#3366ff"> export LANG=zh_CN</font>

保存并关闭

在终端执行：
<font color="#3366ff"> sudo locale-gen zh_CN</font>

如果还是乱码，那么再在终端执行一下：
<font color="#3366ff"> sudo rm -rf ~/.gftp</font>

OK，重新运行gFTP问题解决。
