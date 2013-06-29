---
layout: post
title: R:删除向量中的指定元素 Remove elements in a vector/list
tags:
- programming
- R
- vector
status: publish
type: post
published: true
meta:
  views: '996'
  _wp_old_slug: r%e5%88%a0%e9%99%a4%e5%90%91%e9%87%8f%e4%b8%ad%e7%9a%84%e6%8c%87%e5%ae%9a%e5%85%83%e7%b4%a0-remove-elements-in-a-vectorlist
---
<strong>R:删除向量中的指定元素</strong>

还是举例说明吧。

<font color="#3366ff">vector&lt;-c(1,3,5,7,9)</font>

#如果我想删除元素5

<font color="#3366ff">new_vector&lt;-vector[-3]</font>

#即下标用负号表示删除，后面的数字表示第几个元素。

题外话：不要和python混了,python里负数下标表示倒数第几个元素。例如:

[python]
#/usr/bin/python
list=[1,3,5,7,9]
print list[-3]
#输出结果是5
[/python]

<strong>附送1：删除data frame或matrix中的指定行或指定列</strong>
<pre><font color="#3366ff">vec1&lt;-c(1,3,5,7,9)
vec2&lt;-c(2,4,6,8,10)
frame&lt;-data.frame(vec1,vec2)
matrix&lt;-matrix(c(1, 3, 5, 7, 9, 2, 4, 6, 8, 10), ncol=5, byrow=TRUE)</font></pre>
<pre><font color="#3366ff">frame_without_row4&lt;-frame[-4, ]</font></pre>
<pre><font color="#3366ff">matrix_without_column2&lt;-matrix[,-2]</font></pre>
<strong>附送2：删除向量或data frame中的缺失值 (NA)</strong>

<font color="#3366ff">A&lt;-na.omit(A)</font>

#A可以是vector(list),data frame或matrix。如果A是data frame或matrix，则同一行如果有一个NA，这一行都会被删除

<strong>附送3：<a href="http://azalea.ztpala.com/?p=194" target="_blank">删除matrix中全是缺失值 (NA)的行或列</a></strong>

这个和附送2不同的是，只有在某行或某列全是NA时才删除，而2的方法是只要出现NA值，就把所在行全部删除。

这个比较复杂，单独撰文解决 :)

References:
<a href="http://www.mail-archive.com/r-help@stat.math.ethz.ch/msg79958.html" target="_blank">http://www.mail-archive.com/r-help@stat.math.ethz.ch/msg79958.html</a>
<a href="http://tolstoy.newcastle.edu.au/R/help/04/11/6887.html" target="_blank">http://tolstoy.newcastle.edu.au/R/help/04/11/6887.html</a>
