---
layout: post
title: 'python: find repeat masked intervals in fasta files'
tags:
- bioinformatics
- fasta
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
  views: '388'
---
通常fasta文件用N来表示重复序列（用小写的atgc也很常见），下面的代码就是找出fasta文件中用N标记的区域。

首先导入<a href="http://biopython.org/wiki/Main_Page" target="_blank">biopython包</a>，然后用<a href="http://biopython.org/DIST/docs/tutorial/Tutorial.html#htoc50" target="_blank">SeqIO.to_dict()函数</a>把fasta文件的记录转换成python字典。

然后用firstN标记是否在连续的N字符中间，如果不在，则firstN == True, 否则False。其他的不言自明啦。

其中用到了python两个很方便的函数：

一是<a href="http://docs.python.org/library/stdtypes.html#dict.items" target="_blank">字典的items()函数</a>： for key,value in dict.items()，返回由dict的键值对组成的list；

一是<a href="http://docs.python.org/library/functions.html#enumerate" target="_blank">list的enumerate()函数</a>： for index, element in enumerate(list)，枚举出list元素的下标和元素本身。

输出的是 chromosome_id Nstart Nend （下标从1开始，包括起点和终点）

以下是代码：

```python
from Bio import SeqIO

fastafile = 'tair8.at.chromosomes.fas.masked'

chrD = SeqIO.to_dict(SeqIO.parse(open(fastafile),'fasta'))

for chrid,sequence in chrD.items():
    firstN = True
    for i,x in enumerate(sequence.seq.tostring()):
        if x == 'N':
            if firstN:
                start = i+1
                firstN = False
        elif not firstN:
            end = i
            firstN = True
            print chrid,start,end
```

可以很容易的修改上述代码，用来寻找小写字母区域：

```python
from Bio import SeqIO

fastafile = 't.fa'

chrD = SeqIO.to_dict(SeqIO.parse(open(fastafile),'fasta'))

for chrid,sequence in chrD.items():
    firstLower = True
    for i,x in enumerate(sequence.seq.tostring()):
        if x.islower():
            if firstLower:
                start = i+1
                firstLower = False
        elif not firstLower:
            end = i
            firstLower = True
            print chrid,start,end
```

<a href="http://dl.getdropbox.com/u/308058/blog/200908/t.fa" target="_blank">输入文件</a>
