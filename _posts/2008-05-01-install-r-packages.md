---
layout: post
title: 安装R package的2种方法
tags:
- package
- programming
- R
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1237'
---
<strong>1. 自动安装</strong>

在R的控制台,输入

<font face="·s²Ó©úÅé">   <font color="#3366ff" face="Courier New">install.packages("stepNorm",contriburl="http://www.your.url"</font></font><font color="#3366ff"><span class="st0"></span>, <span class="re5">dependencies</span> = <span class="re1">T<span class="search_hit">R</span>UE</span><span class="br0"></span></font><font face="·s²Ó©úÅé"><font color="#3366ff" face="Courier New">) </font></font>

<font face="·s²Ó©úÅé"><font face="Arial">若要指定安装目录 (e.g. "mydir")，则输入</font></font>

<font face="·s²Ó©úÅé"><font color="#3366ff" face="Courier New" size="3">install.packages(</font><font color="#3366ff" face="Courier New">"stepNorm",contriburl="http://www.biostat.ucsf.edu/jean/software"</font><font color="#3366ff" face="Courier New" size="3">,lib="mydir")</font></font>

<font face="·s²Ó©úÅé">这种方法可能找不到需要的package，那么可以用方法2</font>

<font face="·s²Ó©úÅé"><strong>2. 手动安装</strong></font>

<font face="·s²Ó©úÅé"><em>Windows:</em></font>

<font face="·s²Ó©úÅé">下载package.zip文件</font>

<font face="·s²Ó©úÅé">打开R的菜单栏-&gt;Packages-&gt;<font face="·s²Ó©úÅé"><font face="Arial">"Install package from local zip      file..."</font></font></font>

<font face="·s²Ó©úÅé">选择<font><font face="·s²Ó©úÅé">package.zip文件</font></font></font>

<font face="·s²Ó©úÅé"><em>Linux: </em></font>

<font face="·s²Ó©úÅé">下载package.tar.gz文件</font>

<font face="·s²Ó©úÅé">在Shell终端（注意不是R）输入:</font>

<font face="·s²Ó©úÅé"><font color="#3366ff">sudo R CMD INSTALL package.tar.gz</font></font>

<font face="·s²Ó©úÅé">有人说要用 sudo R CMD INSTALL --build package.tar.gz 没试过。。</font>
