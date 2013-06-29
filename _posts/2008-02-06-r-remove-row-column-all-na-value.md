---
layout: post
title: R:删除matrix中全是缺失值 (NA)的行或列
tags:
- programming
- R
status: publish
type: post
published: true
meta:
  views: '707'
  _wp_old_slug: r%e5%88%a0%e9%99%a4matrix%e4%b8%ad%e5%85%a8%e6%98%af%e7%bc%ba%e5%a4%b1%e5%80%bc-na%e7%9a%84%e8%a1%8c%e6%88%96%e5%88%97
---
我们已经知道，用na.omit()命令可以删除NA。
但是我们希望，只有在某行或某列全是NA时才删除，而na.omit()所做的事是，只要出现NA值，就把所在行全部删除。
例如：
<font color="#3366ff"> testmatrix &lt;- matrix(nrow=6, ncol=4)
testmatrix[2:5,2:3] &lt;- seq(2)</font>
得到testmatrix
[,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA    1    1   NA
[3,]   NA    2    2   NA
[4,]   NA    1    1   NA
[5,]   NA    2    2   NA
[6,]   NA   NA   NA   NA
我们希望得到：
testmatrix
[,1] [,2]
[1,]   1    1
[2,]   2    2
[3,]   1    1
[4,]   2    2
方法是:
<font color="#3366ff"> tm1&lt;-testmatrix[,-which(apply(testmatrix,2,function(x)all(is.na(x))))]
tm2&lt;-tm1[-which(apply(testmatrix,1,function(x)all(is.na(x)))),]</font>
搞定
也可以合并以上2步：
<font color="#3366ff">testmatrix[-which(apply(testmatrix,1,function(x)all(is.na(x)))),
-which(apply(testmatrix,2,function(x)all(is.na(x))))]</font>

Reference:
<a href="http://www.mail-archive.com/r-help@stat.math.ethz.ch/msg92261.html" target="_blank">http://www.mail-archive.com/r-help@stat.math.ethz.ch/msg92261.html</a>
