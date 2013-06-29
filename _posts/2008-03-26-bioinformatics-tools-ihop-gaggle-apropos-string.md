---
layout: post
title: '几个生物信息学工具: iHOP, Gaggle, Apropos, STRING'
tags:
- bioinformatics
- network
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '893'
---
iHOP, Gaggle, Aprops, STRING都是研究基因组和蛋白质组（或者用popular的词说：系统生物学）的工具。

<strong>iHOP</strong>是用基因或蛋白质做关键词，显示PubMed数据库的文章摘要网络。你只需输入某个基因或某个蛋白质，iHOP就把所有相关文章（定义为摘要里包括这个基因的名字，accession No,etc）显示出来。iHOP可以使你迅速了解特定基因或蛋白质的结构、功能、同源物、相互作用基因或蛋白质，这在解释大规模数据分析的结果时很有用。

官方网站: <a href="http://www.ihop-net.org/UniPub/iHOP/" target="_blank">http://www.ihop-net.org/UniPub/iHOP/</a>

文献: <a href="http://cbio.mskcc.org/~hoffmann/publications/2004_iHOP_gene_navigation.pdf" target="_blank">Hoffmann, R., Valencia,                      A. A gene network for navigating the literature. <em>Nature                      Genetics</em> 36, 664 (2004).</a>

<strong>Gaggle</strong>是用Java写的开源的生物信息学软件和数据整合平台。它提供一个框架，用户可以自己写Gaggle的程序，称为goose（这个很搞笑的说，因为Gaggle是鹅叫，而goose是鹅，一堆鹅在一起就组成了鹅叫-,-），其他用户就可以在Gaggle平台中使用这些程序，进行数据格式类型转换和分析。

官方网站: <a href="http://gaggle.systemsbiology.org/docs/" target="_blank">http://gaggle.systemsbiology.org/docs/</a>

文献: <a href="http://www.biomedcentral.com/content/pdf/1471-2105-7-176.pdf" target="_blank">Paul T Shannon, David J Reiss, Richard Bonneau,Nitin S Baliga. The Gaggle: An open-source software system for integrating bioinformatics software and data sources. <em>BMC Bioinformatics</em> 2006, 			 <strong>7</strong><strong>:</strong>176.</a>

<strong>Apropos</strong>是开源的大鼠/小鼠/人类基因组和蛋白质组注释工具。用户只要上传一组基因，就会得到详细的注释信息，如<a href="http://apropos.rubyforge.org/Apropos%20Annotation%20Platform/Screenshots.html" target="_blank">截图</a>。这样分析结果倒是方便得紧阿 :)

官方网站: <a href="http://apropos.mcw.edu/" target="_blank">http://apropos.mcw.edu/</a>

<strong>STRING</strong>是蛋白质相互作用数据库，是<em>Search Tool for the Retrieval of Interacting Genes/Proteins</em>的缩写，现在有373个物种的1513782个蛋白质。STRING把不同物种中的蛋白质定量关联起来。

官方网站: <a href="http://string.embl.de/" target="_blank">http://string.embl.de/</a>

参考文献:  <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;list_uids=17098935&amp;dopt=Abstract" class="normal_reference">von Mering et.al. 2007</a>  /  <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;list_uids=15608232&amp;dopt=Abstract" class="normal_reference">2005</a>  /  <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;list_uids=12519996&amp;dopt=Abstract" class="normal_reference">2003</a>  /  <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=PubMed&amp;list_uids=10982861&amp;dopt=Abstract" class="normal_reference">Snel et.al. 2000</a>.

最后搭车送2个Firefox插件，一个是<a href="http://biobar.mozdev.org/" target="_blank">BioBar</a>,整合了各大生物学数据库;另外一个是<a href="iHOPerator" target="_blank">iHOPerator</a>，用来定制iHOP的显示内容。
