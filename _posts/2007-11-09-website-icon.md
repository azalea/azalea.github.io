---
layout: post
title: 给你的网站做个图标^^
tags:
- blog
- internet
status: publish
type: post
published: true
meta:
  views: '523'
  _wp_old_slug: '%e7%bb%99%e4%bd%a0%e7%9a%84%e7%bd%91%e7%ab%99%e5%81%9a%e4%b8%aa%e5%9b%be%e6%a0%87'
---
看到浏览器地址栏左边的小图标了么？不是海星，而是一朵杜鹃花哦。
如果你还在使用Blog Service Provider(BSP)的blog服务（比如baidu），很可惜你就不能给自己的blog做图标了。
所以赶快独立门户吧！

下面介绍如何给你的网站做图标，参考了<a href="http://www.aha-soft.com/faq/make_website_icon.htm" target="_blank">这篇文章</a>。

1. 制作一个16 x 16 pixels的小图。

软件可以用Photoshop，要去下载个<a href="http://www.sibcode.com/icon-plugin/">Icon Plugin for Photoshop</a>，在<a href="http://www.sibcode.com/icon-plugin/" target="_blank">这里下载</a>。
Linux下可以用Gimp。
另外推荐下google图片搜索，高级搜索可以只搜索小图，也许可以给你些灵感呢。

图片要保存成Windows Icon(*.ico)格式，比如azalea.ico

2. 把azalea.ico放在你的网站的根目录(/)下。

3. 在HTML-page header里加入下面的代码 (通常在 &lt;head&gt; 和 &lt;/head&gt; 之间)：

&lt;LINK REL="SHORTCUT ICON" href="azalea.ico" type="image/x-icon"&gt;

注意上面的引号都是英文引号

4. 刷新你的网站，看看效果吧 :)
