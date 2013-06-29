---
layout: post
title: 用R和BioConductor进行基因芯片数据分析(二)：缺失值填充
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
  views: '3062'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
---
以下分析用到的数据可以<a href="http://dl.getdropbox.com/u/308058/blog/raw_data_3_replicates.txt" target="_blank">在这里</a>下载，这个数据来自关于基因对蝴蝶迁移性的研究，样本是20个蝴蝶个体，其中10个是当地固有个体(old)，另外10个是新迁入的个体(new)，old和new个体两两随机配对，分别用不同颜色染料（波长分别为555和647nm）标记后，在同一张基因芯片上杂交；此外，每个基因在每张芯片上都重复点样3次，因此此数据是有3个replicates及10张芯片的双通道芯片。数据是样点的信号强度值，没有经过标准化处理的。

拿到数据你会看到许多"NA"，这是因为我把缺失的空白值替换成NA了， 以便用R进行缺失值填充。

说到缺失值填充，通常有3种方法:

A. 用此基因的平均表达值填充；如果有多张重复芯片，可以取不同芯片上的平均值；对于时间序列芯片，可以通过差值法填充。---此方法很简单，也比较常用，但是效果不及下面2种方法

B. 基于<a href="http://en.wikipedia.org/wiki/Singular_value_decomposition" target="_blank">SVD</a>（即主成分分析)方法的填充：简单地讲，此方法是通过描述基因表达谱的几个基本模式来对缺失值进行填充。

C. 基于<a href="http://en.wikipedia.org/wiki/Nearest_neighbor_(pattern_recognition)" target="_blank">KNN</a>（最近邻）方法的填充： 此方法是寻找和有缺失值的基因的表达谱相似的其他基因，通过这些基因的表达值（依照表达谱相似性加权）来填充缺失值。KNN法是这3种方法里效果最好的，因此对本数据的缺失值用KNN法填充。

对以上3种方法的比较，这篇paper提供了清晰的说明: <span class="SpellE">Troyanskaya</span>, O., Cantor, M., Sherlock, G., Brown, P., Hastie, T., <span class="SpellE">Tibshirani</span>, R., Botstein, D., and Altman, R. B. (2001), <a href="http://bioinformatics.oupjournals.org/cgi/reprint/17/6/520.pdf">Missing value estimation methods for DNA microarrays</a>, <em>Bioinformatics</em> 17(6):520-525. 推荐大家看看

铺垫了这许多，下面开工分析数据啦

首先要安装<strong>最新版本的R</strong> 2.7.0，<a href="http://azaleasays.com/2008/05/01/microarray-data-analysis-using-r-and-bioconductor-step1-introduction/" target="_blank">上面一篇</a>里有下载地址。我之前用的2.5.1版本，安装下面的package有错误，所以强烈推荐最新版本

然后下载安装叫做<strong>impute</strong>的package，下载地址: <a href="http://bioconductor.fhcrc.org/packages/1.9/bioc/html/impute.html" target="_blank">http://bioconductor.fhcrc.org/packages/1.9/bioc/html/impute.html</a>

impute是专门用KNN法进行缺失值填充的R package，它的安装<a href="http://azaleasays.com/2008/05/01/install-r-packages/" target="_blank">如前文所述</a>:

如果是Linux下，就在shell输入: <span style="font-family:·s²Ó©úÅé;"><span style="color:#3366ff;">sudo R CMD INSTALL impute_1.6.0.tar.gz</span></span>

设置好当前工作目录(Windows是在R的菜单栏-&gt;工作目录...设置，Linux下用setwd()函数）

然后在R控制台输入以下代码:

<span style="color:#3366ff;">
library(impute)
#导入impute package
raw&lt;-read.table('raw_data_3_replicates.txt',header=TRUE)
rawexpr&lt;-raw[,-1]
#移除第一列ID列
if(exists(".Random.seed")) rm(.Random.seed)
#必须，如果没有这句话会出错，原因不知-,-请高手指教
imputed&lt;-impute.knn(as.matrix(rawexpr) ,k = 10, rowmax = 0.5, colmax = 0.8, maxp = 1500, rng.seed=362436069)
#impute.knn() 使用一个矩阵作为第一个参数，其他参数这里使用的是默认值
write.table(imputed$data,file='imputed_data.txt')
#write.table() 把数据保存在当前工作目录下的文件中，文件名用file=' '指定，这一步不是必须的
imputeddata&lt;-imputed$data
#imputed$data是在R中储存imputed后的数据的矩阵</span>

现在在R里输入imputed，即填充好的数据矩阵，是不是NA值全都没了？

OK,这一步就这样搞定啦

关于impute package的详细Documentation在<a href="http://rss.acs.unt.edu/Rdoc/library/impute/html/impute.knn.html" target="_blank">这里</a>

不放心，于是在下面再贴一遍，如果你不求甚解就不用看啦

<!--more-->
<table border="0" width="100%" summary="page for impute.knn {impute}">
<tbody>
<tr>
<td>impute.knn {impute}</td>
<td align="right">R Documentation</td>
</tr>
</tbody></table>
<h2>A function to impute missing expression data</h2>
<h3>Description</h3>
A function to impute missing expression data, using nearest neighbor averaging.
<h3>Usage</h3>
<pre>impute.knn(data ,k = 10, rowmax = 0.5, colmax = 0.8, maxp = 1500, rng.seed=362436069)</pre>
<h3>Arguments</h3>
<table border="0" summary="R argblock">
<tbody>
<tr valign="top">
<td><code>data</code></td>
<td>An expression matrix with genes in the rows, samples in the columns</td>
</tr>
</tbody></table>
<h3>Details</h3>
<code>impute.knn</code> uses <em>k</em>-nearest neighbors in the space of genes to impute missing expression values.

For each gene with missing values, we find the <em>k</em> nearest neighbors using a Euclidean metric, confined to the columns for which that gene is NOT missing. Each candidate neighbor might be missing some of the coordinates used to calculate the distance. In this case we average the distance from the non-missing coordinates. Having found the k nearest neighbors for a gene, we impute the missing elements by averaging those (non-missing) elements of its neighbors. This can fail if ALL the neighbors are missing in a particular element. In this case we use the overall column mean for that block of genes.

Since nearest neighbor imputation costs <em>O(p*log(p))</em> operations per gene, where <em>p</em> is the number of rows, the computational time can be excessive for large p and a large number of missing rows. Our strategy is to break blocks with more than <code>maxp</code> genes into two smaller blocks using two-mean clustering. This is done recursively till all blocks have less than <code>maxp</code> genes. For each block, <em>k</em>-nearest neighbor imputation is done separately. We have set the default value of <code>maxp</code> to 1500. Depending on the speed of the machine, and number of samples, this number might be increased. Making it too small is counter-productive, because the number of two-mean clustering algorithms will increase.

For reproducibility, this function reseeds the random number generator using the seed provided or the default seed (362436069).
<h3>Value</h3>
<table border="0" summary="R argblock">
<tbody>
<tr valign="top">
<td><code>data</code></td>
<td></td>
</tr>
</tbody></table>
{the state of the random number generator, if available, prior to the call to <code>set.seed</code>. Otherwise, it is <code>NULL</code>. If necessary, this can be used in the calling code to undo the side-effect of changing the random number generator sequence.}
<h3>Author(s)</h3>
Trevor Hastie, Robert Tibshirani, Balasubramanian Narasimhan, and Gilbert Chu
<h3>References</h3>
Hastie, T., Tibshirani, R., Sherlock, G., Eisen, M., Brown, P. and Botstein, D., Imputing Missing Data for Gene Expression Arrays, Stanford University Statistics Department Technical report (1999), http://www-stat.stanford.edu/~hastie/Papers/missing.pdf

Olga Troyanskaya, Michael Cantor, Gavin Sherlock, Pat Brown, Trevor Hastie, Robert Tibshirani, David Botstein and Russ B. Altman, Missing value estimation methods for DNA microarrays BIOINFORMATICS Vol. 17 no. 6, 2001 Pages 520-525
<h3>See Also</h3>
set.seed, save
<h3>Examples</h3>
<pre>data(khanmiss)khan.expr &lt;- khanmiss[-1, -(1:2)]

##

## First example

##

if(exists(".Random.seed")) rm(.Random.seed)

khan.imputed &lt;- impute.knn(as.matrix(khan.expr))

##

## khan.imputed$data should now contain the imputed data matrix

## khan.imputed$rng.seed should contain the random number seed used

## in imputation. In the above invocation, it is the default seed.

##

khan.imputed$rng.seed # should be 362436069

khan.imputed$rng.state # should be NULL

##

## Second example

##

set.seed(12345)

saved.state &lt;- .Random.seed

khan.imputed &lt;- impute.knn(as.matrix(khan.expr))

# Assuming all goes well with no guarantees in case of error...

.Random.seed &lt;- khan.imputed$rng.state

sum(saved.state - khan.imputed$rng.state) # should be zero!

save(khan.imputed, file="khanimputation.Rda")</pre>
<hr />
<p align="center">[Package <em>impute</em> version 1.8.0 <a href="http://rss.acs.unt.edu/Rdoc/library/impute/html/00Index.html">Index]</a></p>
