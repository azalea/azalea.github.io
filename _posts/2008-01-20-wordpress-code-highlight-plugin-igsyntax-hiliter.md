---
layout: post
title: WordPress代码高亮插件 iG:Syntax Hiliter
tags:
- addon
- internet
- wordpress
status: publish
type: post
published: true
meta:
  views: '1286'
  _wp_old_slug: wordpress%e4%bb%a3%e7%a0%81%e9%ab%98%e4%ba%ae%e6%8f%92%e4%bb%b6-igsyntax-hiliter
---
<strong><a href="http://www.igeek.info/download.php?file=1" target="_blank">下载</a></strong> iG:Syntax Hiliter v3.5

<a href="///home/azalea/Desktop/iG-Syntax%20Hiliter/MANUAL.html#installation" target="_blank">使用手册在此</a>

<strong>安装</strong>

1 解压下载后的文件iG_Syntax_Hiliter.zip，把子文件夹ig_syntax hiliter plugin的<strong>内容</strong>上传到wp-content/plugins/目录下 (Note: 只要上传其内容，即ig_syntax_hilite文件夹syntax_hilite.php文件）

2 在WordPress后台Plugins激活

3 Done! 开始使用吧~

<strong>使用</strong>

在需要高亮显示的代码前后分别加上tag

[tag]

你的代码

[/tag]

tag可以是as, asp, c, cpp, csharp, css, delphi, html, java, js, mysql, perl, php, python, ruby, smarty, sql, vb, vbnet, xml, code

比如

左中括号python右中括号

<font color="#3366ff">#! /usr/bin/python</font>

<font color="#3366ff">print 'Hello World!'</font>

左中括号/python右中括号

大家实际操作时把左右中括号换成[]就好了

（发现这个插件的缺点了，好像没办法escape[tag][/tag]的效果）

效果如下:

[python]

#! /usr/bin/python

print 'Hello World!'

[/python]

<strong>设置</strong>

在WordPress后台的Options里可以设置
<ol type="i">
	<li><strong>Show Plain Text Code Option:-</strong> 用户是否可以选择普通文本方式看代码</li>
	<li><strong>Show Plain Text Code In:-</strong> 如何显示普通文本方式的代码</li>
	<li><strong>Show Language Name:-</strong> 是否显示语言名称</li>
	<li><strong>Hilite Code in Comments:-</strong> 评论里的代码是否高亮显示</li>
	<li><strong>Show Line Numbers:-</strong> 是否显示行数</li>
	<li><strong>Show Fancy Line Numbers:-</strong> 是否用活泼的方法显示行数-,-</li>
</ol>
等等.

更多请参考 <a href="///home/azalea/Desktop/iG-Syntax%20Hiliter/MANUAL.html#installation" target="_blank">使用手册</a>

p.s.另外一个不错的文本高亮插件是<strong>coolcode</strong>

<a href="http://www.21andy.com/blog/20070111/516.html" target="_blank">21andy的blog上有详细介绍</a> 不过21andy修正版似乎有问题，如果一篇文章中有2段以上代码，只有最后一段代码高亮显示
