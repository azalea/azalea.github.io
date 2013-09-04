---
layout: post
title: 用R和BioConductor进行基因芯片数据分析(六)：差异表达基因
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
  views: '2827'
  _searchme: '1'
---
经过一系列的预处理，包括缺失值填充，中位数计算以及归一化，我们的数据终于可以用啦。。

下面我们就来分析一下new population和old population的个体是否有差异表达基因。

判断一个基因是否差异表达有许多方法，最早使用的就是看log ratio的绝对值是否大于2,这种方法早已废弃。

下一个想到的也许是t-test，诚然t-test可以统计地判断一个基因是否差异表达，但是对于有数千数万基因的芯片来说，会有很高的错误发现率（False Discovery Rate, FDR)，如果 p value &lt; 0.05,则10000个基因里有500个基因实际没有差异表达而被误认为是差异表达。因此t-test方法需要改进。

于是 Westfall &amp; Young (1993) 提出了Step-down maxT and minP multiple testing procedures，大意就是比较几个group间有没有差异基因表达，就通过随机置换这些group的标记，相当于随机互换group的成员，模拟一个空分布(null distribution），以此计算调整后的p value，这个方法可以极大的减小Family-wise Error Rate (FWER).

以下分析就使用Step-down maxT and minP multiple testing procedures，需要求助于Bioconductor的multtest package的mt.maxT()函数。具体用法可通过help(mt.maxT)查看。

<font color="#3366ff">library(multtest)
classlabel&lt;-c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1)
maxttt&lt;-mt.maxT(norm_log_btw_array,classlabel,B=100000)</font>
默认随机置换次数B=10000，对于microarray来说B应该比10000大很多，所以这里取B=100000
以下是画图：
<font color="#3366ff"> rawp&lt;-maxttt$rawp[order(maxttt$index)]
plot(sort(rawp),type='p',col=1,ylim=c(-0.05,1.00),ylab='p value')
lines(sort(maxttt$adjp),type='p',col='red')
#min adj-p: sort(maxttt$adjp)[1] 0.0163
#rawp: &gt;sort(rawppp)[170]  [1] 0.0493 &gt; sort(rawppp)[171]  [1] 0.0502 170个raw p小于0.05
abline(h=0.05,col='blue')
text(1000,c(0.6,0.7),labels=c('raw p-value','adjusted p-value'),col=c('black','red'))
text(1000,0.08,labels='p=0.05',col='blue')</font>


![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/pvalue.jpg)
<font color="#3366ff">procs&lt;-c("Bonferroni","Holm","Hochberg","SidakSS","SidakSD","BH","BY")
adjps&lt;-mt.rawp2adjp(rawp,procs)
plot(sort(adjps$adjp[,1]),ylab='p value')
for (i in 2:8){
points(sort(adjps$adjp[,i]),col=i)
}
abline(h=0.05,col='blue')
text(1000,0.08,labels='p=0.05',col='blue')</font>


![](http://azaleasays.files.wordpress.com/2008/05/adjps.jpg)
<em>Significance Analysis of Microarrays</em>)分析。具体懒得写了，有兴趣的请看参考资料。。

参考资料：
课堂讲义：<a href="http://www.stat.psu.edu/%7Echiaro/BioinfoII_08/Diff_Expr.pdf"><span class="GramE">Differential expression</span></a><span class="GramE">.</span><strong> Identifying differentially expressed genes -- notions on multiple testing and p-value adjustments</strong>.
 
<span class="SpellE">Dudoit</span>, S., Yang, Y.H., Speed, T.P., and Callow, M.J. (2002), <a href="http://www.stat.berkeley.edu/users/sandrine/Docs/Papers/sinica.final.pdf">Statistical methods for identifying differentially expressed genes in replicated <span class="SpellE">cDNA</span> microarray experiments</a>,  <span class="SpellE"><em>Statistica</em></span><em> <span class="SpellE">Sinica</span></em> 12(1):111-139.
 
<span class="SpellE">Dudoit</span> S., Shaffer J.P., <span class="SpellE">Boldrick</span> J.C. (2003). <a href="http://www.stat.berkeley.edu/%7Esandrine/Docs/Papers/StatSci2003Final.pdf">Multiple hypothesis testing in microarray experiments</a>, <em>Statistical Science</em>, 18(1): 71-103.
 
<span class="GramE"><span class="SpellE">Efron</span></span> B., <span class="SpellE">Tibshirani</span>, R., Storey J.D., and <span class="SpellE">Tusher</span> V. (2001), <a href="http://links.jstor.org/sici?sici=0162-1459%28200112%2996%3A456%3C1151%3AEBAOAM%3E2.0.CO%3B2-W">Empirical <span class="SpellE">Bayes</span> analysis of a microarray experiment</a>, <em>Journal of the American Statistical Association</em> 96:1151-1160.
SAM (<em>Significance Analysis of Microarrays</em>)相关：<span class="SpellE">Tusher</span>, V.G., <span class="SpellE">Tibshirani</span>, R., and Chu, G. (2001) <a href="http://www-stat.stanford.edu/%7Etibs/SAM/pnassam.pdf">Significance analysis of microarrays applied to the ionizing radiation response</a>, <em>PNAS</em> 98:5116-5121.

<a href="http://www-stat.stanford.edu/%7Etibs/SAM/">SAM 网站</a>

FDR相关：Storey J.D. (2002), <a href="http://www.blackwell-synergy.com/links/doi/10.1111%2F1467-9868.00346"><span class="GramE">A</span> direct approach to false discovery rates</a>, JRSS-B 64(3):479-498.
