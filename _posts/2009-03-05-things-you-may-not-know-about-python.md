---
layout: post
title: Things you may not know about Python
tags:
- programming
- python
- 字符串
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  views: '575'
---
<strong>1. 可传递的条件表达式：</strong>

&gt;&gt;&gt; a,b,c,d = 1,2,2,3
&gt;&gt;&gt; if a&lt;b==c&lt;d:
...     print 'voila!'
...
voila!

我以前受C语言的毒害，一直写成 if (a&lt;b) and (b==c) and (c&lt;d)，汗

<strong>2. 分开写的格式化字符串:</strong>

&gt;&gt;&gt; greetings = 'Hello, %s!'
&gt;&gt;&gt; print greetings%'pala'
Hello, pala!

格式符(%s)相当于参数，如同函数中，可以先设置参数，随后再传递参数。

<strong>3. 把字符串的每个单词的首字母大写:</strong>

&gt;&gt;&gt; s = 'i love python!'
&gt;&gt;&gt; s.title()
'I Love Python!'

这个字符串方法的名字很难想到，我总觉得capitalize()应该是这个效果，不过其实capitalize只大写整个字符串的首字符。

<strong>4. 给字典添加新的键值对，但如果已有这个键则不修改字典:</strong>

&gt;&gt;&gt; d = dict(a=1,b=2)
&gt;&gt;&gt; d.setdefault('b',3)
2
&gt;&gt;&gt; d
{'a': 1, 'b': 2}
&gt;&gt;&gt; d.setdefault('c',3)
3
&gt;&gt;&gt; d
{'a': 1, 'c': 3, 'b': 2}

这样可以放心大胆的添加新的键值对，而不必担心把已有的键值对给覆盖了。

<strong>5. 序列的'+'运算符的效率问题</strong>

序列(sequence)类型包括字符串、列表(list)等。'+'运算可以连接2个序列:
&gt;&gt;&gt; s1 = 'about'
&gt;&gt;&gt; s2 = 'python'
&gt;&gt;&gt; s1+s2
'aboutpython'
&gt;&gt;&gt; l1 = ['pineapple','orange']
&gt;&gt;&gt; l2 = ['strawberry']
&gt;&gt;&gt; l1+l2
['pineapple', 'orange', 'strawberry']

据说，由于python底层C语言实现的不同，'+'运算不如一些等价方法效率高。于是，字符串连接推荐用格式化字符串或join()方法，list连接推荐用extend()方法。

&gt;&gt;&gt; '%s%s'%(s1,s2)
'aboutpython'
&gt;&gt;&gt; ''.join([s1,s2])
'aboutpython'
&gt;&gt;&gt; l1.extend(l2)
&gt;&gt;&gt; l1
['pineapple', 'orange', 'strawberry']

另，l1.extend(l2) 是直接修改l1, 而 l1+l2 是产生一个新的list，因此，如果不考虑效率，可以用 l1+=l2 达到和 l1.extend(l2) 同样的结果。

(未完待续)
