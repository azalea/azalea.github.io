---
layout: post
title: Reverse a string in python
tags:
- programming
- python
- string
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '464'
---
python竟然没有string对象的reverse方法（但是list对象有）。

那么如何反转一个string呢？就是比如把azalea变成aelaza

至少有以下方法：

A.

&gt;&gt;&gt; a = 'azalea'

&gt;&gt;&gt; a[::-1]

'aelaza'

B.

&gt;&gt;&gt; reduce(lambda x,y: y+x, a)

'aelaza'

C.

&gt;&gt;&gt; b = list(a)

&gt;&gt;&gt; b.reverse()

&gt;&gt;&gt; "".join(b)

'aelaza'

来源：<a href="http://mail.python.org/pipermail/patches/2003-January/010886.html" target="_blank">http://mail.python.org/pipermail/patches/2003-January/010886.html</a>