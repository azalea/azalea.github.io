---
layout: post
title: 安装RepeatMasker
tags:
- bioinformatics
- software
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  original_post_id: '1838'
  _wp_old_slug: '1838'
---
实在需要先吐槽一句，经过漫长的4年的尝试，我终于装上 RepeatMasker 了。之前要么是需要注册，要么是安装不了依赖的其他程序。最近因为需要 Repeat marked Arabidopsis thaliana TAIR9 genome，但是<a href="http://www.repeatmasker.org/cgi-bin/WEBRepeatMasker" target="_blank"> RepeatMasker网页版</a>不接受这么大的文件，于是只好再次尝试安装本地版本。

<strong>首先</strong>，阅读<a href="http://www.repeatmasker.org/RMDownload.html" target="_blank">下载页面</a>的 Prerequisites：

1. Unix system with perl 5.8.0 or higher installed

基本没问题

2. Sequence Search Engine

最好装 <a href="http://http//www.repeatmasker.org/RMBlast.html" target="_blank">RMBlast</a> ( NCBI Blast modified for use with RepeatMasker/RepeatModeler )，下载解压预编译的文件们，然后复制到 /usr/local/rmblast 之类的地方。

3. TRF - Tandem Repeat Finder

下载之后直接改名为 rtf，复制到 /usr/local/bin 之类的地方，

或者创建一个名为 trf 的 link 到 /usr/local/bin 之类的地方。

<strong>然后</strong>，开始安装 RepeatMasker

1. 下载解压

2. 运行 configure 文件

perl ./configure

按照提示来。。。注意 RMBlast 的安装路径，需要是 /usr/local/rmblast<strong>/bin</strong>

3. 修改生成好的 configure 文件 RepeatMaskerConfig.pm

line 121: $DEFAULT_SEARCH_ENGINE = "ncbi";

4. 查看 /usr/lib 目录下有没有 /usr/lib/libpcre.so.0 文件，

没有的话，创建以下 link ( <a href="http://forums.mysql.com/read.php?108,93018,93883#msg-93883">ref </a>)：

ln -s /usr/lib/libpcre.so.3 /usr/lib/libpcre.so.0
ln -s /usr/lib/libpcreposix.so.3 /usr/lib/libpcreposix.so.0

如果 没有 /usr/lib/libpcre.so.3，则创建 link

ln -s /lib/libpcre.so.3 /usr/lib/libpcre.so.3

5. Install RepeatMasker Libraries

从 <a href="http://www.girinst.org/server/RepBase/index.php">http://www.girinst.org/server/RepBase/index.php</a> 下载 Libraries 文件，解压后把 RepeatMaskerLib.embl 文件复制到 RepeatMasker/Libraries 目录下

6. 编辑 RepeatMasker目录下的RepeatMasker文件和ProcessRepeats文件

把第一行改成正确的 perl interpreter，比如 #!/usr/bin/perl 。唉，真是佩服死这帮人，这个都能写错？

7. 创建一个link

ln -s /usr/local/RepeatMasker/RepeatMasker /usr/local/bin/RepeatMasker

大功告成 - -

运行 RepeatMasker

可直接输入 RepeatMasker 或 RepeatMasker -h 查看帮助。
