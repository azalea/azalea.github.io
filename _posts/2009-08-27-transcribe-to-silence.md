---
layout: post
title: 通过转录来沉默DNA
tags:
- biology
- research
- study
status: publish
type: post
published: true
meta:
  views: '417'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  _searchme: '1'
---
最近<a href="http://researchblogging.org/" target="_blank">ResearchBlogging</a>开通了中文频道，在管理员<a href="http://www.andrewsun.net/xiangge/" target="_blank">Andrew</a>的大力帮助下，总算通过了我的申请，于是写个处女作。不了解RB的请移步<a href="http://chinese.researchblogginglanguages.org/" target="_blank">伊的中文官方博客</a>。

----
<span style="float:left;padding:5px;"><a href="http://www.researchblogging.org"><img style="border:0;" src="http://www.researchblogging.org/public/citation_icons/rb2_large_gray.png" alt="ResearchBlogging.org" /></a></span>

很久以前的生物课上学过，真核生物的<a href="http://en.wikipedia.org/wiki/RNA_polymerase#RNA_polymerase_in_eukaryotes" target="_blank">RNA聚合酶</a>有3种：

Pol I 转录DNA产生核糖体RNA

Pol II 产生mRNA

Pol III 产生tRNA

2005年，数个研究小组同时发现，在植物里还存在另外两种RNA聚合酶，Pol IV 和 Pol V。

Pol IV 和 Pol V 和 Pol II 在结构上有很多相似之处，但是他们的作用不是把 DNA 转录成 RNA 进而从事细胞内的生命活动（比如合成蛋白质，组成核糖体等），而是引起染色质的甲基化从而进行基因沉默。前人已经发现 Pol IV 是真正的RNA聚合酶，它转录产生一种称做siRNA的小分子RNA。而 Pol V 的作用一直是个谜，它只是长的像RNA聚合酶，还是真正能转录DNA形成RNA呢？ 如果它真的能转录产生RNA，它的目的又是什么呢？

Wierzbicki 等人2008年发表在 Cell 杂志上的文章发现了 Pol V 转录后产生的 RNA，因此证实了 Pol V 确实是RNA聚合酶。他们提出了3个Pol IV 和 Pol V导致基因沉默的模型，下图是他们认为最可能的：

<a rel="attachment wp-att-1048" href="http://azaleasays.com/wp-content/uploads/2010/07/pol45.png2009/08/27/transcribe-to-silence/pol45/"><img class="aligncenter size-medium wp-image-1048" title="pol45" src="http://azaleasays.com/wp-content/uploads/2010/07/pol45.png?w=500" alt="pol45" width="500" height="500" /></a>
首先，Pol IV把DNA转录成很长的RNA（单链的），再由 RDR2 (以RNA为模板的RNA聚合酶）变成双链RNA，再被切成小分子的siRNA，然后结合到AGO4蛋白上。与此同时，Pol V 也把同个位置的DNA转录成RNA，然后AGO4-siRNA复合体就和Pol V 转录产物结合，指引其他染色质修饰蛋白结合到染色质上，把染色质甲基化，而甲基化带来了基因的沉默。

这里要澄清的一点是，通常 Pol IV 和 Pol V 转录的区域并不是基因（传统意义上的，表达蛋白质的）密集的区域，而是重复序列和转座子等。这些序列的表达对细胞通常没啥好处，于是生物有不同的机制来沉默这些序列。植物就通过 Pol IV 转录加工产物和 Pol V 转录加工产物的结合来指引能甲基化染色质的蛋白质们来灭了这些有害序列。

于是产生了一个有趣的悖论，Pol V 转录 DNA 是为了使这段 DNA 不再被转录。

<span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.jtitle=Cell&amp;rft_id=info%3Adoi%2F10.1016%2Fj.cell.2008.09.035&amp;rfr_id=info%3Asid%2Fresearchblogging.org&amp;rft.atitle=Noncoding+Transcription+by+RNA+Polymerase+Pol+IVb%2FPol+V+Mediates+Transcriptional+Silencing+of+Overlapping+and+Adjacent+Genes&amp;rft.issn=00928674&amp;rft.date=2008&amp;rft.volume=135&amp;rft.issue=4&amp;rft.spage=635&amp;rft.epage=648&amp;rft.artnum=http%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867408011926&amp;rft.au=WIERZBICKI%2C+A.&amp;rft.au=HAAG%2C+J.&amp;rft.au=PIKAARD%2C+C.&amp;rfe_dat=bpr3.included=1;bpr3.tags=Biology%2CMolecular+Biology">WIERZBICKI, A., HAAG, J., &amp; PIKAARD, C. (2008). Noncoding Transcription by RNA Polymerase Pol IVb/Pol V Mediates Transcriptional Silencing of Overlapping and Adjacent Genes <span style="font-style:italic;">Cell, 135</span> (4), 635-648 DOI: <a rev="review" href="http://dx.doi.org/10.1016/j.cell.2008.09.035">10.1016/j.cell.2008.09.035</a></span>
