---
layout: post
title: 用python进行质因数分解
tags:
- math
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  views: '577'
---
想当年小学时，质因数分解都是手算滴。现在不同啦，虽然大数的质因数分解是NP问题，不过小一点的数还是可以在有限时间内用计算机算出来的。

<strong>方法一：</strong>

借用Linux下的factor命令：

azalea@ubuntu:~$ factor 2123324321435364678
2123324321435364678: 2 3 353887386905894113
azalea@ubuntu:~$ factor 31233243214353646789
factor: `31233243214353646789' is too large

不知道上限到底是多少，不超过19位看来是没问题。

于是python代码可以写成：

&gt;&gt;&gt; import os
&gt;&gt;&gt; def factor(num):
...     stdout = os.popen('factor %d'%num)
...     s = stdout.read().strip()
...     return map(int, s[s.index(':')+2:].split(' '))
...
&gt;&gt;&gt; factor(28)
[2, 2, 7]

<strong>方法二：</strong>

使用<a href="http://code.google.com/p/sympy/" target="_blank">SymPy</a>, 'a Python library for symbolic mathematics'.

Ubuntu下直接 sudo apt-get install python-sympy，然后

&gt;&gt;&gt; import sympy
&gt;&gt;&gt; sympy.factorint(2523324321435364678901)
[(31, 1), (107, 1), (760724848186724353L, 1)]
&gt;&gt;&gt; sympy.factorint(3123324321435364678901)

等啊等啊，等了几分钟都没反应。。。看来sympy能搞定21位整数。
