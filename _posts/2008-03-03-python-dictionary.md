---
layout: post
title: python字典须知
tags:
- dictionary
- programming
- python
- zz
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1230'
---
zz from <a href="http://hedong.3322.org/archives/000276.html" target="_blank">竹笋吵肉</a>

字典
Python的内置数据类型之一是字典，它在关键字与值之间定义了一对一的关系。这一点就象Perl中的关联数组，Java中的 Map ，或VBScipt中的 Scripting.Dictionary 对象。如：
&gt;&gt;&gt; d = {"server":"mpilgrim", "database":"master"}
1)每一个元素都是一个键-值对，整个元素集合用大括号括起来,赋值给变量d.
2)server 是一个键字，它所关联的值为 mpilgrim，用 d["server"] 来引用.
3)你可以通过键字来得到值，但是不能通过值得到键字。
&gt;&gt;&gt; d["database"] = "pubs"
4)可如上式一样修改字典.
5)不能在一个字典中有重复的键字。给一个存在的键字赋值会抹掉原来的值。
6)可以在任何时候加入新的键-值对。这种语法同修改存在的值一样。
7)字典没有元素顺序的概念。
8)字典的值可以是任意数据类型，包括字符串，整数，对象，或者甚至其它的字典。
9)字典的关键字要严格一些，但是它们可以是字符串，整数和几种其它的类型
&gt;&gt;&gt; del d['server']
10)可如上式一样删除元素
&gt;&gt;&gt; d.clear()
11)可如上式一样清空所有元素
