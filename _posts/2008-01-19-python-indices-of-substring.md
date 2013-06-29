---
layout: post
title: Python:已知子字符串序列，返回子字符串在原字符串的所有位置(indices)
tags:
- programming
- python
- 字符串
- 正则表达式
status: publish
type: post
published: true
meta:
  views: '804'
  _wp_old_slug: python%e5%b7%b2%e7%9f%a5%e5%ad%90%e5%ad%97%e7%ac%a6%e4%b8%b2%e5%ba%8f%e5%88%97%ef%bc%8c%e8%bf%94%e5%9b%9e%e5%ad%90%e5%ad%97%e7%ac%a6%e4%b8%b2%e5%9c%a8%e5%8e%9f%e5%ad%97%e7%ac%a6%e4%b8%b2%e7%9a%84
---
<strong>A.循环</strong>
<pre><span><span style="color:#3366ff;">myDNA = 'CAAGAGAAACGCAAAGAAACUGACAGAAGAGAGUGAGCACACAAAGGCAAUUU'</span></span></pre>
<pre><span style="color:#3366ff;">substr = 'UGACAGAAGAGAGUGAGCAC'</span></pre>
<pre><span style="color:#3366ff;">indices = [i for i in xrange(len(myDNA)) if myDNA.startswith(substr, i)] </span></pre>
<pre><span style="color:#3366ff;">print indices</span></pre>
结果是

<span style="color:#3366ff;">[20]</span>

<strong>B.正则表达式</strong>

<span style="color:#3366ff;">import re </span>
<pre><span style="color:#3366ff;">myDNA = 'CAAGAGAAACGCAAAGAAACUGACAGAAGAGAGUGAGCACACAAAGGCAAUUU'</span></pre>
<pre><span style="color:#3366ff;">substr = 'UGACAGAAGAGAGUGAGCAC'</span></pre>
<pre><span style="color:#3366ff;">indices = [m.start() for m in re.finditer(re.compile(substr), myDNA)]</span></pre>
<pre>方法B的问题是如果2个子字符串有重叠，则不能找出第二个子字符串的位置</pre>
<pre>比如</pre>
<pre>myDNA = 'ATATATA'</pre>
<pre>substr = 'ATA'</pre>
<pre>方法A得到 indices=[0,2,4]</pre>
<pre>方法B得到 indices=[0,4]</pre>
<pre>所以如果子字符串有重叠时，只能用方法A</pre>
<pre>references</pre>
<pre>Search substring in a string and get index of all occurances.<a href="http://mail.python.org/pipermail/python-list/2006-June/389388.html" target="_blank">reply1</a> <a href="http://mail.python.org/pipermail/python-list/2006-June/389363.html" target="_blank">reply2</a></pre>
<pre><a href="http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/499314" target="_blank">Find All Indices of a SubString in a Given String</a></pre>
