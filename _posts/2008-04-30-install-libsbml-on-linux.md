---
layout: post
title: Linux安装libsbml
tags:
- bioinformatics
- study
- systems biology
- systems biology software
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '579'
  _wp_old_slug: linux%e5%ae%89%e8%a3%85libsbml
---
libSBML是用来读写和操作<a href="http://sbml.org/Main_Page" target="_blank">Systems Biology Markup Language (SBML)</a>的库。根据 <a href="http://sbml.org/Main_Page" target="_blank">sbml.org</a> 的描述，"SBML是一种描述生物化学反应模型的机器可读格式,可以应用到新陈代谢、细胞信号转导等模型"。直观地说，SBML是一种类似XML的格式，用于表示系统生物学模型。

libSBML可以在<a href="http://sourceforge.net/project/showfiles.php?group_id=71971&amp;package_id=71670" target="_blank">http://sourceforge.net/project/showfiles.php?group_id=71971&amp;package_id=71670</a>下载，下载后解压,进入解压后的文件夹。

Linux下的libSBML下的安装需要以下步骤:

第1步：

<font color="#3366ff">./configure</font>

注意事项1：默认情况下libSBML尝试使用libxml2 XML library的2.6.16或更新版本，如果没有这个library,可以用命令:

<font color="#3366ff">./configure --with-expat</font>

或

<font color="#3366ff">./configure --with-xerces</font>

Expat, Apache Xerces-C++和Libxml2都是常用的XML parser library.

注意事项2：

默认情况下，libSBML只创建C和C++的API，如果想通过其他软件使用libXBML，需要在configure时加上参数<code>--with-java</code>, <code>--with-lisp</code>, <code>--with-python</code>, <code>--with-perl</code>, <code>--with-matlab</code>, <code>--with-octave</code>, 或 <code>--with-ruby</code>

比如希望Python和Ruby使用libSBML,就用命令:

<font color="#3366ff">./configure --<code>with-python --with-ruby</code></font>

第2步：

<font color="#3366ff">make</font>

第3步：

<font color="#3366ff">sudo make install</font>

以上不用多说

第4步也是最后一步：

<font color="#3366ff">sudo ldconfig</font>

不熟悉的可以man ldconfig (这话不是我说的。。) 这步的目的是使第3步的软件可以在运行时找到libSBML的库文件。

搞定啦。详细的安装说明以及Windows和Mac OS的安装说明请看<a href="http://sbml.org/Software/libSBML/docs/python-api/libsbml-installation.html" target="_blank">http://sbml.org/Software/libSBML/docs/python-api/libsbml-installation.html</a>

可以简单测试一下：

<font color="#3366ff">python</font>

&gt;&gt;&gt;<font color="#3366ff">import libsbml</font>