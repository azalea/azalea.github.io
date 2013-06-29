---
layout: post
title: 用R和BioConductor进行基因芯片数据分析(一)：R和BioConductor简介
tags:
- bioconductor
- microarray
- programming
- R
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _wp_old_slug: microarray-data-analysis-using-r-and-bioconductor-step1-missing-value-imputation
  views: '4201'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
<a href="http://www.r-project.org/about.html" target="_blank">R</a>是开源的统计计算和作图语言，与S语言很相似。R的语法与其他语言很相似，功能很强大，可以到<a href="http://www.r-project.org/screenshots/screenshots.html" target="_blank">这里看看截图</a>。主页是 <a href="http://www.r-project.org/" target="_blank">http://www.r-project.org/</a>
可以<a href="http://cran.r-project.org/src/base/R-2/R-2.7.0.tar.gz" target="_blank">点击这里</a>下载最新版R-2.7.0，<a href="http://cran.r-project.org/manuals.html" target="_blank">这里</a>有很权威的英文教程。本站提供<a href="http://dl.getdropbox.com/u/308058/blog/R.rar">几本中文教程</a>(pdf)的打包下载，更多的随便搜索一下就可以找到。

<a href="http://www.bioconductor.org/GettingStarted/" target="_blank">BioConductor</a>是建立在R语言环境上的生物芯片数据和基因组数据分析软件包，主页是 <a href="http://www.bioconductor.org/" target="_blank">http://www.bioconductor.org/</a>
BioConductor由许多package组成，可以全部安装，也可以单独安装。BioConductor的安装是在R控制台，输入：
<span style="color:#3366ff;">source("http://bioconductor.org/biocLite.R")</span>
<span style="color:#3366ff;">biocLite()</span>
更多安装设置请看<a href="http://www.bioconductor.org/download/" target="_blank">这里</a>
如果只想单独安装其中某些package，可以在<a href="http://bioconductor.fhcrc.org/packages/1.9/bioc/" target="_blank">http://bioconductor.fhcrc.org/packages/1.9/bioc/</a> 看到最新版BioConductor中所有package的列表。
BioConductor的使用文档可以在<a href="http://www.bioconductor.org/docs/" target="_blank">这里</a>找到，而<a href="http://www.bioconductor.org/docs/vignettes.html" target="_blank">这里</a>给出了其中package的简单使用方法。
