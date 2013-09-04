---
layout: post
title: apt-get install fail with dependency problems
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  _edit_last: '1'
---
症状如同<a href="http://stackoverflow.com/questions/6758923/apt-get-install-pgadmin-fail-with-libgtk2-0-0-libwxgtk2-8-0-not-configured-yet" target="_blank">这位仁兄</a>，就是运行任何 apt-get install xxxxxx 都会报错：
<pre>Errors were encountered while processing:
 shared-mime-info
 libgtk2.0-0
 libgtk2.0-bin
 libwxgtk2.8-0
 pgadmin3</pre>
解决方法参考了<a href="http://forums.debian.net/viewtopic.php?f=10&amp;t=54265#p313527" target="_blank">这个</a>，就是把 /usr/local/lib/libz.so.1 删除，但是这是为什么呢？

Jan 11, 2012 Update:
今天用上述方法也不行，最后的解决方法是：
rm /var/lib/dpkg/info/shared-mime-info.*
就是删除 /var/lib/dpkg/info/ 下面用 broken package 开头的所有文件。

然后 sudo apt-get upgrade 就可以了。

<a href="http://www.linuxquestions.org/questions/debian-26/sub-process-usr-bin-dpkg-returned-an-error-code-1-a-171107/#post3040967">ref</a>