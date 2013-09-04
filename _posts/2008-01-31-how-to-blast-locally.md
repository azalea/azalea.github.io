---
layout: post
title: 如何在本地BLAST
tags:
- bioinformatics
- BLAST
- sequence alignment
- study
status: publish
type: post
published: true
meta:
  views: '4201'
  _wp_old_slug: '%e5%a6%82%e4%bd%95%e5%9c%a8%e6%9c%ac%e5%9c%b0blast'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
<strong>1. 下载</strong>Standalone BLAST executables

下载地址: <a href="http://www.ncbi.nlm.nih.gov/blast/download.shtml" target="_blank">http</a> <a href="ftp://ftp.ncbi.nih.gov/blast/executables/LATEST/" target="_blank">ftp</a>

注意下载和你的系统对应的文件

<strong>2.  解压 </strong>

以下步骤针对于<strong>linu</strong>x操作系统,windows操作系统的方法请参考解压后的doc文件夹的index.html文件

<strong>3. </strong>创建一个名为<strong>.ncbirc</strong>的文件

内容如下:
<span style="color:#3366ff;">[NCBI]
Data="path/data/"</span>
其中，"path/data/"是Standalone BLAST程序data子目录的位置。如: Data=/root/blast/data
.ncbirc文件应保存在你调用Standalone BLAST程序的目录或者你的根目录

<strong>4. </strong>创建BLAST <strong>database</strong>

下载或者收集BLAST搜索的数据库，通常是核酸序列或蛋白质序列，

通过Standalone BLAST程序的formatdb命令把这些序列格式化。如:

<span style="color:#3366ff;">formatdb -i db -o F -p F -n "nr" -v 2000000000</span>

各选项意义如下:

-i 输入文件，只能是一个文件，

-o Parse options （默认是F)
T - True: Parse SeqId and create indexes.
F - False: Do not parse SeqId. Do not create indexes.
Update: 如果需要用fastacmd通过SeqId获取序列，则必须使用-o选项;
如果只是BLAST，不需要获取BALST得到的序列，则不使用-o选项

-p 文件类型  （默认是T)
T - protein
F - nucleotide [T/F]  Optional

-n 数据库名称
不指出的话默认为输入文件名

-v 数据库每卷大小(单位是百万字母) （默认是0)
这个选项把大的FASTA文件分割成卷，每卷大小由-v后的参数指定，不超过2000000000，即20亿字母。

更多选项请参阅 解压后的doc文件夹的formatdb.html文件或者man formatdb
关于错误解决方法，请参阅<a href="http://bioinformatics.ubc.ca/resources/tools/formatdb" target="_blank">http://bioinformatics.ubc.ca/resources/tools/formatdb</a>

<strong>5. </strong>开始<strong>BLAST</strong>！
大家熟悉的"blastp", "blastn", "blastx", "tblastn", 或 "tblastx" 都通过Standalone BLAST程序的formatdb命令实现。
格式是:
<span style="color:#3366ff;">blastall -p blastn -d nr -i QUERY -o out.QUERY -m 9</span>
各选项意义如下:
-p 程序名
包括 blastp: 通过蛋白质序列搜索蛋白质序列数据库
blastn: 通过核酸序列搜索核酸数据库
blastx: 通过翻译后的核酸序列搜索蛋白质数据库
tblastn: 通过蛋白质序列搜索翻译后的核酸数据库
tblastx: 通过翻译后的核酸序列搜索翻译后的核酸数据库
-d 数据库名称
与formatdb中-n选项一致
-i 输入文件
不指明的话默认为STDIN
-o 输出文件
不指明的话默认为STDOUT
-m (blast2, blastall, blastall_old, blastcl3, blastpgp,impala, megablast, rpsblast)显示选项:
0      pairwise (default)
1      query-anchored showing identities
2      query-anchored, no identities
3      flat query-anchored, show identities
4      flat query-anchored, no identities
5      query-anchored, no identities and blunt ends
6      flat query-anchored, no identities and blunt ends
7      XML Blast output (not available for impala)
8      tabular (not available for impala)
9      tabular with comment lines (not available for impala)
10     ASN.1 text (not available for impala or rpsblast)
11     ASN.1 binary (not available for impala or rpsblast)
-T 输出html格式的文件
更多选项请参阅 解压后的doc文件夹的formatdb.html文件，或者man blast

<strong>6. </strong>Standalone BLAST程序还带有<strong>其他命令</strong>，如
bl2seq: 比较2个序列相似性
megablast: 高度相似性核酸序列BLAST
等等
详情请参阅 解压后的doc文件夹,或者man blast

2009.9.3 Update:

BENM同学也写了一系列BLAST教程，很好很详细，大家可以参考下：

<a href="http://blog.sina.com.cn/s/blog_4860086b0100f27h.html" target="_blank">Blast使用方法攻略(一)</a>

<a href="http://blog.sina.com.cn/s/blog_4860086b0100f27k.html" target="_blank">Blast使用方法攻略(二)</a>

<a href="http://blog.sina.com.cn/s/blog_4860086b0100f27m.html" target="_blank">Blast使用方法攻略(三)</a>