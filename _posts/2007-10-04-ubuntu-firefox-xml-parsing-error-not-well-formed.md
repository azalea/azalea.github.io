---
layout: post
title: 'Ubuntu Firefox-XML Parsing Error: not well-formed'
tags:
- firefox
- ubuntu
status: publish
type: post
published: true
meta:
  views: '1042'
---
刚把Ubuntu升级到7.10 Beta版 Alpha版的许多问题都解决了
但是Firefox开始抽风
无论想打开什么下载页面，都会弹出错误信息：
XML Parsing Error: not well-formed
Location: xxxxxxxxxxxxxxxxxxxxxx
Line Number x, Column xx:
....比较搞笑的是，我到Firefox网站下载插件，也是这个错误信息。。

google的半天也没找到答案，比较接近的是关于<a href="http://theshiva.us/technicalblog/archive/2007/03/26/fix-for-asp-net-xml-parsing-error-not-well-formed-line-number-1-column-2.aspx" target="_blank">Windows下的解决方法</a>。重点是Register .NET with ISS,于是找到这篇文章<a href="http://www.devx.com/vb2themax/Tip/18849" target="_blank">Registering ASP.NET on IIS after installing the .NET Framework </a>不过也是windows下的方法&gt;&lt;

Ubuntu下的解决方法敬请期待。。

刚发现一个家伙<a href="http://forums.techguy.org/unix-linux/462800-xml-parsing-error-not-well.html" target="_blank">和我遇到同样的问题</a>，不过没人告诉他答案&gt;&lt;

也许<a href="http://wakaba.c3.cx/sup/kareha.pl/1120173940/" target="_blank">这个</a>接近问题的答案？但是我搞了半天不知道那个叫USE_XHTML的constant在哪里-,-
about:config里找不到&gt;&lt;

困死了，未完待续

最后更新：今天中午重启了一下电脑，问题就解决了，orz。。
