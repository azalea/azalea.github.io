---
layout: post
title: 使用python进行ClustalW格式和aligned FASTA格式转换
tags:
- bioinformatics
- programming
- python
- sequence alignment
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1636'
---
ClustalW格式是多序列比对程序CLUSTAL W的默认输出格式，大概是这个样子：

![](/images/2010/07/clw.jpg)

Aligned FASTA格式是多序列比对程序MUSCLE的默认输出格式，与一般的FASTA格式很相似，只是根据比对结果在序列中填充“-”，使所有序列长度相同，例如：

![](http://azaleasays.files.wordpress.com/2008/06/afa.jpg)

Aligned FASTA格式更便于机器阅读，而ClustalW格式是比较人性化的 ，使用者可以直观地看到相同和不同的区域。

由于MUSCLE程序的profile alignment功能需要aligned FASTA格式的输入，因此我写了以下一段简单的python代码，把ClustalW格式转换成aligned FASTA格式：

```python
#!/usr/bin/python
#Usage: python clw2afa.py input.clw
#Default output is STDOUT, you can redirect using '>'
#You can also import it as a module, i.e. import clw2afa

import sys
import re

def clw2afa(filename):
    pat=re.compile('(S+)s+(S+)')
    f=open(filename)
    header=f.readline()
    if not header.startswith('CLUSTAL') and not header.startswith('MUSCLE'):
        sys.exit("clw2afa.py:Wrong input file type.")
    ln=f.readline()
    while not ln.strip():
        ln=f.readline()
    seqdict={}
    EOF=False
    while ln:
        m=pat.search(ln)   
        if m and not '' in ln: 
            seqdict[m.group(1)]=m.group(2)
            ln=f.readline()
        elif not ln:
            EOF=True
            break
        else:
            break
    if not EOF:
        while True:
            ln=f.readline()
            if not ln:
                break
            m=pat.search(ln)
            if m and not '' in ln:
                seqdict[m.group(1)]+='n'+m.group(2)
    f.close()
    output=''
    for k,v in seqdict.items():
        output+='>%sn%sn'%(k,v)
    return output

if name == "main":
    import sys
    tt=clw2afa(sys.argv[1])
    print tt
```

写得有点混乱，希望大家如果使用的话把BUG报告一下^^
