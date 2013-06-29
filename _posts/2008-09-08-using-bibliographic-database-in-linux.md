---
layout: post
title: Linux下文献管理工具的使用
tags:
- study
- 文献
- 软件
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1109'
---
还在为散落电脑各处的用时找不到的成堆的文献发愁么？你该试试文献管理工具了。。

文献管理工具有很多啦，Windows下有著名的EndNote, Biblioscape, NoteExpress，Reference Manager，ProCite，具体比较搜索一下可以找到N多，比如<a href="http://jiangzhanyong.com/2006/09/reference-manager-compare-19.html" target="_blank">这个</a>（中文）和<a href="http://www.adeptscience.co.uk/products/refman/reference/chart.html" target="_blank">这个</a>（英文）。

在线版或者以浏览器插件形式存在的有<a href="http://www.endnoteweb.com/" target="_blank">EndNote Web</a>和<a href="http://www.zotero.org/" target="_blank">Zotero</a>.

Linux下也有很多文献管理工具，而且免费开源，较多人推崇的有<a href="http://jabref.sourceforge.net/" target="_blank">JabRef</a>和<a href="http://bibus-biblio.sourceforge.net/" target="_blank">BiBus</a>.

JabRef是经典老牌软件了，基于Java，打开比较慢，试用了一下总是找不到想要的菜单。于是下面单讲<strong>BiBus</strong>。。

BiBus基于Python，Windows和Linux版本都有，Ubuntu下<strong>安装</strong>Bibus只要敲 <span style="color:#2c86a9;">sudo apt-get install bibus</span>，就OK了（JabRef同理）。

其界面和<strong>参数设置</strong>可以看<a href="http://blog.5d.cn/user2/skyline-moon/200605/261400.html" target="_blank">这里</a>（虽然以Windows版为例，不过大同小异）。要注意的一点是第一次使用前要选择数据库，MySQL或SQLite任选其一;如果是个人使用，最好选择SQLite，具体按提示搞就OK了。

然后就需要<strong>导入文献数据库</strong>，以生物医学领域著名的Medline数据库为例（Medline和PubMed的关系好像很复杂，基本可以认为PubMed是Medline的在线搜索服务）：

1. 去<a href="http://www.ncbi.nlm.nih.gov/pubmed/" target="_blank">PubMed主页</a>，搜索关键词，在搜索结果列表中选中一堆你想要的文章（选中前面复选框，额，，我是不是太罗嗦了），在左上方Display下拉列表中选MEDLINE，在右边Send to下拉列表中选File，然后貌似会以pubmed_result.txt的文件名自动存到下载目录里。

2. 打开BiBus(在Applications-&gt;Office-&gt;BiBus，我发现我确实很罗嗦），选择菜单File-&gt;Import-&gt;Medline，选择pubmed_result.txt文件，数据库就显示在BiBus左侧的Import Buffer目录了。

<strong>使用</strong>：点击每篇文献，下方就会显示作者标题摘要等信息；你可以拖动文献到左侧References目录，可以右键点击References目录，选择Add Child增加子目录，也可以手动新建文献资料。

当然更重要的就是<strong>查找</strong>功能啦，你可以查找本地文献数据库，远程查找PubMed，甚至可以使用<a href="http://invention.swmed.edu/etblast/index.shtml" target="_blank">eTBlast</a>（简单的说就是根据标题摘要甚至文章部分章节进行文献相似度比对）。

好吧，我就知道这些，大家有啥新发现记得留言哦~
