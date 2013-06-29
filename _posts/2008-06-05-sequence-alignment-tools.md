---
layout: post
title: 收集一堆DNA和蛋白质序列比对软件
tags:
- bioinformatics
- sequence alignment
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '3628'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
最近好像爱上收集软件了（其实不是的。。），今天就来收集一下DNA和蛋白质序列比对软件(Sequence Alignment Tools).

最最最著名的就是<strong>BLAST</strong>了，BLAST虽然叫做the Basic Local Alignment Search Tool（基本局部比对搜索工具），但是研究中经常用BLAST来寻找同源序列。网络版的BLAST非常强大，<a href="http://www.ncbi.nlm.nih.gov/blast/Blast.cgi" target="_blank">http://www.ncbi.nlm.nih.gov/blast/Blast.cgi</a>，想必大家都很熟悉，就不多说了。BLAST也可以在本地进行，方法详见<a href="http://azalea.ztpala.com/2008/01/31/how-to-blast-locally/" rel="bookmark">如何在本地BLAST</a>， 另外有个本地版的程序叫bl2seq，用来进行2个序列的比对。

<strong>FASTA</strong>是和BLAST类似的工具，可以在一个数据库中搜索某序列的相似序列，也可以进行2个序列的比对。FASTA比BLAST古老，似乎现在很少有人用，弗吉尼亚大学有<a href="http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml" target="_blank">FASTA的web server</a>.

一个很古老的序列全局比对(global alignment)工具叫<strong>Needle</strong>，<a href="http://mobyle.pasteur.fr/cgi-bin/MobylePortal/portal.py?form=needle" target="_blank">这里</a>有个web版的Needle比对工具。 与Needle对应的是<strong>Water</strong>，是个很古老的序列局部(local alignment)比对工具，全局比对和局部比对的区别在于，前者尽可能使2个序列在全部长度上可以排列比对，而后者追求达到局部最优比对。<a href="http://www.ebi.ac.uk/emboss/align/" target="_blank">这里</a>同时提供了needle和water两种算法进行比对。needle和water只能用于2个序列的比对。题外话：今天得知实验室的师兄用的是Needle，真是怀旧啊。。

另外一个很古老但至今仍然很流行的多序列比对(multiple sequence alignment)工具叫<strong>Clustal</strong> <a href="http://www.clustal.org/" target="_blank">http://www.clustal.org/</a>. Clustal的图形用户界面版软件叫ClustalX，而命令行模式的版本叫ClustalW，Ubuntu下可以轻松安装CulstalW，只需<font color="#3366ff">sudo apt-get install clustalw</font>. Clustal的原理是渐进比对：“在比对过程中，先对所有的序列进行两两比对并计算它们相似性分值，然后根据相似性分值将它们分成若干组，并在每组之间进行比 对，计算相似性分值。根据相似性分值继续分组比对，直到得到最终比对结果。在比对过程中，相似性程度较高的序列先进行比对而距离较远的序列添加在后面。”（抄自<a href="http://www.biooo.com/bbs/archiver/?tid-163762.html" target="_blank">这里</a>）因此Clustal不仅可以用来进行多序列比对，也可以构建邻接树（NJ tree).

一个很新的多序列比对工具叫<strong>MUSCLE</strong> (multiple         sequence comparison by log-expectation) <a href="http://www.drive5.com/muscle/" target="_blank">http://www.drive5.com/muscle/</a>. MUSCLE对Clustal的算法进行了改进，具体我也不懂，作者测试的结果是与Clustal相比，运行速度和准确性都有所提高。

最近一直在用ClustalW和MUSCLE，下面对二者的优劣谈谈我的看法。ClustalW可以方便的设定Gap Penalty，即对序列比对出现的缺口如何罚分，这个参数对比对的结果有很大影响，但是ClustalW只能输出clw格式，不方便程序的处理。而MUSCLE可以输出多种格式的文件，总有一款适合你-.- 而且MUSCLE可以在已经进行好的比对里增加新的序列，再次比对，而不必从头对这些序列一起比对。

以上软件除了可以设定一些参数外，不能人为对比对结果进行修改。那么如果我们已知这些序列的某段子序列是比对在一起的，而软件计算的结果却不在一起，我们怎么办呢？换句话说，如果我想预先强制确定某个序列的某个位点与另外一个序列的某位点是比对在一起的，那么就需要这个软件：<strong>DiAlign</strong>, <a href="http://bibiserv.techfak.uni-bielefeld.de/dialign/" target="_blank">http://bibiserv.techfak.uni-bielefeld.de/dialign/</a> DiAlign可以输入一个文件，包含每条序列的锚定位点（即强制比对的区域），在此基础上比对其余序列。上述网站提供了web server，本地安装的方法在<a href="http://azalea.ztpala.com/2007/12/12/install-dialign-on-ubuntu/" target="_blank">这里</a>。

此外今天看到一个满可爱的web序列比对软件，<strong>Base by Base</strong>, <a href="http://athena.bioc.uvic.ca/workbench.php?tool=basebybase&amp;db=" target="_blank">http://athena.bioc.uvic.ca/workbench.php?tool=basebybase&amp;db=</a>。它是专门为病毒基因和蛋白质序列比对而开发的，不过推而广之也可以用来比对任何序列。使用者可以手动拖动序列，改变比对的位点，也可以选中想要重新比对的子序列，使用T-Coffee, ClustalW或MUSCLE算法重新进行比对。具体使用方法详见<a href="http://www.openhelix.com/blog/?p=411" target="_blank">the OpenHelix Blog</a>，有视频演示，非常赞。

罗嗦了一大堆，本来还想写一下各个软件适用的情况，不过我也不是很清楚，暂时算啦，留待以后补充。在MUSCLE的文档里看到，如果不能确信比对结果，就去搞几个不同的比对软件，所有结果中共同的比对区域可信度就高。。 我个人的偏好是2个序列比对或数据库搜索用BLAST，多序列比对用MUSCLE，因为选项丰富，可以根据需要改变一些参数，另外就是可以大规模处理数据。
