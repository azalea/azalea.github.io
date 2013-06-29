---
layout: post
title: R:把factor转换为numeric vector（数值向量，相当于列表）
tags:
- programming
- R
- vector
status: publish
type: post
published: true
meta:
  views: '604'
  _wp_old_slug: r%e6%8a%8afactor%e8%bd%ac%e6%8d%a2%e4%b8%banumeric-vector%ef%bc%88%e6%95%b0%e5%80%bc%e5%90%91%e9%87%8f%ef%bc%8c%e7%9b%b8%e5%bd%93%e4%ba%8e%e5%88%97%e8%a1%a8%ef%bc%89
---
R默认把字符串当做factor,如果你的数据是以字符串格式储存的，在进行计算前就需要转换。
方法是：
<font color="#3366ff">vector&lt;-as.numeric(as.character(factor))</font>
这里factor是要转换的数据字符串，vector是转换后的向量。

如果要转换完整的data frame，则：
<font color="#3366ff">DF &lt;- data.frame(let = letters[1:3], num = 1:3,stringsAsFactors = FALSE) </font>

R默认把字符串当做factor的原因据说是减少内存占用。如果想避免R在你没意识到的情况下把向量当成factor而引起不必要的麻烦，如果想一劳永逸地解决这个问题，<a href="http://tolstoy.newcastle.edu.au/R/e2/help/07/08/23425.html" target="_blank">有人建议</a>把stringsAsFactors的值改为TRUE。方法是：
<font color="#3366ff">options(stringsAsFactors = TRUE)</font> # in librarybaseRRprofile。

但也有人反对，说这会增加内存占用。我也不清楚了-,-
