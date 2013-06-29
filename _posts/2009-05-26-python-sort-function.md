---
layout: post
title: python的排序函数
tags:
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
  views: '1348'
---
真是无所不能啊

偶建了一个列表，元素是字典，我想要通过字典的某个key的值来给整个列表排序，

比如：列表每个元素是有2个键值对的字典，key分别为name和age

&gt;&gt;&gt; L = [dict(name='pala',age=1),dict(name='azalea',age=24),dict(name='alex',age=23)]
&gt;&gt;&gt; L
[{'age': 1, 'name': 'pala'}, {'age': 24, 'name': 'azalea'}, {'age': 23, 'name': 'alex'}]

我想通过age来给整个列表排序，年龄由大到小

&gt;&gt;&gt; sorted(L,key=lambda x:x['age'],reverse=True)
[{'age': 24, 'name': 'azalea'}, {'age': 23, 'name': 'alex'}, {'age': 1, 'name': 'pala'}]

<a href="http://wiki.python.org/moin/SortingListsOfDictionaries" target="_blank">这里</a>提供了另外一种据说最快的方法。

python的sorted()或sort()函数允许自定义排序的方法，即通过函数的key参数指定，比如：

&gt;&gt;&gt; words = 'Ah what a good person azalea is!'.split()
&gt;&gt;&gt; sorted(words,key=str.lower)
['a', 'Ah', 'azalea', 'good', 'is!', 'person', 'what']

也可以用列表的sort()方法，sort()与sorted()的不同在于，sort是在原位重新排列列表，而sorted()是产生一个新的列表。

&gt;&gt;&gt; words.sort(key=str.lower)
&gt;&gt;&gt; words
['a', 'Ah', 'azalea', 'good', 'is!', 'person', 'what']

更多可以参考 <a href="http://wiki.python.org/moin/HowTo/Sorting" target="_blank">How to/Sorting</a>，很好的文章，先后看了不下十遍（偶记忆力太差了。。）
