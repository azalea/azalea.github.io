---
layout: post
title: WordPress文章存档插件：SRG Clean Archives
tags:
- internet
- wordpress
- 插件
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1108'
---
SRG Clean Archives最初由<a href="http://www.sporadicnonsense.com/" title="Sporadic Nonsense">Shawn Grimes</a>开发，现在转手到<a href="http://www.geekwithlaptop.com/">Geek With Laptop</a>

这个插件为WordPress的blog创建简洁的存档页面或添加到侧边栏，存档页面的效果<a href="http://azalea.ztpala.com/archive/" target="_blank">大概是这样</a>。

最新版可以在<a href="http://www.geekwithlaptop.com/download-manager.php?id=45">这里</a>下载，支持WordPress2.1.x到2.3.x版本，支持WordPress 2.0.x的老版本可以在<a href="http://www.geekwithlaptop.com/download-manager.php?id=2">这里</a>下载。

下载后上传到wp-content/plugins目录，在WordPress后台激活，胜利就不远了！

然后可以创建一个页面，比如叫"存档"，在code里写上:<font color="#3366ff"> </font>

<font color="#3366ff">&lt;!--srg_clean_archives--&gt;</font>

或者添加到侧边栏，需要在text的widget里写:

<font color="#3366ff">&lt;?php if (function_exists('srg_clean_archives')) { srg_clean_archives(); } ?&gt;</font>

搞定~

可以在WP后台plugins的SRG Clean Archives标签下修改以下选项：

<!--more-->

是否显示每月文章数(默认显示)

是否显示评论数（默认显示）

是否显示有密码保护的文章（默认不显示）

是否允许moo.fx效果（默认允许，如果禁止就显示全部存档文章列表，而没有展开和合并列表的效果）

是否显示每月存档文章的链接（默认显示）

更多请参考插件开发者的<a href="http://www.geekwithlaptop.com/projects/clean-archives/" target="_blank">文章</a>以及下载后的readme.txt文件

此外，还有一个文章存档插件叫做<a href="http://jonas.rabbe.com/archives/2005/05/08/super-archives-plugin-for-wordpress/" target="_blank">Super Archives</a>，效果和SRG Clean Archives不太一样，是按年月日逐层展开存档文章列表，据pala说设置比较麻烦，而且已经停止更新了，Super Archives的扩展更新版<a href="http://www.sonsofskadi.net/extended-live-archive/">Extended Live Archive</a>可以在<a href="http://www.sonsofskadi.net/wp-content/upload/af-extended-live-archive-0.10.zip">这里</a>下载。
