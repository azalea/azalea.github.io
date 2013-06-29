---
layout: post
title: 在Python中调用RNAfold
tags:
- programming
- python
- RNAfold
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '360'
  ratings_users: '2'
  ratings_score: '2'
  ratings_average: '1'
---
主要参考<a href="http://www.biopython.org/wiki/Scriptcentral">此页面</a>最下方

首先下载 <a href="http://www.tbi.univie.ac.at/RNA/" target="_blank">Vienna RNA Package</a>，目前的版本是 <a href="http://www.tbi.univie.ac.at/RNA/ViennaRNA-1.8.4.tar.gz" target="_self">1.8.4</a>

在解压后的文件夹的Perl目录里，目前是 ViennaRNA-1.8.4/Perl

运行

<code>swig -python RNA.i</code>

这样会创建一个 RNA_wrap.c 文件以及 RNA.py 文件

如果提示没有swig，Ubuntu下可以 <code>sudo apt-get install swig</code> ， 或者<a href="http://www.swig.org/index.php" target="_blank">在此</a>下载

然后编译 RNA_wrap.c 文件

<code>gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/usr/local/include/python2.6 -c RNA_wrap.c</code>

如果报错，试着把 /usr/local/include/python2.6 改成其他可能的位置，比如 /usr/include/python2.6

然后创建 shared library

<code>gcc -pthread -shared RNA_wrap.o -o _RNA.so -L../lib -lRNA -s</code>

最后把创建的 _RNA.so 文件和 RNA.py 文件复制到 Python路径 (可以查看Python的<a href="http://docs.python.org/library/sys.html#sys.path">sys.path</a>变量)，比如 /usr/local/lib/python2.6/dist-packages

<code>sudo cp _RNA.so RNA.py  /usr/local/lib/python2.6/dist-packages</code>

看看效果吧
<pre>&gt;&gt;&gt; import RNA
&gt;&gt;&gt; RNA.fold('CCCCCAAAGGGGG')
['(((((...)))))', -7.5]</pre>
