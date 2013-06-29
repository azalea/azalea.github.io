---
layout: post
title: ubuntu安装EMBOSS
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '869'
  _wp_old_slug: ubuntu%e5%ae%89%e8%a3%85emboss
---
EMBOSS是一个功能强大的分子生物信息学工具包，全称是"The European Molecular Biology Open Software           Suite"。

可以用来进行序列比对，在数据库中查找特定序列模式，蛋白质motif或domain识别，核酸序列模式分析(如CpG islands识别），密码子使用分析等。详细介绍参见<a href="http://emboss.sourceforge.net/what/" target="_blank">About EMBOSS</a>

linux下安装方法很简单。

下载 <a href="ftp://emboss.open-bio.org/pub/EMBOSS/" target="_blank">ftp://emboss.open-bio.org/pub/EMBOSS/</a>目录下的EMBOSS-5.0.0.tar.gz文件

解压

<font color="#3366ff">        gunzip EMBOSS-5.0.0.tar.gz</font>

<font color="#3366ff">        tar xvf EMBOSS-5.0.0.tar </font>

编译

<font color="#3366ff">    ./configure</font>

<font color="#3366ff">    make </font>

<font color="#3366ff">    sudo make install</font>

更多安装信息在<a href="http://emboss.sourceforge.net/download/" target="_blank">这里</a>
