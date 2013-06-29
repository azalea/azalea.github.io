---
layout: post
title: Python语言的诡异特性
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  views: '420'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
在<a href="http://stackoverflow.com/questions/1995113" target="_blank">Strangest language feature</a>这篇讨论里看到的，原文让人大开眼界啊!

这里抄几个Python的：
<pre>&gt;&gt;&gt; def f():
...     try:
...         return True
...     finally:
...         return False
...
&gt;&gt;&gt; f()</pre>
你说结果是啥呢？

答案是False！原文的解释是：finally always wins..

_____________________________
<pre>&gt;&gt;&gt; (10 &gt; 5 &gt; 1)
True
&gt;&gt;&gt; ((10 &gt; 5) &gt; 1)
False</pre>
这个是因为Python允许连续的比较运算，所以 10&gt;5&gt;1 相当于 10&gt;5 and 5&gt;1，于是True。

而 (10&gt;5) &gt; 1 要先运算10&gt;5，结果是True，True被转换成1进行比较，1&gt;1，于是False。

_____________________________

在Python 2.x 里：
<pre>&gt;&gt;&gt; True = False
&gt;&gt;&gt; True
False</pre>
把False赋值给True，True的值就变成了False = =!
在Python 3.x 里就不能这样做了。

_____________________________
<pre>&gt;&gt;&gt; a = "foo" "bar"
&gt;&gt;&gt; a
'foobar'</pre>
在Ruby, C里ms也是这样。虽然我不知道这个特性有啥用处。

_____________________________
<pre>&gt;&gt;&gt; a[0] = "hello"
NameError: name 'a' is not defined
&gt;&gt;&gt; a[0:] = "hello"
NameError: name 'a' is not defined
&gt;&gt;&gt; a = []
&gt;&gt;&gt; a[0] = "hello"
IndexError: list assignment index out of range
&gt;&gt;&gt; a[0:] = "hello"
&gt;&gt;&gt; a
['h', 'e', 'l', 'l', 'o']</pre>
上面把 a[0:] 改成 a[:] 或 a[42:] 或 a[:33] 同样work!

_____________________________

今天自己遇到的：
<pre>&gt;&gt;&gt; a=[0]*10
&gt;&gt;&gt; a
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
&gt;&gt;&gt; a[3:5] += [2]*2
&gt;&gt;&gt; a
[0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0]
&gt;&gt;&gt; a[3:5] += [3]*2
&gt;&gt;&gt; a
[0, 0, 0, 0, 0, 3, 3, 2, 2, 0, 0, 0, 0, 0]</pre>
我没想到是这个结果，+= 相当于做了insert的事情，而不是改变list原位置elements的值

一个workarround是用numpy，把a变成array:
<pre>&gt;&gt;&gt; import numpy
&gt;&gt;&gt; a=numpy.zeros(10)
&gt;&gt;&gt; a
array([ 0.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0.])
&gt;&gt;&gt; a[3:5] += [2]*2
&gt;&gt;&gt; a
array([ 0.,  0.,  0.,  2.,  2.,  0.,  0.,  0.,  0.,  0.])
&gt;&gt;&gt; a[3:5] += [3]*2
&gt;&gt;&gt; a
array([ 0.,  0.,  0.,  5.,  5.,  0.,  0.,  0.,  0.,  0.])</pre>
大家知道有啥更好的方法么？

_____________________________

又遇到一个：
<pre>&gt;&gt;&gt; L = [0]*10
&gt;&gt;&gt; L
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
&gt;&gt;&gt; L[0] += 1
&gt;&gt;&gt; L
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0]

&gt;&gt;&gt; L = [[]]*10
&gt;&gt;&gt; L
[[], [], [], [], [], [], [], [], [], []]
&gt;&gt;&gt; L[0].append(1)
&gt;&gt;&gt; L
[[1], [1], [1], [1], [1], [1], [1], [1], [1], [1]]</pre>
解决方法：
<pre>&gt;&gt;&gt; L = []
&gt;&gt;&gt; for i in range(10):
...     L.append([])
...
&gt;&gt;&gt; L
[[], [], [], [], [], [], [], [], [], []]
&gt;&gt;&gt; L[0].append(1)
&gt;&gt;&gt; L
[[1], [], [], [], [], [], [], [], [], []]</pre>
<a href="http://www.daniweb.com/forums/thread58916.html">此文</a>对此有详细讨论

_____________________________

Oct 7, 2010添加：

&gt;&gt;&gt; -75/2+4
-34
&gt;&gt;&gt; 4-75/2
-33

解释：在-75/2+4里，Python把 -75看成个整体，然后除以2，得到-38 （向下取整）

而在4-75/2里，Python先算75/2得到37，再用4-37=-33
