---
layout: post
title: Python下的lowess拟合
tags:
- programming
- python
- 统计
status: publish
type: post
published: true
meta:
  views: '783'
  _searchme: '1'
---
前段时间用<a href="http://azalea.ztpala.com/2008/05/05/microarray-data-analysis-using-r-and-bioconductor-step4-within-array-normalization/" target="_blank">R的lowess function</a>用得很爽，于是想用python也lowess一下。找到了这个东东：

<a href="http://mail.python.org/pipermail/python-list/2004-September/281365.html" target="_blank">http://mail.python.org/pipermail/python-list/2004-September/281365.html</a>

发现竟然是我崇拜的Istvan写的，是把R里lowess function的C代码包装成python代码。

<a href="http://azalea.ztpala.com/wp-admin/INSTALLATION%20------------%20%20On%20unix%20platforms%20SWIG%20is%20required.%20Type%20%20python%20setup.py%20build%20%20then%20%20python%20setup.py%20install%20%20On%20windows%20platforms%20copy%20the%20two%20files%20located%20in%20the%20win32%20directory%20to%20your%20python%20path,%20usually%20to%20the%20c:%5CPython23%5CLib%5Csite-packages%20directory.%20%20TESTING%20-------%20%20Run%20the%20runme.py%20file.%20%20LICENSE%20-------%20%20GNU%20GPL%20as%20required%20by%20the%20R%20project:%20http://www.r-project.org/">下载</a>后解压，安装：

Linux下：
<font color="#3366ff"> sudo apt-get install swig</font> #因为这个module依赖于swig (Generate scripting interfaces to C/C++ code)
<font color="#3366ff"> python setup.py build
python setup.py install</font>

Windows下：
把win32/2.3 子目录下的2个文件copy到python/site_packages目录

用法：
<font color="#3366ff"> import lowess
ys = lowess.fit(x=X, y=Y, F=F, NSTEPS=NSTEPS, DELTA=DELTA)</font>
具体请参考解压后文件夹中的 lowess_readme.txt

举例：
[python]
from pylab import *
import lowess
# 需要matplotlib module, 详见http://matplotlib.sourceforge.net/
length=[176, 218, 113, 102, 250, 309, 135, 150, 200, 263, 135, 114, 123, 118, 100, 109, 100, 94, 184, 303, 117, 80, 110, 108, 123, 85, 85, 138, 163, 184, 196, 225, 172, 199, 206, 118, 108, 98, 123, 99, 125, 124, 133, 95, 102, 93, 102, 85, 89, 89, 237, 236, 331, 173, 85, 257, 331, 111, 107, 120, 117, 116, 123, 111, 140, 221, 182, 111, 337, 191, 178, 177, 191, 205, 186, 135, 151, 195, 400, 249, 264, 207, 113, 153, 102, 208, 184, 107, 109, 187, 187, 333, 138, 160, 109, 377, 337, 213, 221, 206, 190, 215, 211, 411, 181, 226, 379, 167, 217, 154, 106, 73, 193, 295, 118, 117, 121, 168, 138, 124, 689, 163, 105, 122, 113, 143, 120, 139, 170, 198, 112, 100, 95, 100, 100, 93, 126, 92, 142, 103, 126, 132, 212, 221, 86, 124, 157, 174, 189, 133, 160, 111, 100, 106, 123, 104, 183, 107, 118, 103, 132, 226, 212, 199, 185, 359, 230, 195, 205, 221, 105, 115, 116, 221, 221, 377, 271, 272, 290, 126, 221, 132, 217, 98]
n, bins, patches = hist(length, 100, normed=0)
# Draw a histogram with 100 bins
# n is a list of frequency of each bin; bin is a list of the leftmost position of bins
# hist()具体参数详见http://matplotlib.sourceforge.net/matplotlib.pyplot.html#-hist
ys = lowess.fit(x=list(bins), y=list(n), F=0.2, NSTEPS=2, DELTA=0.2)
plot(list(bins),ys,c='r',linewidth=2)
# plot()具体参数详见http://matplotlib.sourceforge.net/matplotlib.pyplot.html#-plot
show()
[/python]

图：

![](https://dl.dropboxusercontent.com/u/308058/blogimages/2010/07/lowess.png)
<a href="http://biopython.org/DIST/docs/api/Bio.Statistics.lowess-module.html" target="_blank">Biopython的Statistics包也有lowess模块</a>，不会用-,-
