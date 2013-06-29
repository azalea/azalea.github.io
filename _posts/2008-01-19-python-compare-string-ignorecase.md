---
layout: post
title: Python字符串比较忽略大小写的方法
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  views: '2036'
  _wp_old_slug: python%e5%ad%97%e7%ac%a6%e4%b8%b2%e6%af%94%e8%be%83%e5%bf%bd%e7%95%a5%e5%a4%a7%e5%b0%8f%e5%86%99%e7%9a%84%e6%96%b9%e6%b3%95
---
A.正则表达式，使用IGNORECASE标志
<pre>&gt;&gt;&gt;<em> import re
</em>&gt;&gt;&gt;<em> m = re.search('multi', 'A mUltiCased string', re.IGNORECASE)
</em>&gt;&gt;&gt;<em> bool(m)
</em>True</pre>
<pre>B.在比较前把2个字符串转换成同样大写，用upper()方法，或小写,lower()</pre>
<pre>&gt;&gt;&gt;<em> s = 'A mUltiCased string'.lower()
</em>&gt;&gt;&gt;<em> s
</em>'a multicased string'
&gt;&gt;&gt;<em> s.find('multi')
</em>2</pre>
<pre>reference:</pre>
<pre><a href="http://mail.python.org/pipermail/tutor/2003-July/024344.html" target="_blank">http://mail.python.org/pipermail/tutor/2003-July/024344.html</a></pre>
