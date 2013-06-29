---
layout: post
title: Python计算中位数和众数
tags:
- programming
- python
- 统计
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1060'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
一些代码：
<div class="source" style="font-family:&quot;"><span style="color:#000080;font-weight:bold;">def</span> median(numbers):
<span style="color:#0000ff;">'''Return the median of the list of numbers.'''</span>
<span style="color:#008800;font-style:italic;"># Sort the list of numbers and take the middle element.</span>
n = len(numbers)
copy = numbers[:] <span style="color:#008800;font-style:italic;"># So that "numbers" keeps its original order</span>
copy.sort()
<span style="color:#000080;font-weight:bold;">if</span> n &amp; <span style="color:#0000ff;">1</span>: <span style="color:#008800;font-style:italic;"># There is an odd number of elements</span>
<span style="color:#000080;font-weight:bold;">return</span> copy[n / <span style="color:#0000ff;">2</span>]
<span style="color:#000080;font-weight:bold;">else</span>:
<span style="color:#000080;font-weight:bold;">return</span> (copy[n / <span style="color:#0000ff;">2</span> - <span style="color:#0000ff;">1</span>] + copy[n / <span style="color:#0000ff;">2</span>]) / <span style="color:#0000ff;">2</span>

<span style="color:#000080;font-weight:bold;">def</span> mode(numbers):
<span style="color:#0000ff;">'''Return the mode of the list of numbers.'''</span>
<span style="color:#008800;font-style:italic;">#Find the value that occurs the most frequently in a data set</span>
freq={}
<span style="color:#000080;font-weight:bold;">for</span> i <span style="font-weight:bold;">in</span> range(len(numbers)):
<span style="color:#000080;font-weight:bold;">try</span>:
freq[numbers[i]] += <span style="color:#0000ff;">1</span>
<span style="color:#000080;font-weight:bold;">except</span> KeyError:
freq[numbers[i]] = <span style="color:#0000ff;">1</span>
max = <span style="color:#0000ff;">0</span>
mode = None
<span style="color:#000080;font-weight:bold;">for</span> k, v <span style="font-weight:bold;">in</span> freq.iteritems():
<span style="color:#000080;font-weight:bold;">if</span> v &gt; max:
max = v
mode = k
<span style="color:#000080;font-weight:bold;">return</span> mode</div>
同样的事用<a href="http://azalea.ztpala.com/2008/02/17/python-statistics-module/">python stats module</a>也可以做，对应的函数就是stats.median()和stats.mode()，但是我用stats.median()结果很奇怪，输入是一堆整数的list，结果median是小数。。希望高手告诉我这是为啥。。stats.mode返回一个list，第一个元素是众数的频度，第二个元素是所有众数的list（因为未必唯一），而上面的代码仅返回其中一个众数，当然简单改进一下就和stats.mode()完全一样啦

Reference:
<a href="http://mail.python.org/pipermail/python-list/2004-December/294990.html">http://mail.python.org/pipermail/python-list/2004-December/294990.html</a>
