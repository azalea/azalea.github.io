---
layout: post
title: Linux下打开chm文件
tags:
- linux
- ubuntu
- 文件
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1126'
---
chm(<a href="http://en.wikipedia.org/wiki/Microsoft_Compiled_HTML_Help">Microsoft Compiled HTML Help</a>)文件是常见的帮助文档，在linux下如何打开呢？ 这里推荐<a href="http://www.kchmviewer.net/">KchmViewer</a>.

如果是KDE桌面环境，默认安装了kchmviewer，因此可以直接双击打开。

Gnome下需要安装: <font color="#3366ff">sudo apt-get kchmviewer</font>

如果不是Debian/Ubuntu，需要先<a href="http://www.kchmviewer.net/download.html" target="_blank">下载</a>，然后根据README安装，kchmviewer依赖于qt4，因此需要先安装 libqwt5-qt4和 libqwt5-qt4-dev

安装后可以通过命令行输入 <font color="#3366ff">kchmviewer yourchmfile.chm</font> 打开chm文件，或者在文件图标上右击选择Open with other Application...然后点击Use a custom command，填kchmviewer，之后就可以双击打开chm文件了。

KchmViewer支持中文日文韩文等chm文件的显示和查找，而且免费开源，赞一下。

此外Linux下还可以使用<a href="http://www.help-explorer.com/hx.php">Help Explorer Viewer</a>, <a href="http://chmsee.gro.clinux.org/">ChmSee</a>, 或者Firefox插件<a href="https://addons.mozilla.org/nl/firefox/addon/3235">CHM Reader</a>. 详细介绍请看<a href="http://www.linux.com/feature/122171" target="_blank">这篇文章</a>。
