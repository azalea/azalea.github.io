---
layout: post
title: Computational Challenges of Next-Generation Genomics
tags:
- bioinformatics
- research
- science
- seminar
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  original_post_id: '1875'
  _wp_old_slug: '1875'
---
今天听了题为 Computational Challenges of Next-Generation Genomics 的演讲，演讲者是 <a href="http://bioinformatics.igm.jhmi.edu/salzberg/">Steven L. Salzberg</a>，他的实验室开发了 Bowtie, Tophat, Cufflinks 等一系列测序数据分析工具。

首先，Steven 展示了下面这张著名的图：


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2011/10/cost_per_megabase.jpg)
<a href="http://www.genome.gov/sequencingcosts/">来源</a>）

这告诉我们，测序费用呈指数级逐年降低，从2001年每百万碱基（Mb）10000美元到几个月前的0.1美元，测序基本上和免费差不多了。其中两次最大降幅是04年问世的<a href="http://en.wikipedia.org/wiki/454_Life_Sciences">454测序技术</a>和07年的 <a href="http://en.wikipedia.org/wiki/Illumina_(company)">Illumina</a>。而更重要的一点是，测序成本的下降，使同样的花费获得的数据量指数级增长，这个增幅超过了摩尔定律预测的计算机计算能力的增幅，因此，计算资源的限制取代测序成本，成了基因组研究的瓶颈。

以测序领域的领先者 Illumina 为例，<a href="http://www.illumina.com/systems/genome_analyzer_iix.ilmn">Genome Analyzer IIx</a> 测序仪一次可以测量长度为 75-150bp，共 30-60Gb 的数据。而今年新推出的 <a href="http://www.illumina.com/systems/hiseq_2000.ilmn">Hiseq 2000</a>，虽然长度为 100bp，但是数据量达到 600Gb，费用大概是 15000 美元。算起来 15000美元除以600Gb确实是2.5美分/Mb。

于是很多生物学家错误的认为现在获得一个基因组序列很容易，但是他们花1000美元测序之后，却对数据分析无从下手。Steven估计，基因组测序费用1000美元，生物信息学分析费用5-7.5万美元，此外还要考虑计算和存储数据的花费。虽然生物信息学家的工资被大大低估了（笑~~），但是数据分析仍然需要高额花费。

听到这里我真是欢欣鼓舞，至少短时间内应该不会失业。而且隐约觉得这应该对很多生物信息学创业公司来说是个好机会，提供数据分析服务或者培训都是生财之道呀。

之后 Steven 依次讲了他们实验室面对测序数据分析的挑战而开发的各种工具，听起来感觉就像生物信息学导论。

总之大意就是 <a href="http://bowtie-bio.sourceforge.net/">Bowtie</a> 是目前最快的短序列比对工具，而且是 memory efficient。Bowtie用<a href="http://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform">BWT</a> index genome，每个碱基只需要 1/3 - 1/2 字节，而传统的 suffix tree 方法需要12字节。刚刚推出的新版 Bowtie 2 可以很好的处理 indel，因为 Steven 说他们的竞争对手 <a href="http://www.google.com/url?sa=t&amp;source=web&amp;cd=1&amp;ved=0CDsQFjAA&amp;url=http%3A%2F%2Fbio-bwa.sourceforge.net%2F&amp;ei=xDmeTqCgLem80AGU8cnFCQ&amp;usg=AFQjCNEkV0T52Idv0K_Kx4P9q3XSHxhbDw&amp;sig2=qfpvKy19YOEoiA05VZBV2g">bwa</a> 一直可以，而他们希望在不牺牲速度的情况下完美实现 indel 处理，因此现在才有这个功能。

为啥速度重要呢？因为以现在最快的短序列比对工具Bowtie的速度（30M reads / hour），处理 Illumina Hiseq 2000的数据也要200小时。

然后介绍了自动预测 splice junction 的 RNAseq mapper <a href="http://tophat.cbcb.umd.edu/">Tophat</a>, 预测 chromosome fusion 的 <a href="http://tophat-fusion.sourceforge.net/">Tophat-fusion</a> (听众中有人提到这个也许可以用来处理 <a href="http://en.wikipedia.org/wiki/Chromosome_conformation_capture">3C</a> 数据）,   以及可以拼装注释 spliced isoform 的 <a href="http://cufflinks.cbcb.umd.edu/">Cufflinks</a>。

此外，Steven 提到他们正在开发的一个网站，<a href="http://gage.cbcb.umd.edu/">GAGE</a> （Genome Assembly Gold-standard Evaluations），敬请一个月后查看。

以下是演讲中的笑点（写完发现都好冷）：

1. 人类基因组当时有2个独立的小组分别在研究，结果分别发表在2001年的 <a href="http://www.sciencemag.org/content/291/5507/1304.full">Science</a> 和 <a href="http://www.nature.com/nature/journal/v409/n6822/full/409860a0.html">Nature</a> 上。我迟到了木有听到，貌似说到当时2个小组试图合作未果。Steven 说这是论文发表史上的奇迹（额，这个词是我总结的），他们直接和杂志社说，给我们留几十页的版面，而以前发表文章，都是杂志让缩短到几页或把结果扔到补充文件里就乖乖听话的。此外，他们刚投了稿，新闻就宣布人类基因组测序已经完成，审稿人只有2个星期的时间评审，Steven说，他相信审稿人肯定认真读了这几十页的论文，但是问题是他们的评审意见根本不可能是“修回”或“拒绝”。


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2011/10/cacao_nature_genetics.gif)

2. <a href="http://www.nature.com/ng/journal/v43/n2/index.html">今年2月</a>的 Nature Genetics 同时发表了草莓和巧克力的基因组，Steven说，因为他们想在情人节为读者献上 Strawberry chocolate。身为上百作者之一的我怎么都木有发现 - -

   <a href="http://www.plosbiology.org/article/info%3Adoi%2F10.1371%2Fjournal.pbio.1000475">火鸡基因组</a>是在感恩节前发表的（去年9月）。

3. Steven还推广了一下 <a href="http://main.g2.bx.psu.edu/">Galaxy</a> (<a href="http://usegalaxy.org">usegalaxy.org</a>) 说，这个是专为生物学家设计的，可以直接用鼠标操作 Bowtie, Tophat 和 Cufflinks，虽然他不明白为什么生物学家不喜欢用 command line。

4. Ross 问 Steven 有木有觉得生物信息学方面的 funding 很有限，并问他有什么建议。Steven说，这听起来像是政治问题。。大概是去年美国生命科学方面的funding没有增加反而减少，今年大概也就是维持原状的样子，你总不能和funding agency说把钱给我不要给别人，因为总数就那么多。Steven说，最好的解决方法就是美国变成一个更加繁荣富强的国家。
