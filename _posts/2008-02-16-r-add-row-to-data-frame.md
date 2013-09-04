---
layout: post
title: 'R: Add row to data frame'
tags:
- data frame
- programming
- R
status: publish
type: post
published: true
meta:
  views: '688'
---
添加许多列到data frame很简单:

<font color="#3366ff">df&lt;- (data.frame(ListOfColumns)</font>

然而，添加许多行却不能如此: (data.frame(ListOfRows)是行不通的

于是，我们要用函数 rbind()，每次添加一行，例如：

<font color="#3366ff">df&lt;-NULL </font>

<font color="#3366ff">df&lt;-rbind(df,data.frame(A=1,B="a",C=rnorm(1)))</font>

<font color="#3366ff">df&lt;-rbind(df, data.frame(A=2,B="b",C=rnorm(1)))</font>

<font color="#3366ff">df </font>

A   B          C
1   1 a  1.3540030
11  1 b -0.7229597

唯一的问题是行号是1,11,111...

于是

<font color="#3366ff">attr(df,"row.names") &lt;- 1:2</font>

References:

<a href="http://tolstoy.newcastle.edu.au/R/help/03b/7521.html" target="_blank">http://tolstoy.newcastle.edu.au/R/help/03b/7521.html</a>

<a href="http://tolstoy.newcastle.edu.au/R/help/03b/3626.html" target="_blank">http://tolstoy.newcastle.edu.au/R/help/03b/3626.html</a>