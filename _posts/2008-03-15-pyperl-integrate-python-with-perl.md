---
layout: post
title: 'pyperl: 在python中使用perl代码'
tags:
- perl
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '1018'
---
<a href="http://wiki.python.org/moin/PyPerl" target="_blank">pyperl</a>是python的perl模块，在python中嵌入perl解释器，使通过python运行perl代码、调用perl函数、导入perl模块成为可能。

<strong>下载</strong>

pyperl的<a href="http://www.cpan.org/misc/cpan-faq.html#What_is_CPAN" target="_blank">CPAN</a>发行版可以在<a href="ftp://ftp.activestate.com/Zope-Perl/" target="_blank">这里</a>或者<a href="http://linux.softpedia.com/get/Programming/Widgets/Perl-Modules/Python-Object-34436.shtml" target="_blank">这里</a>下载。不过且慢下载，由于官方版本从2001年就不再维护，在较新版本的perl或python中会出现编译问题。

Felix Schwarz发布非官方的版本pyperl1.0.1c修正了部分编译问题，可以在<a href="http://www.felix-schwarz.name/files/opensource/pyperl/" target="_blank">这里</a>下载

<strong>安装</strong>

要求perl 5.6.0以上版本，python1.5.2 以上版本

pyperl依赖于Python::Object，所以需要先安装Python::Object

解压下载后的pyperl-dist-1.0.1c.tar.gz文件，进入pyperl-1.0.1c目录，运行以下命令:

(cd Python-Object; perl Makefile.PL; sudo make install)
sudo python setup.py install

如果提示找不到 -lperl，则
<pre>sudo apt-get install libperl5.8</pre>
或者

sudo apt-get install libperl-dev

我是搜索来的，不知道哪个对 -,- 请参考<a href="http://lists.debian.org/debian-user/2004/02/msg00511.html" target="_blank">这里</a>

<strong>使用</strong>

[python]
<pre>import perl</pre>
<pre># Simple arithmetics
six = perl.eval("3+3")</pre>
<pre># Eval can also return functions
sum = perl.eval("sub { my $s = shift; $s += shift while @_; $s }")
print sum(1,2,3)</pre>
<pre># Example of using a perl module from python
perl.require("Digest::MD5")
md5 = perl.callm("new", "Digest::MD5")
md5.add("Foo")
md5.hexdigest()</pre>
<pre># Direct manipulation of perl data
inc = perl.get_ref("@INC")
inc.append("./extra")</pre>
[/python]

详细文档请参阅<a href="http://aspn.activestate.com/ASPN/CodeDoc/pyperl/perlmodule.html" target="_blank">这里</a>