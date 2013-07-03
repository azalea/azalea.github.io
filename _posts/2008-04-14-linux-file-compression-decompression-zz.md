---
layout: post
title: Linux下常见文件格式的压缩、解压小结 zz
tags:
- linux
- ubuntu
- zz
- 文件，压缩
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '733'
---
被图形界面的Extract here惯坏了，一到终端每次都记不得命令，转载一篇贴在这里参考。。

Source: <a href="http://linux.chinaitlab.com/administer/31333.html">Linux下常见文件格式的压缩、解压小结</a>

.tar
解包： tar xvf FileName.tar
打包：tar cvf FileName.tar DirName
（注：tar是打包，不是压缩！）
---------------------------------------------
.gz
解压1：gunzip FileName.gz
解压2：gzip -d FileName.gz
压缩：gzip FileName
.tar.gz 和 .tgz
解压：tar zxvf FileName.tar.gz
压缩：tar zcvf FileName.tar.gz DirName
---------------------------------------------
.bz2
解压1：bzip2 -d FileName.bz2
解压2：bunzip2 FileName.bz2
压缩： bzip2 -z FileName
.tar.bz2
解压：tar jxvf FileName.tar.bz2
压缩：tar jcvf FileName.tar.bz2 DirName
---------------------------------------------
.bz
解压1：bzip2 -d FileName.bz
解压2：bunzip2 FileName.bz
压缩：未知
.tar.bz
解压：tar jxvf FileName.tar.bz
压缩：未知
---------------------------------------------
.Z
解压：uncompress FileName.Z
压缩：compress FileName
.tar.Z
解压：tar Zxvf FileName.tar.Z
压缩：tar Zcvf FileName.tar.Z DirName
---------------------------------------------
.zip
解压：unzip FileName.zip
压缩：zip FileName.zip DirName
---------------------------------------------
.rar
解压：rar a FileName.rar
压缩：r ar e FileName.rar

rar请到：http://www.rarsoft.com/download.htm <a href="http://download.chinaitlab.com/" class="channel_keylink" target="_blank">下载</a>！
解压后请将rar_static拷贝到/usr/bin目录（其他由$PATH环境变量指定的目录也可以）：
[root@www2 tmp]# cp rar_static /usr/bin/rar
---------------------------------------------
.lha
解压：lha -e FileName.lha
压缩：lha -a FileName.lha FileName

lha请到：http://www.infor.kanazawa-it.ac.jp/~ishii/lhaunix/<a href="http://download.chinaitlab.com/" class="channel_keylink" target="_blank">下载</a>！
&gt;解压后请将lha拷贝到/usr/bin目录（其他由$PATH环境变量指定的目录也可以）：
[root@www2 tmp]# cp lha /usr/bin/
---------------------------------------------
.rpm
解包：rpm2cpio FileName.rpm | cpio -div
---------------------------------------------
.deb
解包：ar p FileName.deb data.tar.gz | tar zxf -
---------------------------------------------

参考文献：Linux 文件压缩工具指南
（其实看帮助是最好的方法，一般各个命令都可以用“--help”参数得到常用使用方法！）
