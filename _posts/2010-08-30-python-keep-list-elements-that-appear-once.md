---
layout: post
title: Python保留list只出现一次的元素
tags:
- list
- programming
- python
status: publish
type: post
published: true
meta:
  jabber_published: '1283205065'
  _edit_last: '1'
  _searchme: '1'
---
就是定义一个函数  filter_by_uniqueness()，参数是一个list，返回另外一个list，只保留在原始list里出现一次的元素，例如：

&gt;&gt;&gt; l = ['a', 'b', 'b', 'c', 'd', 'd', 'd']
&gt;&gt;&gt; filter_by_uniqueness(l)
['a', 'c']

不知道大家有什么好方法？

我现在用的土鳖方法：

<pre>
def filter_by_uniqueness(l):
    d = {}
    for elem in l:
        if elem in d:
            d[elem] += 1
        else:
            d[elem] = 1
    uniquel = []
    for k,v in d.items():
        if v == 1:
            uniquel.append(k)
    return uniquel  
</pre>

就是先统计list里每个元素出现的次数，然后遍历list里的元素和次数，把出现次数等于1的元素存入一个新的list再返回。

其实Python里有个简便的方法去掉list里的重复元素:
&gt;&gt;&gt; l = ['a', 'b', 'b', 'c', 'd', 'd', 'd']
&gt;&gt;&gt; list(set(l))
['a', 'c', 'b', 'd']

不知道可以怎么利用一下。


          

