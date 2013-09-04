---
layout: post
title: 用python正则表达式匹配重复模式
tags:
- programming
- python
- 字符串
- 正则表达式
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1171'
---
感谢<a href="http://fotonova.spaces.live.com/default.aspx" target="_blank">zhenhai</a>的莅临教导。

简单的问题：

一个字符串是"AAAAA"（5个A），我想从中找到"AAAA"的pattern有几个，怎么找？

可能有些人第一反应是findall，我起初也这么觉得，但是：

&gt;&gt;&gt; import re
&gt;&gt;&gt; pat=re.compile('A{4}')
&gt;&gt;&gt; m=pat.findall('AAAAA')
&gt;&gt;&gt; m
['AAAA']

列表m只有一个元素，而不是我们期望的两个。

<!--more-->

这是因为findall找到匹配的子字符串后，相当于“消费”了这些字符串，下一次的匹配就从第5个A开始查找，当然找不到。。

解决方法：

使用<strong><code>(?=...)</code></strong> 以下抄自<a href="http://www.python.org/doc/2.5.2/lib/re-syntax.html" target="_blank">这里</a>

<dl><dd>Matches if <tt class="regexp">...</tt> matches next, but doesn't consume any of the string.  This is called a lookahead assertion.  For example, <tt class="regexp">Isaac (?=Asimov)</tt> will match <code>'Isaac '</code> only if it's followed by <code>'Asimov'</code>. </dd> </dl>大意：仅当...匹配后面的字段时，才认为前面的字段是匹配，而与...匹配的字段不会被“消费”，仍然会被查找。

继续上面的例子：

&gt;&gt;&gt; import re
&gt;&gt;&gt; pat=re.compile('A(?=AAA)')
&gt;&gt;&gt; m=pat.findall('AAAAA')
&gt;&gt;&gt; m
['A', 'A']

现在列表m的长度是2,我们找到了2个匹配。

下面有个稍微复杂的例子：

&gt;&gt;&gt; pat=re.compile('[AT][AT][ACGT][ACGT][CG][CG]')
&gt;&gt;&gt; m=pat.findall('ATATATCCGG')
&gt;&gt;&gt; m
['ATATCC']

&gt;&gt;&gt; pat=re.compile('[AT](?=[AT][ACGT][ACGT][CG][CG])')
&gt;&gt;&gt; m=pat.findall('ATATATCCGG')
&gt;&gt;&gt; m
['A', 'T', 'A']

另外一个解决此问题的方法是遍历字符串。

&gt;&gt;&gt; indices = [m.start() for m in re.finditer(re.compile('[AT](?=[AT][ACGT][ACGT][CG][CG])'), 'ATATATCCGG')]
&gt;&gt;&gt; indices
[2, 3, 4]

完
