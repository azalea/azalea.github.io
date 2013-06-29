---
layout: post
title: 用R和BioConductor进行基因芯片数据分析(三)：计算median
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
  views: '1738'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
我们已经知道要分析的数据对每个基因有3个重复测定值，经过缺失值填充后，每个基因都有3个可用值。

这一步很简单，就是取这3个值的中位数，即median。

方法很多，在excel中可以用median函数;

在R中我写了以下代码进行操作：

<font color="#3366ff">get_median&lt;-function(i,j){
num_vec&lt;-c(imputeddata[i*3-2,j],imputeddata[i*3-1,j],imputeddata[i*3,j])
median(num_vec)
}
#A simple function to calculate median value of three replicates

dimrow&lt;-(dim(imputeddata)[1])/3
mediandata&lt;-matrix(data = NA, nrow =dimrow, ncol = dim(imputeddata)[2], byrow = TRUE, dimnames = NULL)
#Create a blank matrix to store median values

for (i in 1:dimrow){
for (j in 1:dim(imputeddata)[2]){
mediandata[i,j]&lt;-get_median(i,j)
}
}
#Assign median value using the function get_median()</font>

可能有更好的方法，欢迎留言讨论

现在我们得到了中位数的数据，储存在mediandata对象里，行数是缺失值填充数据imputeddata的1/3，double check一下：

&gt; dim(imputeddata)
[1] 11571    20
&gt; dim(mediandata)
[1] 3857   20
