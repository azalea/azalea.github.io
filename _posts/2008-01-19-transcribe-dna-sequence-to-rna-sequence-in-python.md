---
layout: post
title: transcribe DNA sequence to RNA sequence in python
tags:
- bioinformatics
- programming
- python
status: publish
type: post
published: true
meta:
  views: '715'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
Biopython里有reverse_complement()方法，功能是把DNA的一条链的序列翻译为它的互补链序列。

但是找不到从DNA转录到RNA的transcribe()方法。

发现有以下2个简单的方法可以实现transcribe()。

A.正则表达式：

<span style="color:#3366ff;">#! usr/bin/python </span>

<span style="color:#3366ff;">import re</span>

<span style="color:#3366ff;">myDNA='CAAGAGAAACGCAAAGAAACTGACAGAAGAGAGTGAGCACACAAAGGCAATTT'</span>

<span style="color:#3366ff;">regexp = re.complie('T')</span>

<span style="color:#3366ff;">myRNA = regexp.sub('U', myDNA)</span>

与perl不同，python的正则表达式是通过re这个module实现的。

regexp = re.compile('T') 是把正则表达式'T'编译成RegexObject 实例regexp

RegexObject有各种方法，包括查找和替换。

regexp.sub()就是到正则表达式匹配的所有子串，并将其用一个不同的字符串替换。

更多可参考：<a href="http://www.cublog.cn/u/12592/showart.php?id=143640" target="_blank">python正则表达式指南</a>

B.更简单的方法

<span style="color:#3366ff;">myRNA = myDNA.replace('T','U')</span>

不需要用到re module

reference:
<a href="http://python.genedrift.org/2007/01/16/the-regular-expression/" target="_blank">http://python.genedrift.org/2007/01/16/the-regular-expression/ </a>

p.s.

October 28, 2005: Biopython 1.41 release note里提到：

Added transcribe, translate, and reverse_complement functions to Bio.Seq

that work both on Seq objects and plain strings.

不过我无论用plain string还是Seq objects都报错：

AttributeError: 'str' object has no attribute 'transcribe'

AttributeError: Seq instance has no attribute 'transcribe'

Why??
